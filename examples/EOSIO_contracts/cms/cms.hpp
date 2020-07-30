#include <eosiolib/eosio.hpp>
#include <string>

namespace eosio {
using std::string;
  class netkiller : public contract {
     public:
           netkiller( account_name self ):contract(self){}

           [[eosio::action]] void create(account_name author, string title, string content);
           [[eosio::action]] void change(account_name author, uint64_t id, string title, string content);
           [[eosio::action]] void remove(account_name author, uint64_t id);
           [[eosio::action]] void query(account_name author, uint64_t id);
           [[eosio::action]] void find(uint64_t id);

     private:

           struct article {
                 uint64_t     id;
                 account_name author;
                 string       title;
                 string       content;

                 uint64_t primary_key()const { return id; }
                 account_name get_author() const { return author; }

                 EOSLIB_SERIALIZE(article, (id)(author)(title)(content))
           };
           typedef eosio::multi_index<N(articles), article, indexed_by<N(byauthor), const_mem_fun<article, account_name, &article::get_author>> > table;
  };
}
