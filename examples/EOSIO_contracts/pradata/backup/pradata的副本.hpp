#pragma once
#include <eosiolib/eosio.hpp>
#include <string>
#include <eosiolib/contract.hpp>

namespace prochain
{



struct AdRelation
{
    account_name account;
    account_name teacher_account;
    uint64_t primary_key() const { return account; }
    EOSLIB_SERIALIZE(AdRelation, (account)(teacher_account));
};
typedef eosio::multi_index<N(ad_relation), AdRelation> relation_index;


// @abi table trating i64
struct Rating
{
    account_name account;         //eos account name, 账号名称
    uint8_t account_type;         //enum_account_type: 0, normal account; 1, code account;  账号类型：0, 普通账号; 1, 合约账号;
    uint8_t normal_account_level; //rating level for normal account, from 0 to 10 普通账号评分：从0到10，分数越低，账号属性越差，默认是5
    uint8_t code_account_level;   //rating level for code account, from 0 to 10 合约账号评分：从0到10，分数越低，账号属性越差，默认是5

    uint64_t primary_key() const { return account; }
    EOSLIB_SERIALIZE(Rating, (account)(account_type)(normal_account_level)(code_account_level));
};
typedef eosio::multi_index<N(trating), Rating> rating_index;

//account type 账号类型
enum enum_account_type
{
    normal_account = 0, // 0: normal account 普通账号
    code_account,       // 1: code account 合约账号
    account_type_count
};

//level defined for both normal and code account 普通账号和合约账号共用评分
uint8_t ACCOUNT_LEVEL_DEFAULT = 5;  //账号默认评分，5分
uint8_t BP_BLACKLIST = 0;           //被ECAF或BP拉黑的账号，0分；数据源详见https://bloks.io/blacklist

//level defined for normal account 普通账号评分
uint8_t PRABOX_BLACKLIST = 2;       //被PRA CandyBox拉黑的羊毛党账号，2分
uint8_t PRABOX_GREYLIST = 3;        //被PRA CandyBox加灰的疑似羊毛党账号，3分
uint8_t PRABOX_AUTH_VERYFIED = 6;   //在24小时内，通过PRA CandyBox人机滑块验证的账号，6分
uint8_t PRABOX_KYC_VERYFIED = 6;    //通过PRA KYC人脸比对验证的账号，6分

//level defined for code account  合约账号评分
uint8_t MALICIOUS_CODE_ACCOUNT = 0; //已知恶意合约账号，如实施过合约攻击行为，0分

//call back results 回调结果
std::string RESULT_FOUND = "FOUND";       //找到账号
std::string RESULT_NOTFOUND = "NOTFOUND"; //未找到账号

} // namespace prochain