#include <eosiolib/asset.hpp>
#include <eosiolib/symbol.hpp>
#include <eosiolib/chain.h>
#include <eosiolib/time.hpp>
#include <eosiolib/eosio.hpp>
#include <cmath>

using namespace eosio;

const uint64_t one_minute = 1000000.0 * 60.0; 
const uint64_t five_minute = 1000000.0 * 60.0 * 5.0;
const uint64_t fifteen_minute = 1000000.0 * 60.0 * 15.0;
const uint64_t one_hour = 1000000.0 * 60.0 * 60.0;
const uint64_t four_hour = 1000000.0 * 60.0 * 60.0 * 4.0; 
const uint64_t one_day = 1000000.0 * 60.0 * 60.0 * 24.0; 
const uint64_t cronlag = 5000000; //give extra time for cron jobs
const uint64_t dequesize = 30;
const double returnsPrecision = 1000000.0;
const double pricePrecision = 1000000.0;
const uint64_t defaultVol = 600000;
int64_t defaultCorr = 1000000;
const double one_minute_scale = sqrt(252.0*24.0*(60.0/1.0));
const double five_minute_scale = sqrt(252.0*24.0*(60.0/5.0));
const double fifteen_minute_scale = sqrt(252.0*24.0*(60.0/15.0));
const double one_hour_scale = sqrt(252.0*24.0*(60.0/60.0));
const double four_hour_scale = sqrt(252.0*24.0*(60.0/(60.0*4.0)));
const double one_day_scale = sqrt(252.0*24.0*(60.0/(60.0*24.0)));

const  std::map <uint64_t, double> volScale {
         {one_minute,	    one_minute_scale},
         {five_minute,	  five_minute_scale},
         {fifteen_minute,	fifteen_minute_scale},
         {one_hour,	      one_hour_scale},
         {four_hour,	    four_hour_scale},
         {one_day,	      one_day_scale},
};

CONTRACT datapreproc : public eosio::contract {
 public:
  datapreproc(name receiver, name code, datastream<const char*> ds) : eosio::contract(receiver, code, ds) {}

//Types
  enum asset_type: uint16_t {
      fiat=1,
      cryptocurrency=2, 
      erc20_token=3, 
      eosio_token=4, 
      equity=5, 
      derivative=6, 
      other=7
  };

 //Holds the latest datapoints from qualified oracles
  TABLE datapoints {
    uint64_t id;
    name owner;
    uint64_t value;
    uint64_t median;
    uint64_t timestamp;

    uint64_t primary_key() const {return id;}
    uint64_t by_timestamp() const {return timestamp;}
    uint64_t by_value() const {return value;}

  };

    typedef eosio::multi_index<name("datapoints"), datapoints,
      indexed_by<name("value"), const_mem_fun<datapoints, uint64_t, &datapoints::by_value>>, 
      indexed_by<name("timestamp"), const_mem_fun<datapoints, uint64_t, &datapoints::by_timestamp>>> datapointstable;

  //Holds the list of pairs available in the oracle
  TABLE pairs {
    
    bool active = false;
    bool bounty_awarded = false;
    bool bounty_edited_by_custodians = false;

    name proposer;
    name aname;

    asset bounty_amount = asset(0, symbol("EOS",4));

    std::vector<name> approving_custodians;
    std::vector<name> approving_oracles;

    symbol base_symbol;
    uint64_t base_type;
    name base_contract;

    symbol quote_symbol;
    uint64_t quote_type;
    name quote_contract;
    
    uint64_t quoted_precision;

    uint64_t primary_key() const {return aname.value;}

  };

    typedef eosio::multi_index<name("pairs"), pairs> pairstable;

  //Holds the list of pairs to process
  TABLE pairtoproc {
    uint64_t id;
    name aname;

    symbol base_symbol;
    uint64_t base_type;
    name base_contract;

    symbol quote_symbol;
    uint64_t quote_type;
    name quote_contract;
    
    uint64_t quoted_precision;

    uint64_t primary_key() const {return id;}
    uint64_t by_name() const {return aname.value;}

  };

    typedef eosio::multi_index<name("pairtoproc"), pairtoproc, 
      indexed_by<name("aname"), const_mem_fun<pairtoproc, uint64_t, &pairtoproc::by_name>>> pairtoproctb;


  //Holds the time series of prices, returns, volatility and correlation
  TABLE statspre {
    uint64_t freq;
    uint64_t timestamp;
    std::deque<uint64_t> price;
    std::deque<int64_t> returns;
    std::map <symbol, int64_t> correlation_matrix;
    std::uint64_t vol = defaultVol;

    uint64_t primary_key() const {return freq;}

  };

  typedef eosio::multi_index<name("stats"), statspre> statstable;

//add to the list of pairs to process
ACTION addpair(name newpair) {
    
    //require_auth(_self);

    pairstable pairsname(name("oracle111111"), name("oracle111111").value);
    auto itr = pairsname.find(newpair.value);
    if ( itr != pairsname.end() ) { //pair must exist in the oracle
        pairtoproctb pairtoproc(_self,_self.value);
        auto pairtoprocn = pairtoproc.get_index<name("aname")>();
        auto it = pairtoprocn.find(newpair.value);
        if ( it == pairtoprocn.end() ) { //add pair if hasn't already been added
            pairtoproc.emplace(_self, [&](auto& o) {
            o.id = pairtoproc.available_primary_key();
            o.aname = newpair;
            o.base_symbol = itr->base_symbol;
            o.base_type = itr->base_type;
            o.base_contract = itr->base_contract;
            o.quote_symbol = itr->quote_symbol;
            o.quote_type = itr->quote_type;
            o.quote_contract = itr->quote_contract;
            o.quoted_precision = itr->quoted_precision;
            });
        };
   };
}

  //Clear the list of pairs to process
  ACTION clear() {  
  
    //require_auth(_self);
   
    pairtoproctb pairtoproc(_self,_self.value);

    while (pairtoproc.begin() != pairtoproc.end()) {
        auto itr = pairtoproc.end();
        itr--;
        pairtoproc.erase(itr);
    }

    pairstable pairsname(name("oracle111111"), name("oracle111111").value);
    for ( auto it = pairsname.begin(); it != pairsname.end(); it++ ) {
      statstable store(_self, it->aname.value);

      while (store.begin() != store.end()) {
          auto itr = store.end();
          itr--;
          store.erase(itr);
      };
    };

  }

  uint64_t get_last_price(name pair, uint64_t quoted_precision){

    uint64_t eosusd = 1;
    uint64_t eos_precision = 1;
    datapointstable dstoreos(name("oracle111111"), name("eosusd").value);
    auto newesteos = dstoreos.begin();
    if (newesteos != dstoreos.end()){
      pairtoproctb pairtoproc(_self,_self.value);
      auto pairtoprocn = pairtoproc.get_index<name("aname")>();
      auto eospair = pairtoprocn.get(name("eosusd").value);
      eos_precision = eospair.quoted_precision;
      eosusd = newesteos->median;
    }
    datapointstable dstore(name("oracle111111"), pair.value);
    auto newest = dstore.begin();
    if (newest != dstore.end()) {
        if (pair==name("eosusd"))
          return (uint64_t)(pricePrecision*(newest->median/std::pow(10.0,eos_precision)));
        else
          return (uint64_t)(pricePrecision*((newest->median/std::pow(10.0,quoted_precision)) * (eosusd/std::pow(10.0,eos_precision))));
    } else
        return 0;
  }

//  get median price and store in vector as a historical time series
  ACTION update(){
    
    getprices();
  }

//  get median price and store in deque as a historical time series
  void getprices(){

    pairtoproctb pairtoproc(_self,_self.value);
    
    pairstable pairsname(name("oracle111111"), name("oracle111111").value);
    
    for ( auto it = pairtoproc.begin(); it != pairtoproc.end(); it++ ) {
        auto itr = pairsname.find(it->aname.value);
        if ( itr != pairsname.end() ) { //pair must exist in the oracle
        uint64_t lastprice = get_last_price(it->aname, it->quoted_precision);
        eosio::print("pair to process: ", it->aname, "\n");
        store_last_price(it->aname, one_minute, lastprice);
        store_last_price(it->aname, five_minute, lastprice);
        store_last_price(it->aname, fifteen_minute, lastprice);
        store_last_price(it->aname, one_hour, lastprice);
        store_last_price(it->aname, four_hour, lastprice);
        store_last_price(it->aname, one_day, lastprice);
             
        };
    }
    
    for ( auto it = pairtoproc.begin(); it != pairtoproc.end(); it++ ) {
        auto itr = pairsname.find(it->aname.value);
        if ( itr != pairsname.end() ) { //pair must exist in the oracle
        uint64_t lastprice = get_last_price(it->aname, it->quoted_precision);
        calcstats(it->aname, one_minute);
        calcstats(it->aname, five_minute);
        calcstats(it->aname, fifteen_minute);
        calcstats(it->aname, one_hour);
        calcstats(it->aname, four_hour);
        calcstats(it->aname, one_day);
        };
    }
    for ( auto it = pairtoproc.begin(); it != pairtoproc.end(); it++ ) {
        auto itr = pairsname.find(it->aname.value);
        if ( itr != pairsname.end() ) { //pair must exist in the oracle
        uint64_t lastprice = get_last_price(it->aname, it->quoted_precision);
        averageVol(it->aname);
        averageCor(it->aname);
        };
    }
  }


  void averageVol(name aname){

    statstable store(_self, aname.value);
    auto itr = store.find(one_minute);
    uint64_t lastprice = itr->price[0];
    uint64_t vol1 = itr->vol;
    itr = store.find(five_minute);
    uint64_t vol2 = itr->vol;
    itr = store.find(fifteen_minute);
    uint64_t vol3 = itr->vol;
    itr = store.find(one_hour);
    uint64_t vol4 = itr->vol;
    itr = store.find(four_hour);
    uint64_t vol5 = itr->vol;
    itr = store.find(one_day);
    uint64_t vol6 = itr->vol;
    uint64_t vol = (uint64_t)(0.1*(double)vol1+0.1*(double)vol2+0.1*(double)vol3+0.1*(double)vol4+0.1*(double)vol5+0.5*(double)vol6);

          uint64_t ctime = current_time();
          itr = store.find(1);
          if (itr != store.end()){
            store.modify( itr, _self, [&]( auto& s ) {
            s.vol = vol;
            s.timestamp = ctime;
            s.price[0]=lastprice;
            });
          } else {
            store.emplace(_self, [&](auto& s) {
              s.freq=1;
              s.vol = vol;
              s.timestamp = ctime;
              s.price.push_front(lastprice);
            });
          };
/*
    auto itr = store.find(one_minute);
    if (itr != store.end()){
      auto itr = store.get(one_minute);
      uint64_t vol1 = itr.vol;
    }

    itr = store.find(five_minute);
    uint64_t vol2 = defaultVol;
    if (itr != store.end()){
      auto itr = store.get(five_minute);
      if (itr.vol != defaultVol)
        vol2 = itr.vol;
    }

    itr = store.find(fifteen_minute);
    uint64_t vol3 = defaultVol;
    if (itr != store.end()){
      auto itr = store.get(fifteen_minute);
      if (itr.vol != defaultVol)
        vol3 = itr.vol;
    }

    itr = store.find(one_hour);
    uint64_t vol4 = defaultVol;
    if (itr != store.end()){
      auto itr = store.get(one_hour);
      if (itr.vol != defaultVol)
        vol4 = itr.vol;
    }

    itr = store.find(four_hour);
    uint64_t vol5 = defaultVol;
    if (itr != store.end()){
      auto itr = store.get(four_hour);
      if (itr.vol != defaultVol)
        vol5 = itr.vol;
    }

    itr = store.find(one_day);
    uint64_t vol6 = defaultVol;
    if (itr != store.end()){
      auto itr = store.get(one_day);
      if (itr.vol != defaultVol)
        vol6 = itr.vol;
    }
    */
  }

void averageCor(name aname){

    statstable store(_self, aname.value);
    const auto obj = store.get(one_minute);
    std::map <symbol, int64_t> m1 = obj.correlation_matrix;
    for (std::pair<symbol, int64_t> it : m1){
      int64_t c1 = it.second;
      auto obj = store.get(five_minute);
      std::map <symbol, int64_t> m2 = obj.correlation_matrix;
      int64_t c2 = m2[it.first];
      obj = store.get(fifteen_minute);
      std::map <symbol, int64_t> m3 = obj.correlation_matrix;
      int64_t c3 = m3[it.first];
      obj = store.get(one_hour);
      std::map <symbol, int64_t> m4 = obj.correlation_matrix;
      int64_t c4 = m4[it.first];
      obj = store.get(four_hour);
      std::map <symbol, int64_t> m5 = obj.correlation_matrix;
      int64_t c5 = m5[it.first];
      obj = store.get(one_day);
      std::map <symbol, int64_t> m6 = obj.correlation_matrix;
      int64_t c6 = m6[it.first];
      int64_t corr = (int64_t)(0.1*(double)c1+0.1*(double)c2+0.1*(double)c3+0.1*(double)c4+0.1*(double)c5+0.5*(double)c6);
      uint64_t ctime = current_time();
      auto itr = store.find(1);
          if (itr != store.end()){
            store.modify( itr, _self, [&]( auto& s ) {
            s.correlation_matrix[it.first] = corr;
            s.timestamp = ctime;
            });
          } else {
            store.emplace(_self, [&](auto& s) {
              s.freq=1;
              s.correlation_matrix[it.first] = corr;
              s.timestamp = ctime;
            });
          };
    }
  }
  /* 
void averageCor(name aname){

    statstable store(_self, aname.value);
    int64_t c1 = defaultCorr;
    int64_t c2 = defaultCorr;
    int64_t c3 = defaultCorr;
    int64_t c4 = defaultCorr;
    int64_t c5 = defaultCorr;
    int64_t c6 = defaultCorr;
    auto itr = store.find(one_minute);
    if (itr != store.end()){
      const auto itr = store.get(one_minute);
      std::map <symbol, int64_t> m1 = itr.correlation_matrix;
    bool domodify = false;
    for (std::pair<symbol, int64_t> it : m1){
      domodify = true;
      c1 = it.second;
      auto itr = store.find(five_minute);
        if (itr != store.end()){
          auto itr = store.get(five_minute);
          std::map <symbol, int64_t> m2 = itr.correlation_matrix;
          if (!m2.empty())
            c2 = m2[it.first];
        }
      itr = store.find(fifteen_minute);
        if (itr != store.end()){
          auto itr = store.get(fifteen_minute);
          std::map <symbol, int64_t> m3 = itr.correlation_matrix;
          if (!m3.empty())
            c3 = m3[it.first];
        }
      itr = store.find(one_hour);
        if (itr != store.end()){
          auto itr = store.get(one_hour);
          std::map <symbol, int64_t> m4 = itr.correlation_matrix;
          if (!m4.empty())
            c4 = m4[it.first];
        }
      itr = store.find(four_hour);
        if (itr != store.end()){
          auto itr = store.get(four_hour);
          std::map <symbol, int64_t> m5 = itr.correlation_matrix;
          if (!m5.empty())
            c5 = m5[it.first];
        }
      itr = store.find(one_day);
        if (itr != store.end()){
          auto itr = store.get(one_day);
          std::map <symbol, int64_t> m6 = itr.correlation_matrix;
          if (!m6.empty())
            c6 = m6[it.first];
        }
      
      if (domodify){
          int64_t c = (int64_t)(corPrecision*(0.1*(double)c1/corPrecision+0.1*(double)c2/corPrecision+0.1*(double)c3/corPrecision+0.1*(double)c4/corPrecision+0.1*(double)c5/corPrecision+0.5*(double)c6/corPrecision));
          uint64_t ctime = current_time();
          auto itr = store.find(1);
          if (itr != store.end()){
            store.modify( itr, _self, [&]( auto& s ) {
            s.correlation_matrix[it.first] = c;
            s.timestamp = ctime;
            });
          } else {
            store.emplace(_self, [&](auto& s) {
              s.freq=1;
              s.correlation_matrix[it.first] = c;
              s.timestamp = ctime;
            });
          };
      }
    }   
    }  
    
  }
*/
    //  calculate vol and correlation matrix
  void calcstats(const name pair, const uint64_t freq){
    
          statstable store(_self, pair.value);
          auto itr = store.find(freq);
          if (itr != store.end()) {
            const auto& itrref = *itr;
            auto last = store.get(freq);
            uint64_t vol = defaultVol;
                if (size(last.price)>5)
                  vol = (uint64_t)(volScale.at(freq)*volCalc(last.returns, sizeof(last.returns)));
                store.modify( itrref, _self, [&]( auto& s ) {
                  s.vol = vol;
                });
                
            pairstable pairsname(name("oracle111111"), name("oracle111111").value);    
            pairtoproctb pairtoproc(_self,_self.value);    
            for ( auto jt = pairtoproc.begin(); jt != pairtoproc.end(); jt++ ) {
                auto jto = pairsname.find(jt->aname.value);
                if ( jto != pairsname.end() ) { //pair must exist in the oracle

                  statstable storej(_self, jt->aname.value);
                  auto jtr = storej.find(freq);
                  if (jtr != storej.end()) {
                    auto lastj = storej.get(freq);
                    int64_t corr = defaultCorr;
                    if (size(lastj.price)==size(last.price) && size(last.price)>5)
                      corr = corrCalc(last.returns, lastj.returns, sizeof(last.returns));
                    store.modify( itrref, _self, [&]( auto& s ) {
                      s.correlation_matrix[jt->base_symbol] = corr;
                    });
                      
                  }
                }
            }
          }
  }

// correlation coefficient
int64_t corrCalc(std::deque<int64_t> X, std::deque<int64_t> Y, uint64_t n) { 
  
    double sum_X = 0.0, sum_Y = 0.0, sum_XY = 0.0, x = 0.0, y = 0.0;
    double squareSum_X = 0.0, squareSum_Y = 0.0; 
  
    for (uint64_t i = 0; i < n; i++) 
    { 
        x = X[i]/returnsPrecision;
        y = Y[i]/returnsPrecision;
        sum_X = sum_X + x; 
        sum_Y = sum_Y + y; 
        sum_XY = sum_XY + x * y; 
        squareSum_X = squareSum_X + x * x; 
        squareSum_Y = squareSum_Y + y * y; 
    } 
    int64_t corr = (int64_t)(returnsPrecision)*(n * sum_XY - sum_X * sum_Y)  
                  / sqrt((n * squareSum_X - sum_X * sum_X)  
                      * (n * squareSum_Y - sum_Y * sum_Y)); 
    return corr; 
} 

double volCalc(std::deque<int64_t> returns, uint64_t n) {

     double variance = 0.0;
     double t = returns[0]/returnsPrecision;
     for (int i = 1; i < n; i++)
     {
          t += returns[i]/returnsPrecision;
          double diff = ((i + 1) * returns[i]/returnsPrecision) - t;
         
          variance += (diff * diff) / ((i + 1) *i);
     }
     //eosio::print("vol: ", (uint64_t)(volPrecision*sqrt(variance / (n - 1))), "\n");
     return (returnsPrecision*sqrt(variance / (n - 1)));
}

  
   //store last price from the oracle, append to time series
void store_last_price(const name pair, const uint64_t freq, const uint64_t lastprice){

    statstable store(_self, pair.value);

    auto itr = store.find(freq);
    uint64_t ctime = current_time();
    if (itr != store.end()) {
      auto last = store.get(freq);
      if (last.timestamp + freq - cronlag <= ctime){

        if (size(last.price)==dequesize){ // append to time series, remove oldest
          store.modify( itr, _self, [&]( auto& s ) {
            s.timestamp = ctime;
            uint64_t prevprice = s.price.back();
            s.price.push_back(lastprice);
            s.returns.push_back((int64_t)(returnsPrecision*(((double)lastprice/(double)prevprice)-1.0)));
            s.price.pop_front();
            s.returns.pop_front();
          });
        } else { // append to time series, don't remove oldest
          store.modify( itr, _self, [&]( auto& s ) {
            s.timestamp = ctime;
            uint64_t prevprice = s.price.back();
            s.price.push_back(lastprice);
            s.returns.push_back((int64_t)(returnsPrecision*(((double)lastprice/(double)prevprice)-1.0)));
          });
        }
      
      } else { // too early so just overwrite latest point
          store.modify( itr, _self, [&]( auto& s ) {
            s.price.back() = lastprice;
            if (s.price.size() > 1)
              s.returns.back() = (int64_t)(returnsPrecision*(((double)lastprice/(double)s.price[s.price.size()-2])-1.0));
          });
      };
    } else { // first data point

          store.emplace(_self, [&](auto& s) {
            s.freq=freq;
            s.timestamp = ctime;
            s.price.push_front(lastprice);
          });
    
    }

  }

};

extern "C" {
    void apply(uint64_t receiver, uint64_t code, uint64_t action) {
        if(code==receiver)
        {
            switch(action)
            {
                EOSIO_DISPATCH_HELPER(datapreproc, (update)(addpair)(clear))
            }
        }
       // else if(code=="eosio.token"_n.value && action=="transfer"_n.value) {
       //     execute_action( name(receiver), name(code), &datapreproc::transfer);
      //  }
    }
}