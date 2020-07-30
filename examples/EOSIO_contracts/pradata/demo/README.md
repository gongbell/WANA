
# demo

## sample codes:

```
        #include "../pradata.hpp"

        using namespace prochain;

        //声明rating.pra的trating表
        rating_index list(N(rating.pra), N(rating.pra));

        //检查账号是否存在
        auto check = list.find(account);

        //trating表中存储了全量链上合约账号，并实时更新
        //如果找不到，则该账号是普通账号
        if (check != list.end())
        {
            //获取账号类型：普通账号 或 合约账号
            uint8_t account_type = check->account_type;
            //此处可应用场景：拒绝合约账号调用

            //获取普通账号的评分
            if (account_type == normal_account)
            {
                uint8_t account_level = check->normal_account_level;
                //此处可应用场景：拒绝黑名单账号、羊毛党账号、灰名单账号调用
                //此处可应用场景：用户免人机滑块验证
            }
            //获取合约账号的评分
            else if (account_type == code_account)
            {
                uint8_t account_level = check->code_account_level;
                //此处可应用场景：拒绝恶意合约账号调用
            }
        }
        else
        {
            //普通账号默认评分
            uint8_t account_level = ACCOUNT_LEVEL_DEFAULT;
        }
```