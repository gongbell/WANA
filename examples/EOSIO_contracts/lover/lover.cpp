/**
 *  @eosfans.io
 *  @author lome
 */

#include <lover/lover.hpp>


namespace eosio{

//定义函数
void love::say(account_name lover, string letter)
{
    //验证权限
    require_auth( _self );
    // 定义loves类型
    loves lovetable( _self, lover);
    //查询lover是否存在， 如果存在则assert
    auto exit = lovetable.find(lover);
    eosio_assert(exit == lovetable.end(), "You love has been said!");
    //构造loves
    lovetable.emplace( _self, [&]( auto& s ) {
        s.lover = lover;
        s.letter = letter;
    });

}
}/// namespace eosio
