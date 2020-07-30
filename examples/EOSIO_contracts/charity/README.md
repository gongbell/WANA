# charity
一个简单的EOS智能合约，演示合约收到捐款消息时，给捐款者回馈10倍于捐赠额的CHC慈善代币：

A very simple smart contract of EOS, to demo action processing: when received donation message, issue 10x CHC (Charity Token) to donater.

1. 转账时消息通知、处理机制

   Message notificaiton and handling mechanism when transfer token via eosio.token contract

2. 持久化存储

   Persistent storage

3. 合约内调用另一个合约的接口

   Call action of another smart contract

有3点值得参考：

3 points for reference:

1. 修改EOSIO_ABI，使其能够处理转发过来的通知消息。

   Modify EOSIO_ABI macro, to handle the notification sent by eosio.token contract 

````C++
#define EOSIO_ABI_EX( TYPE, MEMBERS ) \
extern "C" { \
   void apply( uint64_t receiver, uint64_t code, uint64_t action ) { \
      auto self = receiver; \
      if( action == N(onerror)) { \
         /* onerror is only valid if it is for the "eosio" code account and authorized by "eosio"'s "active permission */ \
         eosio_assert(code == N(eosio), "onerror action's are only valid from the \"eosio\" system account"); \
      } \
      if( ((code == self && action != N(transfer) ) || (code == N(eosio.token) && action == N(transfer)) || action == N(onerror)) ) { \
         TYPE thiscontract( self ); \
         switch( action ) { \
            EOSIO_API( TYPE, MEMBERS ) \
         } \
         /* does not allow destructor of thiscontract to run: eosio_exit(0); */ \
      } \
   } \
}
````

2. 使用自增主键

   Auto increment primary key

````c++
    trans_table.emplace(_self, [&](auto &s) {
        s.id = trans_table.available_primary_key();
        s.from = from;
        s.to = to;
        s.quantity = quantity;
        s.memo = memo;
    });

````

3. 要使合约内部可以调用另一个合约的接口，对应的账号必须增加contract@eosio.code的授权
   本例需要charity对自己active权限增加charity@eosio.code的授权
   
   To enable the function that a smart contract to call another contract action interface, the caller account should grant the permission to the smart contract (contract@eosio.code)
   
   ````bash
   cleos set account permission charity active '{"threshold": 1,"keys": [{"key": "EOS7ijWCBmoXBi3CgtK7DJxentZZeTkeUnaSDvyro9dq7Sd1C3dC4","weight": 1}],"accounts": [{"permission":{"actor":"charity","permission":"eosio.code"},"weight":1}]}' owner -p charity
   ````

eosio.code权限更多内容请参考https://github.com/EOSIO/eos/issues/3050

For more information of eosio.code, please refer to https://github.com/EOSIO/eos/issues/3050
