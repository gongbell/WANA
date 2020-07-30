#include "pradata.hpp"

using eosio::action;
using eosio::permission_level;
using namespace eosio;

using namespace prochain;
//{

#define RATING_CONTRACT N(rating.pra)

class pradata : public contract
{

  public:
    explicit pradata(account_name self) : contract(self){};

    /**
    * @brief  get account info 检查账号信息
    *  
    * @param account  account name to be checked 账号名称
    */
    // @abi action
    void check(const account_name &account)
    {
        eosio_assert(is_account(account), "account is not valid");

        //声明rating.pra的trating表
        rating_index list(RATING_CONTRACT, RATING_CONTRACT);

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

    /**
    * @brief  Call Back API: check account is black or not 回调接口：检查账号是否在黑名单
    *  
    * @param account      account name to be checked 账号名称
    * @param notifyaccnt  call back, send check result to notify account 回调通知账号
    * @param notifyfunc   call back, send check result to notify function 回调通知函数
    */
    //@abi action
    void checkblack(const account_name &account, const account_name &notifyaccnt, std::string notifyfunc)
    {
        require_auth(notifyaccnt);

        //声明rating.pra的trating表
        rating_index ratinglist(RATING_CONTRACT, RATING_CONTRACT);

        //检查账号是否存在
        auto iter = ratinglist.find(account);

        //trating表中存储了全量链上合约账号，并实时更新
        //如果找不到，则该账号是普通账号
        if (iter != ratinglist.end())
        {
            bool isblack = false;

            //根据账号类型判断是否为黑名单账号
            //check account type and account level
            if (iter->account_type == normal_account)
            {
                if (iter->normal_account_level == BP_BLACKLIST || iter->normal_account_level == PRABOX_BLACKLIST)
                {
                    isblack = true;
                }
            }
            else
            {
                if (iter->code_account_level == BP_BLACKLIST || iter->code_account_level == MALICIOUS_CODE_ACCOUNT)
                {
                    isblack = true;
                }
            }

            //found the account is black
            if (isblack)
            {
                //回调通知结果
                action(permission_level{_self, N(active)},
                       N(notifyaccnt),
                       N(notifyfunc),
                       std::make_tuple(account, std::string(RESULT_FOUND)))
                    .send();
            }
        }
        else
        {
            //回调通知结果
            action(permission_level{_self, N(active)},
                   N(notifyaccnt),
                   N(notifyfunc),
                   std::make_tuple(account, std::string(RESULT_NOTFOUND)))
                .send();
        }
    }

    //@abi action
    void addrating(const Rating &rating)
    {
        require_auth(_self);

        eosio_assert(is_account(rating.account), "rating account is not valid");
        eosio_assert(rating.account_type >= 0 && rating.account_type < account_type_count, "rating account type is not valid");

        rating_index ratinglist(RATING_CONTRACT, RATING_CONTRACT);
        auto iter = ratinglist.find(rating.account);
        if (iter == ratinglist.end())
        {
            ratinglist.emplace(_self, [&](auto &r) {
                r.account = rating.account;
                r.account_type = rating.account_type;
                r.normal_account_level = rating.normal_account_level;
                r.code_account_level = rating.code_account_level;
            });
        }
        else
        {
            ratinglist.modify(iter, 0, [&](auto &r) {
                r.account_type = rating.account_type;
                r.normal_account_level = rating.normal_account_level;
                r.code_account_level = rating.code_account_level;
            });
        }
    }

    //@abi action
    void delrating(const Rating &rating)
    {
        require_auth(_self);

        rating_index ratinglist(RATING_CONTRACT, RATING_CONTRACT);
        auto iter = ratinglist.find(rating.account);
        if (iter != ratinglist.end())
        {
            ratinglist.erase(iter);
        }
    }

    // @abi action
    void logreceipt(const account_name &account, const uint8_t &account_type, const uint8_t &account_level)
    {
        require_auth(_self);
    }


    //@abi aciton
    void addrelate(const account_name &account, const account_name & teacher_account)
    {
         require_auth(account);
         eosio_assert(is_account(teacher_account), "teacher account is not valid");

        relation_index relationlist(RATING_CONTRACT, RATING_CONTRACT);
        auto iter = relationlist.find(account);
        if (iter == relationlist.end())
        {
            relationlist.emplace(_self, [&](auto &r) {
                r.account = account;
                r.teacher_account = teacher_account;
            });
        }
        else
        {
            eosio_assert(0, "teacher relation already exist");
        }
    }

    //@abi action
    void changerelate()
    {
        //todo
    }


};



EOSIO_ABI(pradata, (checkblack)(addrating)(delrating)(check)(logreceipt)(addrelate))

//} // namespace prochain