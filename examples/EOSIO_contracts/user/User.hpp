#include <eosiolib/eosio.hpp>
#include <eosiolib/print.hpp>
#include <string>
// #include <eosiolib/crypto.h>
// #include <eosiolib/transaction.hpp>

namespace zjubcabounty{
    using namespace eosio;
    using std::string;

    class User : public contract { // manage actions about Task
        using contract::contract;   //in order to use its constructor 

        public:
            User(account_name self):contract(self){}// Will this method/constructor be called ???
            /*************************************/
            /**********    DEMO ACTION   *********/
            /*************************************/
            [[eosio::action]]
            void showinfo(){
                print("This is ZJUBCA.Bounty, Powered by EOS BlockChain Infrastructure.");
                userIndex users(_self, _self);
                account_name username;
                //如何进行遍历呢？？？
                int user_rank;
                for(user_rank = 1; ; user_rank++){
                    auto iterator = users.find(user_rank);
                    if(iterator == users.end()){
                        break;
                    }
                }
                print("Numbers of Registered Users:",user_rank-1);
            }
            /*************************************/
            /********** DATA STURUCTURES *********/
            /*************************************/
            // struct registeredUser
            // {
            //     uint64_t rank;
            //     string username;
            //     uint64_t primary_key() const { return rank; }
            // };
            
            struct [[eosio::table]] user{//[[eosio::table]]
                // uint64_t id;
                // string username;
                // uint64_t id;            //rank 
                account_name username;        //account_name 
                uint64_t gpaplus;       // gpaplus = task_point*(((score-5)_to_gpa+1.5)/5 - 0.10) 
                string totalbounty;     //token distribution 
                int awscore;         //averageweightedscore 
                vector<int> taskpartin; // task_id 

                auto        primary_key()   const  { return username;                        }
                uint64_t    by_high_gpaplus()const { return static_cast<uint64_t>(-gpaplus) ; }
                /*************************************************
                 * static_cast<uint64_t>(-gpaplus); type convert *
                 * static_cast<uint64_t>(-1) = 2^64 -1 ***********
                 *************************************************/
            };
            typedef eosio::multi_index< N(user), user,
                                        indexed_by<N(gpaplus), const_mem_fun<user, uint64_t, &user::by_high_gpaplus>  >
                                        >  userIndex;
            
            /*************************************/
            /**********     FUNCTIONS    *********/
            /*************************************/
            void adjust();
            /*************************************/
            /**********      ACTIONS     *********/
            /*************************************/
            [[eosio::action]]
            void newregister(const account_name newuser);
            [[eosio::action]]
            void updateuser(const account_name username, 
                          uint64_t gpaplus, 
                          string& totalbounty,
                          int awscore,
                          int newtask_id);
            [[eosio::action]]
            void getuser(const account_name username);
            [[eosio::action]]
            void getranklist(int length);
            //account_name ???
            //uint64_t authorid,

            // typedef multi_index<N(user), user> userIndex;
    };

    EOSIO_ABI(User, (showinfo)(newregister)(updateuser)(getuser)(getranklist))
}

