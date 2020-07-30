#include <eosiolib/eosio.hpp>
#include <eosiolib/asset.hpp>
#define EOS_SYMBOL symbol("EOS", 4)

namespace eosio {
  using std::string;
  class [[eosio::contract]] salescon : public eosio::contract {
    
    public:
      salescon(name receiver, name code,  datastream<const char*> ds): contract(receiver, code, ds), _item(_code, _code.value),
      _config(_code, _code.value), _agreement(_code, _code.value) {}

      [[eosio::action]]
      void init(name seller, name buyer, name intermediator);

      [[eosio::action]]
      void setitem(std::string itemName, asset itemPrice);

      [[eosio::action]]
      void itemreceived();

      [[eosio::action]]
      void transfer(name from, name to, asset quantity, string memo);

      [[eosio::action]]
      void withdraw(name to);

      [[eosio::action]]
      void retract(name retractor);
      
      [[eosio::action]]
      void finalretract(bool buyerIsRight);

      [[eosio::action]]
      void changeseller(name newSeller);

      struct [[eosio::table]] agreestruct {
        uint64_t key;
        bool sellerRetract;
        bool buyerRetract;
        bool intermediatorRetract;
        uint64_t primary_key() const { return key; }
      };

      struct [[eosio::table]] configstruct {
        uint64_t key;
        bool itemSet;
        bool itemPaid;
        bool itemReceived;
        bool contractIsClosed;
        bool contractRetracted;
        bool buyerIsPaidBack;
        asset balance;
        name seller;
        name buyer;
        name intermediator;
        uint64_t primary_key() const { return key; }
      };

      struct [[eosio::table]] itemstruct {
        uint64_t key;
        std::string itemName;
        asset itemPrice;
        uint64_t primary_key() const { return key; }
      };

    private: 
      typedef eosio::multi_index<"config"_n, configstruct> configstr;
      typedef eosio::multi_index<"agreement"_n, agreestruct> agreementstr;
      typedef eosio::multi_index<"item"_n, itemstruct> itemstr;

      configstr _config;
      agreementstr _agreement;
      itemstr _item;

      configstruct getConfig();
      agreestruct getAgreement();
      void setItemIsSetFlag(bool value, name payer);
      void setItemIsPaidFlag(bool value, name payer);
      void setItemReceivedFlag(bool value, name payer);
      void setContractClosedStatus(bool value, name payer);
      void setRetractStatus(bool value, name payer);
      void setBuyerPaidBack(bool value, name payer);
      void setBalance(asset value, name payer);
      void configureRetractedState(bool buyerIsRight);
      void sellerRetract(name seller);
      void buyerRetract(name buyer);
      void intermediatorRetract(name intermediator);
      void sendTokens(name to, asset price);
      void itempaid(name payer);
      void assertInitialized();
      void assertItemSet();
      void assertItemReceived();
      void assertItemPaid();
      void assertPaymentGreaterOrEqualToPrice(uint64_t value);
      void assertRetractStatus(bool status);
      void assertContractClosedStatus(bool status);
      void assertMarkedAsRetracted();
      name getSeller();
      name getBuyer();
      name getIntermediator();
      asset getPrice();
    };
}