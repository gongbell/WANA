#include "utils.hpp"

#define EOS_SYMBOL S(4, EOS)
#define REVEALER N(gamerevealer)
#define LOG N(fairdicelogs)

static const string PUB_KEY =
    "EOS4wpa8kRBbZof9JEpPAAgbnN65NhbBobW4x5gyxQoFfamhQCAMX";

// @abi table bets i64
struct st_bet {
    uint64_t id;
    account_name player;
    account_name referrer;
    asset amount;
    uint8_t roll_under;
    checksum256 seed_hash;
    checksum160 user_seed_hash;
    uint64_t created_at;
    uint64_t primary_key() const { return id; }
};

struct st_result {
    uint64_t bet_id;
    account_name player;
    account_name referrer;
    asset amount;
    uint8_t roll_under;
    uint8_t random_roll;
    checksum256 seed;
    checksum256 seed_hash;
    checksum160 user_seed_hash;
    asset payout;
};

// @abi table hash i64
struct st_hash {
    checksum256 hash;
    uint64_t expiration;
    uint64_t primary_key() const { return uint64_hash(hash); }

    uint64_t by_expiration() const { return expiration; }
};

// @abi table fundpool i64
struct st_fund_pool {
    asset locked;
};

// @abi table global i64
struct st_global {
    uint64_t current_id;
};

typedef multi_index<N(bets), st_bet>
    tb_bets;
typedef singleton<N(fundpool), st_fund_pool> tb_fund_pool;
typedef singleton<N(global), st_global> tb_global;
typedef multi_index<
    N(hash),
    st_hash,
    indexed_by<N(by_expiration),
               const_mem_fun<st_hash, uint64_t, &st_hash::by_expiration>>>
    tb_hash;
