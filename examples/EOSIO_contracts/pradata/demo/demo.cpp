#include <eosiolib/asset.hpp>
#include <eosiolib/eosio.hpp>
#include <eosiolib/types.hpp>
#include <iostream>
#include "../pradata.hpp"

using namespace eosio;
using namespace prochain;

class demo : public contract
{
  public:
    demo(account_name self) : contract(self){};

    // @abi action
    void check(const account_name &account)
    {
        eosio_assert(is_account(account), "account is not valid");

        //声明rating.pra的trating表
        rating_index list(N(rating.pra), N(rating.pra));

        //检查账号是否存在
        auto check = list.find(account);

        //trating表中存储了全量链上合约账号，并实时更新
        //如果找不到，则该账号是普通账号
        if (check != list.end())
        {
            //获取账号类型：普通账号 或 合约账号
            auto account_type = check->account_type;
            //此处可应用场景：拒绝合约账号调用

            //获取普通账号的评分
            if (account_type == normal_account)
            {
                //此处可应用场景：拒绝黑名单账号、羊毛党账号、灰名单账号调用
                //此处可应用场景：用户免人机滑块验证
                action(
                    permission_level{_self, N(active)},
                    _self, N(logreceipt), std::make_tuple(account, account_type, check->normal_account_level))
                    .send();
            }
            //获取合约账号的评分
            else if (account_type == code_account)
            {
                //此处可应用场景：拒绝恶意合约账号调用
                action(
                    permission_level{_self, N(active)},
                    _self, N(logreceipt), std::make_tuple(account, account_type, check->code_account_level))
                    .send();
            }
        }
        else
        {
            //普通账号默认评分
            action(
                permission_level{_self, N(active)},
                _self, N(logreceipt), std::make_tuple(account, normal_account, ACCOUNT_LEVEL_DEFAULT))
                .send();
        }
    }

    // @abi action
    void logreceipt(const account_name &account, const uint8_t &account_type, const uint8_t &account_level)
    {
        require_auth(_self);
    }
};

EOSIO_ABI(demo, (check)(logreceipt));
