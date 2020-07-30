#include <eosiolib/eosio.hpp>
#include <eosiolib/print.hpp>
#include <string>
#include <eosiolib/crypto.h>
#include <eosiolib/transaction.hpp>

namespace zjubcabounty{
    using namespace eosio;
    using std::string;

    class Task : public contract { // manage actions about Task
        using contract::contract;   //in order to use its constructor 

        public:
            Task(account_name self):contract(self){}// Will this method/constructor be called ???
            /*************************************/
            /**********    DEMO ACTION   *********/
            /*************************************/
            [[eosio::action]]
            void showinfo(){
                print("This is ZJUBCA.Bounty, Powered by EOS BlockChain Infrastructure.");
                taskIndex tasks(_self, _self);
                int task_id = 1;
                for(task_id = 1; ; task_id++){
                    auto iterator = tasks.find(task_id);
                    if(iterator == tasks.end()){
                        break;
                    }
                }
                print("Numbers of Projects:",task_id-1);
            }
            /*************************************/
            /********** DATA STURUCTURES *********/
            /*************************************/
            struct user{
                // uint64_t id;
                // account_name username;
                string username;
                string distribution;//token distribution this time
                string score; 
                // uint64_t primary_key() const { return username; }
            };

            struct [[eosio::table]] task {//[[eosio::table]]
                uint64_t id;
                // user author;
                string title;
                string description;
                string status;
                string rolenumbers;
                string reward;
                string pledge;
                string updatedat;//updatedAt
                string requires;
                //取消了author属性，默认participants[0]是task的author
                vector<user> participants;

                string likevote;
                string hatevote;
                
                uint64_t primary_key() const { return id; }
                // EOSLIB_SERIALIZE(task, (id)(title)(description)(status)(rolenumbers)(reward)(pledge)(updatedat)(requires)(participants)(likevote)(hatevote))
            };
            /*************************************/
            /**********     FUNCTIONS    *********/
            /*************************************/
            void printask(uint64_t task_id, bool description);
            
            /*************************************/
            /**********      ACTIONS     *********/
            /*************************************/
            //account_name ???
            //uint64_t authorid,
            [[eosio::action]]
            void create(const account_name author, uint64_t id, string& authorname,  string& title, 
            string& description, string& status, string& rolenumbers, string& reward, string& pledge, string& updatedat, 
            string& requires, string& likevote, string& hatevote);
            [[eosio::action]]
            void erase(const account_name author, uint64_t task_id);
            [[eosio::action]]
            void selectitems(const account_name author, string& filter, string& judge, string& value);
            [[eosio::action]]
            void selectatask(const account_name author, uint64_t task_id);
            [[eosio::action]]
            void update(const account_name author, uint64_t id, string& title, string& description, string& status, 
            string& rolenumbers, string& reward, string& pledge, string& updatedat, string& requires);
            [[eosio::action]]
            void updatestatus(const account_name author, uint64_t task_id, string& status);
            [[eosio::action]]
            void updatevotes(const account_name author, uint64_t task_id, string& likevote, string& hatevote);
            //只有发任务者可以更新状态。并且会通知每个参加任务的人。
            //, uint64_t participantid
            [[eosio::action]]
            void participate(const account_name author, uint64_t task_id, string& participantname);
            [[eosio::action]]
            void withdraw(const account_name author, uint64_t task_id, string& participantname);
            [[eosio::action]]
            void allocateb(const account_name author, uint64_t task_id, string& participantname, string distribution, string score);
            // [[eosio::action]]
            // void allocateab(const account_name author, uint64_t task_id, vector<Task::user> participants);
            // [[eosio::action]]
            // void allocateab(const account_name author, uint64_t task_id, vector<string> participantname, vector<string> distribution, vector<string> score);
            //
            // [[eosio::action]]
            // void modifitem(const account_name author, uint64_t task_id, uint64_t item_id, string& item_name, uint32_t winumber, uint32_t maxnumber);
            // [[eosio::action]]
            // void addcad(const account_name author, uint64_t task_id, uint64_t item_id, string& cadname);
            // [[eosio::action]]
            // void checkbyid(const account_name author, uint64_t task_id);

            typedef multi_index<N(task), task> taskIndex;
    };

    EOSIO_ABI(Task, (showinfo)(create)(erase)(selectitems)(selectatask)(update)(updatestatus)(updatevotes)(participate)(withdraw)(allocateb))//(allocateab) (modifitem)(addcad)(activate)
}

