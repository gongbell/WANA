/**
 *  @file
 *  @copyright defined in eos/LICENSE.txt
 */
#include <eosiolib/eosio.hpp>
#include <eosiolib/types.hpp>
#include <eosiolib/db.h>
#include <eosiolib/multi_index.hpp>
#include <eosiolib/crypto.h>
#include <eosiolib/asset.hpp>

using namespace eosio;
using eosio::asset;
using std::string;
typedef account_name    panda_type;

#define DIAMONDDAN  0
#define GOLDENDAN   25
#define SILVERDAN   15
#define BRONZEDAN   10
#define NORMALDAN   10

#define DIAMONDMAX  400
#define GOLDENMAX   4000
#define SILVERMAX   20000
#define SECONDSADAY 86400
#define SHOWDAYS    7
#define DEBUG    0
#define LENINT32 16
#define LENINT64 24
#define SKILLS   23
#define SKILLLEN 24
#define BITS    4
#define HASHNUM 10

// to a skill, only once for the times, so we don't need to clear it first
#define BSETLEVEL(dst, value)   (dst &= ~((char)0x3  << 2), \
                                 dst |= ((char)value << 2))
#define BSETTIMES(dst, value)   (dst |= (char)value)
#define BGETLEVEL(dst)          ((dst >> 2) & 0x3)
#define BGETTIMES(dst)          (dst & 0x3)

#define     PACKED(X)   __attribute((packed)) X
//#define   ALIGNED(X)  __attribute__ ((aligned (16))) X

namespace pandafun
{
    static const account_name code_account = N(pandafuncode);
    static const account_name auth_account = N(pandafunauth);
    static const account_name admin_account = N(pandafungame);
    static const panda_type normal_type = N(normal);
    static const panda_type copper_type = N(bronze);
    static const panda_type silver_type = N(silver);
    static const panda_type gold_type = N(golden);
    static const panda_type diamond_type = N(diamond);

    enum _contract_status
    {
        RUNNING = 0,
        PAUSED = 1,
    };
    enum _user_status
    {
        NORMAL = 0,
        BLOCKD = 1,
    };
    enum _skills
    {
        DICE_GOD = 0,
        TRANSMISSION = 1,
        ROAD_BLOCK = 2,
        SPEED_UP = 3,
        SWITCH_LOCATION = 4,
        CLEAR_ALL = 5,
        AVERAGE_CASH = 6,
        FORCE_GET = 7,
        FORCE_BUY = 8,
        DEFENSE = 9,
        FORCE_DISMANTLING = 10,
        SPEED_DOWN = 11,
        ATTACK = 12,
        FREEZE = 13,
        VACATION = 14,
        DISCONTINUANCE_BUSINESS = 15,
        TAX = 16,
        COLLECT_LAND = 17,
        ADDITION = 18,
        ROBBERY = 19,
        BURGLARY = 20,
        LITIGATION = 21,
        RISE_PRICE = 22,
        INNER_DAN = 23,
        UPPER_BOUND
    };
    struct struct_skills
    {
        int32_t top_level;
    };
    static struct_skills skills[23] =
    {
        {1}, {1}, {1}, {1}, {1}, {1}, {1}, {1}, {1}, {1},
        {3}, {3}, {3}, {3}, {3}, {3}, {3}, {3}, {3}, {3},
        {3}, {3}, {3}
    };

    // @abi table pandas, no @, or cannot compile it, shit
    // or we don't contain the array when generating the abi file, later we
    // add it to the abi file
    struct PACKED(panda_rec)
    {
        uint64_t id;    // key, panda id
        panda_type type;
        // each byte saves a skill, array's index 0 saves the skill with id 0,
        // the last extra one for inner_dan
        // from the right of each byte, 0-1 save the times, 2-3 saves the level
        uint8_t skills[SKILLLEN];

        auto primary_key() const { return id; }
        EOSLIB_SERIALIZE( panda_rec, (id)(type)(skills) )
    };
    // @abi table selling, save the pandas are selling, don't need to add a field
    // on panda_rec
    struct PACKED(selling_rec)
    {
        uint64_t id;    // key, panda id
        panda_type type;
        uint8_t skills[SKILLLEN];
        asset price;
        auto primary_key() const { return id; }
        EOSLIB_SERIALIZE( selling_rec, (id)(type)(skills)(price) )
    };
    // @abi table assets, save the kongfu books and so on, under each account
    struct PACKED(asset_rec)
    {
        uint64_t id;
        uint64_t txnid;
        int32_t candles;
        int32_t peace_tea;
        int32_t books;
        auto primary_key() const { return id; }
        EOSLIB_SERIALIZE( asset_rec, (id)(txnid)(candles)(peace_tea)(books) )
    };
    // @abi table results, save the play result, under pandafun scope, player and panda: id
    struct PACKED(result_rec)
    {
        uint64_t id;
        account_name player1;
        uint64_t panda1;
        account_name player2;
        uint64_t panda2;
        account_name player3;
        uint64_t panda3;
        account_name winner;
        uint64_t gameid;
        asset  in;
        uint32_t starttime;
        uint32_t endtime;
        auto primary_key() const { return id; }
        EOSLIB_SERIALIZE( result_rec, (id)(player1)(panda1)(player2)(panda2)(player3)(panda3)(winner)(gameid)(in)(starttime)(endtime) )
    };
    // @abi table hashs, save the hash value for generating random number, pray, upgrade, transform
    // Carry the next hash with the local random number, will update the hash
    struct PACKED(hash_rec)
    {
        uint64_t id;
        checksum256 hash;
        checksum256 srvhash;
        uint64_t txnid;
        auto primary_key() const { return id; }
        EOSLIB_SERIALIZE( hash_rec, (id)(hash)(srvhash)(txnid) )
    };
    // @abi table dice, save the dice value, under each user scope
    struct PACKED(dice_rec)
    {
        uint64_t id;
        uint64_t txnid;
        int32_t value;  // -1 on failure
        auto primary_key() const { return id; }
        EOSLIB_SERIALIZE( dice_rec, (id)(txnid)(value) )
    };
    // @abi table pray, store the pray result for querying, store the panda to the user table directly
    struct PACKED(pray_rec)
    {
        uint64_t panda_id;
        panda_type type;
        uint8_t skills[SKILLLEN];
        uint64_t txnid;
        char success;    // 1: success, 0: failure
        auto primary_key() const { return panda_id; }
        EOSLIB_SERIALIZE(pray_rec, (panda_id)(type)(skills)(txnid)(success) );
    };
    // @abi table upgrade, save the upgrade value, under each user scope
    // for background query, save the new level to the table when succeeded
    struct PACKED(upgrade_rec)
    {
        uint64_t id;
        uint64_t txnid;
        char newlevel;
        char success;    // 1: success, 0: failure
        auto primary_key() const { return id; }
        EOSLIB_SERIALIZE( upgrade_rec, (id)(txnid)(newlevel)(success) )
    };
    // @abi table transform, save the transform value, under each user scope
    struct PACKED(transform_rec)
    {
        uint64_t id;
        uint64_t txnid;
        uint8_t newskills[SKILLLEN];
        char success;    // 1: success, 0: failure
        auto primary_key() const { return id; }
        EOSLIB_SERIALIZE( transform_rec, (id)(txnid) (newskills)(success) )
    };
    // @abi table configs, save the config value, under pandafun account
    // normal, copper,silver,gold,diamond   number
    struct PACKED(config_rec)
    {
        uint64_t id;
        int64_t normal;
        int64_t copper;
        int64_t silver;
        int64_t gold;
        int64_t diamond;
        int64_t players;    // number of players
        int64_t upgrade7days;    // 修行
        int64_t transform7days;    // 冥想
        int64_t candles7days;
        int64_t normalkey;
        int32_t diamondkey;
        char    paused;     // RUNNING: running, PAUSED: paused
        auto primary_key() const { return id; }
        EOSLIB_SERIALIZE( config_rec, (id)(normal)(copper)(silver)(gold)(diamond)(players)(upgrade7days)(transform7days)(candles7days)(normalkey)(diamondkey)(paused) )
    };
    // @abi table signup
    struct PACKED(signup_rec)
    {
        account_name user;
        char status;
        auto primary_key() const { return user; }
        EOSLIB_SERIALIZE(signup_rec, (user)(status));
    };
    // @abi table statistics
    struct PACKED(asset_count_rec)
    {
        uint64_t timestamp;    // timestamp, handled, not the original one
        int32_t number;
        auto primary_key() const { return timestamp; }
        EOSLIB_SERIALIZE(asset_count_rec, (timestamp)(number));
    };

    // @abi action
    struct transfers
    {
        account_name to;
        int32_t quantity;
        string  memo;
        EOSLIB_SERIALIZE(transfers, (to)(quantity)(memo));
    };
    // @abi action
    struct sell
    {
        account_name seller;
        uint64_t id;
        asset price;
        string  memo;
        EOSLIB_SERIALIZE( sell, (seller)(id)(price)(memo) )
    };
    // @abi action
    struct cancelsell
    {
        account_name seller;
        uint64_t id;
        string  memo;
        EOSLIB_SERIALIZE( cancelsell, (seller)(id)(memo) )
    };
    // @abi action
    struct buy
    {
        account_name seller;
        account_name buyer;
        uint64_t id;
        asset price;
        string  memo;
        EOSLIB_SERIALIZE( buy, (seller)(buyer)(id)(price)(memo) )
    };
    // @abi action, for pray, dice, upgrade, transform
    //struct PACKED(recvhash)   // 7 bytes less, but net usage words are the same
    struct recvhash
    {
        account_name from;
        account_name scope; // specially for the server using, the clients' should be the same as 'from' field
        checksum256 hash;   // as to the server, we will save this to 'srvhash' field
        uint64_t txnid;
        EOSLIB_SERIALIZE(recvhash, (from)(scope)(hash)(txnid) );
    };
    // @abi action
    struct recvhashs
    {
        account_name from;
        account_name scope; // specially for the server using, the clients' should be the same as 'from' field
        checksum256 hashs[HASHNUM];   // as to the server, we will save this to 'srvhash' field
        uint64_t txnid;
        EOSLIB_SERIALIZE(recvhashs, (from)(scope)(hashs)(txnid) );
    };
    // @abi action
    struct dice
    {
        account_name player;    // throw dice
        uint64_t randomvalue;
        uint64_t srvrandom;
        uint64_t txnid;
        EOSLIB_SERIALIZE(dice, (player)(randomvalue)(srvrandom)(txnid) );
    };
    // @abi action, send the local random number, xor to generate the random number
    struct pray
    {
        account_name player;
        uint64_t panda_id;
        uint64_t randomvalue;
        uint64_t srvrandom;
        uint64_t txnid;
        EOSLIB_SERIALIZE(pray, (player)(panda_id)(randomvalue)(srvrandom)(txnid) );
    };
    // @abi action
    struct upgrade
    {
        account_name player;
        uint64_t panda_id;
        uint64_t randomvalue;
        uint64_t srvrandom;
        uint64_t txnid;
        char skill;
        EOSLIB_SERIALIZE(upgrade, (player)(panda_id)(randomvalue)(srvrandom)(txnid)(skill) );
    };
    // @abi action
    struct transform
    {
        account_name player;
        uint64_t panda_id;
        uint64_t randomvalue;
        uint64_t srvrandom;
        uint64_t txnid;
        char skillpos;
        EOSLIB_SERIALIZE(transform, (player)(panda_id)(randomvalue)(srvrandom)(txnid)(skillpos) );
    };
    // @abi action, send the local random number, xor to generate the random number
    struct prays
    {
        account_name player;
        uint64_t panda_id;
        uint64_t randomvalue[HASHNUM];
        uint64_t srvrandom[HASHNUM];
        uint64_t txnid;
        EOSLIB_SERIALIZE(prays, (player)(panda_id)(randomvalue)(srvrandom)(txnid) );
    };
    // @abi action
    struct upgrades
    {
        account_name player;
        uint64_t panda_id;
        uint64_t randomvalue[HASHNUM];
        uint64_t srvrandom[HASHNUM];
        uint64_t txnid;
        char skill;
        EOSLIB_SERIALIZE(upgrades, (player)(panda_id)(randomvalue)(srvrandom)(txnid)(skill) );
    };
    // @abi action
    struct transforms
    {
        account_name player;
        uint64_t panda_id;
        uint64_t randomvalue[HASHNUM];
        uint64_t srvrandom[HASHNUM];
        uint64_t txnid;
        char skillpos;
        EOSLIB_SERIALIZE(transforms, (player)(panda_id)(randomvalue)(srvrandom)(txnid)(skillpos) );
    };
    // @abi action
    struct confirmtrans
    {
        account_name player;
        uint64_t panda_id;
        uint64_t txnid;
        int32_t confirm;   // 1, confirm this transform, will replace the skill on the given panda
        char oldskillpos;
        char newskillpos;
        EOSLIB_SERIALIZE(confirmtrans, (player)(panda_id)(txnid)(confirm)(oldskillpos)(newskillpos));
    };
    // @abi action
    struct saveresult
    {
        account_name player1;
        uint64_t panda1;
        account_name player2;
        uint64_t panda2;
        account_name player3;
        uint64_t panda3;
        account_name winner;
        account_name payer;
        uint64_t gameid;
        asset  in;
        uint32_t starttime;
        uint32_t endtime;
        EOSLIB_SERIALIZE(saveresult, (player1)(panda1)(player2)(panda2)(player3)(panda3)(winner)(payer)(gameid)(in)(starttime)(endtime) );
    };
    // @abi action
    struct refund
    {
        account_name from;
        account_name to;
        asset quantity;
        string  memo;
        EOSLIB_SERIALIZE(refund, (from)(to)(quantity)(memo));
    };
    // @abi action
    struct buycandles
    {
        account_name buyer;
        int64_t count;
        uint64_t txnid;
        EOSLIB_SERIALIZE(buycandles, (buyer)(count)(txnid));
    };
    // @abi action
    struct buybooks
    {
        account_name buyer;
        int64_t count;
        uint64_t txnid;
        EOSLIB_SERIALIZE(buybooks, (buyer)(count)(txnid));
    };
    // @abi action
    struct buytea
    {
        account_name buyer;
        int64_t count;
        uint64_t txnid;
        EOSLIB_SERIALIZE(buytea, (buyer)(count)(txnid));
    };
    // @abi action
    struct signup
    {
        account_name user;
        uint64_t txnid;
        EOSLIB_SERIALIZE(signup, (user)(txnid));
    };
    // @abi action
    struct pause
    {
    };
    // @abi action
    struct resume
    {
    };
    // @abi action, modify the status in signup table
    struct setblack
    {
        account_name user;
        EOSLIB_SERIALIZE(setblack, (user));
    };
    // @abi action
    struct removeblack
    {
        account_name user;
        EOSLIB_SERIALIZE(removeblack, (user));
    };

    typedef multi_index<N(pandas), panda_rec> panda_table_type;
    typedef multi_index<N(selling), selling_rec> selling_table_type;
    typedef multi_index<N(hashs), hash_rec> hash_type;
    typedef multi_index<N(hashsmore), hash_rec> hashmore_type;
    typedef multi_index<N(configs), config_rec> config_type;
    typedef multi_index<N(pray), pray_rec> pray_type;
    typedef multi_index<N(dice), dice_rec> dice_type;
    typedef multi_index<N(assets), asset_rec> asset_type;
    typedef multi_index<N(upgrade), upgrade_rec> upgrade_type;
    typedef multi_index<N(transform), transform_rec> transform_type;
    typedef multi_index<N(results), result_rec> result_type;
    typedef multi_index<N(signup), signup_rec> signup_type;
    typedef multi_index<N(statistics), asset_count_rec> asset_count_type;
};

