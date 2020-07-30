#include <eosiolib/eosio.hpp>
#include <eosiolib/print.hpp>

using namespace eosio;
using namespace std;

class basics : public contract {
    using contract::contract;

public:
    basics( account_name self ) :
            contract(self),
            _statuses(_self, _self){}

    // @abi action
    void test( name sender, string status ){
        require_auth(sender);

        auto iter = _statuses.find(sender);
        if(iter == _statuses.end()) _statuses.emplace( sender, [&]( auto& row) {
                row.sender = sender;
                row.status = status;
            });
        else _statuses.modify( iter, 0, [&]( auto& row) {
                row.status = status;
            });
    }

private:

    // @abi table
    struct statuses {
        name sender;
        string status;

        name primary_key() const { return sender; }
        EOSLIB_SERIALIZE( statuses, (sender)(status) )
    };

    multi_index<N(statuses), statuses> _statuses;


};

EOSIO_ABI( basics, (test) )