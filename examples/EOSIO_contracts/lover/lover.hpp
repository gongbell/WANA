/**
 *  @eosfans.io
 *  @author lome
 */

#include <eosiolib/eosio.hpp>
#include <string>

namespace eosio {

   using std::string;
   //所有智能合约继承contract类
   class love : public contract {
      public:
         //love类构造函数
         love( account_name self ):contract(self){}
         // @abi action 成员函数声明
         void say(account_name lover, string letter);

      private:
         // @abi table 私有数据成员声明
         struct lovel {
            account_name    lover;
            string          letter;
            //私有函数成员
            account_name primary_key()const { return lover; }
         };
         //数据库类型定义
         typedef eosio::multi_index<N(love), lovel> loves;
   };

} /// namespace eosio
EOSIO_ABI( eosio::love, (say) )