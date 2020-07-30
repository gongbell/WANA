#include <eosiolib/eosio.hpp>
#include <string>

using namespace std;

namespace eosio {
class test_da : public contract {
     public:
           test_da( account_name self ):contract(self){}

           // @abi action
           void create(account_name user, string title, string content);
           void change(account_name user, uint64_t post_id, string title, string content);
           void dele(account_name user, uint64_t post_id);
           void getd(uint64_t post_id, account_name user);

     private:
           // @abi table data i64
           struct da {
                 uint64_t     post_id;
                 account_name poster;
                 string       title;
                 string       content;

                 uint64_t primary_key()const { return post_id; }
                 account_name get_poster() const { return poster; }

                 EOSLIB_SERIALIZE(da, (post_id)(poster)(title)(content))
           };
           typedef eosio::multi_index<N(data), da, indexed_by<N(byposter), const_mem_fun<da, account_name, &da::get_poster>> > das;
  };
} /// namespace eosio
