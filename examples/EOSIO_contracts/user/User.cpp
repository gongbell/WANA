#include "User.hpp"

namespace zjubcabounty{
    void User::adjust(){

    }

    [[eosio::action]]
    void User::newregister(const account_name newuser){
        User::userIndex users(_self,_self);
        auto iterator = users.find(newuser);
        eosio_assert(iterator == users.end(), "This user already registered !!!");

        users.emplace(newuser, [&](auto& users) {
            users.username = newuser;   
            users.gpaplus = 0; 
            users.totalbounty = "0 ZJUBCA"; 
            users.awscore = 0; 
        });

    }

    [[eosio::action]]
    void User::updateuser(const account_name username, 
                          uint64_t gpaplus, 
                          string& totalbounty,
                          int awscore,
                          int newtask_id){

        User::userIndex users(_self,_self);
        auto iterator = users.find(username);
        eosio_assert(iterator != users.end(), "This user was NOT FOUND!!!");
        
        if(gpaplus)
            users.modify(iterator, username, [&](auto& users){
                users.gpaplus = gpaplus;
            });
        if(totalbounty!="")
            users.modify(iterator, username, [&](auto& users){
                users.totalbounty = totalbounty;
            });
        if(awscore)
            users.modify(iterator, username, [&](auto& users){
                users.awscore = awscore;
            });
        if(newtask_id>0)
            users.modify(iterator, username, [&](auto& users){
                users.taskpartin.push_back(newtask_id);
            });
    }

    [[eosio::action]]
    void User::getuser(const account_name username){
        User::userIndex users(_self,_self);
        auto iterator = users.find(username);
        eosio_assert(iterator != users.end(), "This user was NOT FOUND!!!");

        auto theuser = users.get(username);

        auto n = name{username};   // convert
        string str = n.to_string();// uint64_t to string

        print(" { \"username\": \"", str , "\"," ,
              "   \"gpaplus\": ", theuser.gpaplus, "," ,
              "   \"totalbounty\": \"", theuser.totalbounty,"\",",
              "   \"awscore\": ", theuser.awscore, ",");
        print("   \"taskpartin\": [");
        if (theuser.taskpartin.size() > 0) {
            for (int i = 0; i < theuser.taskpartin.size(); i++) {
                print("",theuser.taskpartin.at(i));
                print("");
                if(i < theuser.taskpartin.size()-1)
                    print(",");
            }
            print("]");
        } else {
            print("]");//(PARTICIPANTS UNDEFINED YET.)
        }
        print(" } ");
    }

    [[eosio::action]]
    void User::getranklist(int length){
        User::userIndex users(_self,_self);
        auto u = users.get_index<N(gpaplus)>(); // this line of code make the sort ? Do not omit.
        int i=0;
        print("{\"ranklist\": [");
        for(auto& user : u) {
            i++;
            getuser(user.username);
            if(i!=length){
                print(",");
            }else{break;}
        }
        print("]}");
    }

}