#include <eosiolib/eosio.hpp>
#include <eosiolib/asset.hpp>
#include <eosiolib/singleton.hpp>
#include <eosiolib/transaction.hpp>

#include <time.h>

#include "tables/tables.hpp"

using namespace eosio;

class wallet : public contract
{
  public:
    using contract::contract;

    /* Constants */

    const uint8_t APPLICATION_STATUS_PENDING = 1;
    const uint8_t APPLICATION_STATUS_APPROVED = 2;
    const uint8_t APPLICATION_STATUS_REJECTED = 3;

    /*
     * The only possible point of failure in the system would be setsyslmt.
     * With control on setsyslmt, a hacker can first set a very high limit,
     * and then create a new department with high allowance to spend all the
     * tokens.
     * 
     * Thus, it's SUPER IMPORTANT for the owner permission to be controlled
     * by multiple private keys via msig.
     */
    const permission_name PERMISSION_SET_SYSTEM_LIMIT = N(owner);
    const permission_name PERMISSION_ADD_DEPARTMENT = N(newdept);
    const permission_name PERMISSION_TOGGLE_DEPARTMENT = N(tgldept);
    const permission_name PERMISSION_PROCESS_APPLICATION = N(processapp);

    /* Structs */

    struct transfer_args
    {
        account_name from;
        account_name to;
        asset quantity;
        string memo;
    };

    struct currency_stats
    {
        asset supply;
        asset max_supply;
        account_name issuer;

        uint64_t primary_key() const { return supply.symbol.name(); }
    };
    typedef multi_index<N(stat), currency_stats> tbl_currency_stats;

    /* Tables */

    typedef singleton<N(configs), config> tbl_configs;
    typedef multi_index<N(departments), department> tbl_departments;
    typedef multi_index<N(applications), application> tbl_applications;
    typedef multi_index<N(expenditures), expenditure> tbl_expenditures;
    typedef multi_index<N(expenses), expense> tbl_expenses;

    /* Interfaces */

    /// @abi action init
    void init(account_name executor, extended_symbol token, uint64_t init_sys_limit);
    /// @abi action setsyslmt
    void setsyslmt(uint64_t new_allowance);
    /// @abi action newdept
    void newdept(string name, account_name manager);
    /// @abi action toggledept
    void toggledept(uint64_t id, bool enabled);
    /// @abi action setdeptlmt
    void setdeptlmt(uint64_t id, uint64_t new_allowance);
    /// @abi action processapp
    void processapp(uint64_t id, bool approve);
    /// @abi action addexpense
    void addexpense(uint64_t department_id, string name, account_name recipient, uint64_t monthly_allowance);
    /// @abi action rmexpense
    void rmexpense(uint64_t department_id, uint64_t expenditure_id);
    /// @abi action adjexpense
    void adjexpense(uint64_t department_id, uint64_t expenditure_id, uint64_t new_allowance);
    /// @abi action spend
    void spend(uint64_t department_id, uint64_t expenditure_id, uint64_t amount, string memo);

  private:
    config get_config();
    uint64_t add_spend(uint64_t spend_before, uint64_t add_spend, uint32_t last_spend_time);
};

extern "C"
{
    void apply(uint64_t receiver, uint64_t code, uint64_t action)
    {
        auto self = receiver;
        wallet thiscontract(self);
        if (code == self)
        {
            switch (action)
            {
                EOSIO_API(wallet, (init)(newdept)(toggledept)(setdeptlmt)(processapp)(addexpense)(rmexpense)(adjexpense)(spend))
            }
        }
    }
}
