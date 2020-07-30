#include "wallet.hpp"

void wallet::init(account_name executor, extended_symbol token, uint64_t init_sys_limit)
{
    // The contract's permission shall be changed to eosio.code
    // after calling init to remove any risk of being hacked.
    require_auth(_self);

    // The executor must exist
    eosio_assert(is_account(executor), "The executor account must exist");

    // The token must exist
    eosio_assert(is_account(token.contract), "The token contract must exist");
    tbl_currency_stats currency(token.contract, token.value >> 8);
    eosio_assert(currency.begin() != currency.end(), "The token does not exist");

    // The contract must have not been inited
    tbl_configs configs(_self, _self);
    eosio_assert(!configs.exists(), "The contract has already been initialized");

    //  Writes the configs
    config new_config{
        .executor = executor,
        .token = token,
        .system_monthly_limit = init_sys_limit};
    configs.set(new_config, _self);
}

void wallet::setsyslmt(uint64_t new_allowance)
{
    // Checks auth
    tbl_configs configs(_self, _self);
    eosio_assert(configs.exists(), "The contract has not been initialized");
    auto config = configs.get();
    require_auth2(config.executor, PERMISSION_SET_SYSTEM_LIMIT);

    // Changes the allowance
    config.system_monthly_limit = new_allowance;
    configs.set(config, _self);
}

void wallet::newdept(string name, account_name manager)
{
    // Checks auth
    auto configs = get_config();
    require_auth2(configs.executor, PERMISSION_ADD_DEPARTMENT);

    // The manager account must exist
    eosio_assert(is_account(manager), "The manager account does not exist");

    // Finds next department id
    tbl_departments departments(_self, _self);
    auto last_department = departments.rbegin();
    uint64_t next_dept_id = last_department == departments.rend() ? 1 : last_department->id + 1;

    // Creates the department
    departments.emplace(_self, [&](department &new_department) {
        new_department.id = next_dept_id;
        new_department.name = name;
        new_department.manager = manager;
    });
}

void wallet::toggledept(uint64_t id, bool enabled)
{
    // Checks auth
    auto configs = get_config();
    require_auth2(configs.executor, PERMISSION_TOGGLE_DEPARTMENT);

    // Gets the department
    tbl_departments departments(_self, _self);
    auto target_department = departments.find(id);
    eosio_assert(target_department != departments.end(), "The department does not exist");

    // The status must be changed
    eosio_assert(target_department->enabled != enabled, "The department status is not being changed");

    // Changes the status
    departments.modify(target_department, _self, [&](department &modified_department) {
        modified_department.enabled = enabled;
    });
}

void wallet::setdeptlmt(uint64_t id, uint64_t new_allowance)
{
    // Gets the department
    tbl_departments departments(_self, _self);
    auto department = departments.find(id);
    eosio_assert(department != departments.end(), "The department does not exist");

    // Checks auth
    require_auth(department->manager);

    // Checks if a pending application for this department exists
    //
    // Using iterations here for easier front-end queries (demo purpose)
    // (Possible optimization: use scope and PK for fast retrival)
    //
    tbl_applications applications(_self, _self);
    for (auto it = applications.begin(); it != applications.end(); it++)
        eosio_assert(it->department_id != id || it->status != APPLICATION_STATUS_PENDING, "A pending application for this department already exists");

    // Finds next application id
    auto last_application = applications.rbegin();
    uint64_t next_application_id = last_application == applications.rend() ? 1 : last_application->application_id + 1;

    // The allowance must be changed
    eosio_assert(department->monthly_allowance != new_allowance, "Allowance is not being changed");

    // Creates the application
    applications.emplace(_self, [&](application &new_application) {
        new_application.application_id = next_application_id;
        new_application.department_id = id;
        new_application.from_allowance = department->monthly_allowance;
        new_application.to_allowance = new_allowance;
        new_application.status = APPLICATION_STATUS_PENDING;
    });
}

void wallet::processapp(uint64_t id, bool approve)
{
    // Checks auth
    auto configs = get_config();
    require_auth2(configs.executor, PERMISSION_PROCESS_APPLICATION);

    // Gets application
    tbl_applications applications(_self, _self);
    auto application = applications.find(id);
    eosio_assert(application != applications.end(), "Application does not exist");
    eosio_assert(application->status == APPLICATION_STATUS_PENDING, "Application has already been processed");

    // Changes application status
    applications.modify(application, _self, [&](::application &modified_application) {
        modified_application.status = approve ? APPLICATION_STATUS_APPROVED : APPLICATION_STATUS_REJECTED;
    });

    // Nothing to do if rejected
    if (!approve)
        return;

    // Changes the allowance
    tbl_departments departments(_self, _self);
    auto department = departments.find(application->department_id);
    eosio_assert(application->to_allowance >= department->allowance_allocated, "Insufficient allocation after approval");
    departments.modify(department, _self, [&](::department &modified_department) {
        modified_department.monthly_allowance = application->to_allowance;
    });
}

void wallet::addexpense(uint64_t department_id, string name, account_name recipient, uint64_t monthly_allowance)
{
    // Gets the department
    tbl_departments departments(_self, _self);
    auto department = departments.find(department_id);
    eosio_assert(department != departments.end(), "The department does not exist");

    // Checks auth
    require_auth(department->manager);

    // Recipient must exist
    eosio_assert(is_account(recipient), "The recipient account does not exist");

    // Checks allowance allocation
    uint64_t new_allowance_allocated = department->allowance_allocated + monthly_allowance;
    eosio_assert(new_allowance_allocated > department->allowance_allocated, "Allowance overflow");
    eosio_assert(new_allowance_allocated <= department->monthly_allowance, "Allowance overdrawn");

    // Finds next expenditure id
    tbl_expenditures expenditures(_self, department_id);
    auto last_expenditure = expenditures.rbegin();
    uint64_t next_expenditure_id = last_expenditure == expenditures.rend() ? 1 : last_expenditure->id + 1;

    // Adds the expenditure
    expenditures.emplace(_self, [&](expenditure &new_expenditure) {
        new_expenditure.id = next_expenditure_id;
        new_expenditure.name = name;
        new_expenditure.recipient = recipient;
        new_expenditure.monthly_allowance = monthly_allowance;
    });

    // Modifies the department allowance allocation
    departments.modify(department, _self, [&](::department &modified_department) {
        modified_department.allowance_allocated = new_allowance_allocated;
    });
}

void wallet::rmexpense(uint64_t department_id, uint64_t expenditure_id)
{
    // Gets the department
    tbl_departments departments(_self, _self);
    auto department = departments.find(department_id);
    eosio_assert(department != departments.end(), "The department does not exist");

    // Checks auth
    require_auth(department->manager);

    // Gets the expenditure
    tbl_expenditures expenditures(_self, department_id);
    auto expenditure = expenditures.find(expenditure_id);
    eosio_assert(expenditure != expenditures.end(), "Expenditure does not exist");
    eosio_assert(!expenditure->removed, "Expenditure has already been removed");

    // Changes the expenditure removal flag
    //
    // Not using erase to free up RAM only for DEMO PURPOSE because
    // removing it from the RAM makes it much harder for eosjs to fetch history
    //
    expenditures.modify(expenditure, _self, [&](::expenditure &modified_expenditure) {
        modified_expenditure.removed = true;
    });

    // Changes the allowance allocated (no need to check underflow)
    departments.modify(department, _self, [&](::department &modified_department) {
        modified_department.allowance_allocated -= expenditure->monthly_allowance;
    });
}

void wallet::adjexpense(uint64_t department_id, uint64_t expenditure_id, uint64_t new_allowance)
{
    // Gets the department
    tbl_departments departments(_self, _self);
    auto department = departments.find(department_id);
    eosio_assert(department != departments.end(), "The department does not exist");

    // Checks auth
    require_auth(department->manager);

    // Gets expenditure
    tbl_expenditures expenditures(_self, department_id);
    auto expenditure = expenditures.find(expenditure_id);
    eosio_assert(expenditure != expenditures.end(), "Expenditure does not exist");

    // The expenditure must have not been removed
    eosio_assert(!expenditure->removed, "Expenditure has been removed");

    // Must change the allowance
    eosio_assert(expenditure->monthly_allowance != new_allowance, "Must change monthly allowance");

    if (expenditure->monthly_allowance > new_allowance)
    {
        // Reducing allowance
        uint64_t delta = expenditure->monthly_allowance - new_allowance;

        departments.modify(department, _self, [&](::department &modified_department) {
            modified_department.allowance_allocated -= delta;
        });
    }
    else
    {
        // Increasing allowance
        uint64_t delta = new_allowance - expenditure->monthly_allowance;

        uint64_t new_department_allocated = department->allowance_allocated + delta;
        eosio_assert(new_department_allocated > department->allowance_allocated, "Allocation overflow");
        eosio_assert(new_department_allocated < department->monthly_allowance, "Allocation overdrawn");

        departments.modify(department, _self, [&](::department &modified_department) {
            modified_department.allowance_allocated += new_department_allocated;
        });
    }

    expenditures.modify(expenditure, _self, [&](::expenditure &modified_expenditure) {
        modified_expenditure.monthly_allowance = new_allowance;
    });
}

void wallet::spend(uint64_t department_id, uint64_t expenditure_id, uint64_t amount, string memo)
{
    // Gets the department
    tbl_departments departments(_self, _self);
    auto department = departments.find(department_id);
    eosio_assert(department != departments.end(), "The department does not exist");

    // Checks auth
    tbl_configs configs(_self, _self);
    eosio_assert(configs.exists(), "The contract has not been initialized");
    auto config = configs.get();
    require_auth(department->manager);

    // Gets expenditure
    tbl_expenditures expenditures(_self, department_id);
    auto expenditure = expenditures.find(expenditure_id);
    eosio_assert(expenditure != expenditures.end(), "Expenditure does not exist");

    // Department must not be disabled
    eosio_assert(department->enabled, "Department has been suspended");

    // Expenditure must not be removed
    eosio_assert(!expenditure->removed, "Expenditure has been removed");

    // Checks allowance
    uint64_t new_used_expenditure_allownance = add_spend(expenditure->allowance_used, amount, expenditure->last_spend_time);
    uint64_t new_used_department_allowance = add_spend(department->allowance_used, amount, department->last_spend_time);
    uint64_t new_used_system_allowance = add_spend(config.system_limit_used, amount, config.last_spend_time);
    // Expenditure level
    eosio_assert(new_used_expenditure_allownance <= expenditure->monthly_allowance, "Allowance overdrawn");
    // Department level
    eosio_assert(new_used_department_allowance <= department->monthly_allowance, "Allowance overdrawn");
    // System level
    eosio_assert(new_used_system_allowance <= config.system_monthly_limit, "Allowance overdrawn");

    // Sends the token
    transfer_args token_transfer{
        .from = _self,
        .to = expenditure->recipient,
        .quantity = asset(amount, symbol_type(config.token.value)),
        .memo = memo};
    action(permission_level{_self, N(active)}, config.token.contract, N(transfer), token_transfer)
        .send();

    // Changes expenditure allowance used
    expenditures.modify(expenditure, _self, [&](::expenditure &modified_expenditure) {
        modified_expenditure.allowance_used = new_used_expenditure_allownance;
        modified_expenditure.last_spend_time = now();
    });

    // Changes department allowance used
    departments.modify(department, _self, [&](::department &modified_department) {
        modified_department.allowance_used = new_used_department_allowance;
        modified_department.last_spend_time = now();
    });

    // Changes system allowance used
    config.system_limit_used = new_used_system_allowance;
    config.last_spend_time = now();
    configs.set(config, _self);

    // Adds to expense history
    //
    // Note that this is just for DEMO PURPOSE so that eosjs can
    // easily pull out the entire history. For real production
    // an off-chain record-keeping system shall be used to save RAM.
    //
    tbl_expenses expenses(_self, _self);
    auto last_expense = expenses.rbegin();
    expenses.emplace(_self, [&](expense &new_expense) {
        new_expense.id = last_expense == expenses.rend() ? 1 : last_expense->id + 1;
        new_expense.department_id = department_id;
        new_expense.expenditure_id = expenditure_id;
        new_expense.time = now();
        new_expense.amount = amount;
        new_expense.memo = memo;
    });
}

uint64_t wallet::add_spend(uint64_t spend_before, uint64_t add_spend, uint32_t last_spend_time)
{
    time_t time_last = (long)last_spend_time;
    time_t time_now = (long)now();

    tm *tm_last = gmtime(&time_last);
    int last_year = tm_last->tm_year;
    int last_month = tm_last->tm_mon;

    tm *tm_now = gmtime(&time_now);
    int now_year = tm_now->tm_year;
    int now_month = tm_now->tm_mon;

    if (last_year == now_year && last_month == now_month)
    {
        // Same month
        uint64_t new_spend = spend_before + add_spend;
        eosio_assert(new_spend > spend_before, "Amount overflow");

        return new_spend;
    }
    else
    {
        // Different month
        return add_spend;
    }
}

config wallet::get_config()
{
    tbl_configs configs(_self, _self);
    eosio_assert(configs.exists(), "The contract has not been initialized");
    return configs.get();
}