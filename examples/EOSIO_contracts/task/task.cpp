#include "task.hpp"

const int FIRST_TASK_ID = 1;

namespace zjubcabounty{
    
    void Task::printask(uint64_t task_id, bool description=false){
        
        // require_auth( _self );
        Task::taskIndex tasks(_self, _self);
        auto iterator = tasks.find(task_id);
        eosio_assert(iterator != tasks.end(), "The task was NOT FOUND ... ");

        auto thetask = tasks.get(task_id);
        print(" { \"id\": ", thetask.id, ", ");//\"main\":
        print(" \"title\": \"", thetask.title.c_str(),"\", ");
        // print(" ||- description: ", thetask.description.c_str());
        print(" \"status\": \"", thetask.status.c_str(),"\", ");
        print(" \"rolenumbers\": ", thetask.rolenumbers.c_str(), ", ");//c_str()
        print(" \"reward\": \"", thetask.reward.c_str(),"\", ");
        print(" \"pledge\": \"", thetask.pledge.c_str(),"\", ");
        print(" \"updatedat\": \"", thetask.updatedat.c_str(),"\", ");
        print(" \"requires\": \"", thetask.requires.c_str(),"\", ");
        print(" \"likevote\": \"", thetask.likevote.c_str(), "\", ");//c_str()
        print(" \"hatevote\": \"", thetask.hatevote.c_str(), "\", ");//.c_str()
        print(" \"author\": { ");
        // print("  \"id\": ",thetask.participants.at(0).id,", ");
        print("  \"username\": \"",thetask.participants.at(0).username.c_str(),"\"");
         print(" }", ", ");
        print(" \"participants\": [");
        if (thetask.participants.size() > 0) {
            for (uint32_t i = 0; i < thetask.participants.size(); i++) {//i = 1 => i = 0
                // ATN： thetask.participants.at(0).id = 1 ！！！！
                // print("  \"id\": ",thetask.participants.at(i).id, ", ");
                print("{  \"username\": \"",thetask.participants.at(i).username.c_str(),"\", ");
                print("   \"distribution\": \"",thetask.participants.at(i).distribution.c_str(),"\", ");
                print("   \"score\": \"",thetask.participants.at(i).score.c_str(),"\" ");
                print("} ");
                if(i < thetask.participants.size()-1)
                    print(",");
            }
            print("]");
        } else {
            print("[{\"username\":Undefined }], ");//(PARTICIPANTS UNDEFINED YET.)
        }
        if(description)
            print(",\"description\": \"", thetask.description.c_str(),"\"");
        print("}");// \n
    }

    //uint64_t authorid,
    [[eosio::action]]
    void Task::create(const account_name author, uint64_t id, string& authorname,  string& title, 
    string& description, string& status, string& rolenumbers, string& reward, string& pledge, string& updatedat, 
    string& requires, string& likevote, string& hatevote){
        
        // require_auth( author );_self
        require_auth( author );

        Task::taskIndex tasks(_self, _self);
        auto iterator = tasks.find(id);
        eosio_assert(iterator == tasks.end(), "This ID of Task already existed !!!");

        tasks.emplace(author, [&](auto& tasks) {
            tasks.id = id;   tasks.title = title;   tasks.description = description;  tasks.status = status;  
            tasks.rolenumbers = rolenumbers;   tasks.reward = reward;   tasks.pledge = pledge; 
            tasks.updatedat = updatedat;   tasks.requires = requires;   tasks.likevote = likevote; 
            tasks.hatevote = hatevote; 
        });
        iterator = tasks.find(id);
        tasks.modify(iterator, author, [&](auto& tasks) {
            tasks.participants.push_back(user{
                //authorid,
                authorname,
                "0 ZJUBCA",
                "0.0"
            });
        });
        print("{ \"message\":\"Successfully create a task named <strong>",title,"</strong> in ZJUBCA.Bounty!\" }");
    }
    

    [[eosio::action]]
    void Task::selectatask(const account_name author, uint64_t task_id){
        // print("{");
        require_auth( author );
        printask(task_id,true);
        // Task::taskIndex tasks(_self, _self);

        // auto thetask = tasks.get(task_id);
        // print(",\"description\": \"", thetask.description.c_str(),"\"");
        // print("}");
    }
    
    [[eosio::action]]
    void Task::selectitems(const account_name author, string& filter, string& judge, string& value){
        
        // require_auth( _self );
        require_auth( author );
        Task::taskIndex tasks(_self, _self);
        int task_id = 1;
        for(task_id = 1; ; task_id++){
            auto iterator = tasks.find(task_id);
            if(iterator == tasks.end()){
                break;
            }
        }
        int length = task_id - 1;
        // print("length = ",length);
        // print("1");
        if(filter=="*"){
            print("{\"tasks\":[");
            for(int task_id = FIRST_TASK_ID; task_id <= length ;task_id++){ // task_id <= tasks.size()
                printask(task_id);
                if(task_id!=length){
                    print(",");
                }
            }
            print("]}");
        }else{
            // print("2");
            int lastTaskMatched = 0;// Used as a end flag(Sentry) of matched task array.
            if(filter=="tasktitle"){
                // print("3");
                if(judge=="equal"){
                    print("{\"tasks\":[");
                    for(int task_id = FIRST_TASK_ID; task_id <= length ;task_id++)
                        if(tasks.get(task_id).title.c_str()==value)
                            lastTaskMatched = task_id;
                    for(int task_id = FIRST_TASK_ID; task_id <= length ;task_id++){//task_id <= tasks.size()
                        // print("before break");
                        auto thetask = tasks.get(task_id);
                        if(thetask.title.c_str()==value){
                            printask(task_id);
                            if(task_id!=lastTaskMatched){//length
                                print(",");
                            }
                        }
                    }
                    print("]}");
                }else{
                    print("{ \"message\": \"filter == tasktitle, but judge failed.\" }");
                }
            }else if(filter=="taskstatus"){
                if(judge=="equal"){
                    print("{\"tasks\":[");
                    for(int task_id = FIRST_TASK_ID; task_id <= length ;task_id++)
                        if(tasks.get(task_id).status.c_str()==value)
                            lastTaskMatched = task_id;
                    for(int task_id = FIRST_TASK_ID ; task_id <= length ; task_id++){//task_id <= tasks.size()
                        auto thetask = tasks.get(task_id);
                        if(thetask.status.c_str()==value){
                            printask(task_id);
                            if(task_id!=lastTaskMatched){
                                print(",");
                            }
                        }
                    }
                    print("]}");
                }else{
                    print("{ \"message\": \"filter == taskstatus, but judge failed.\" }");
                }
            }else if(filter=="taskauthor"){
                 if(judge=="equal"){
                    print("{\"tasks\":[");
                    for(int task_id = FIRST_TASK_ID; task_id <= length ;task_id++)
                        if(tasks.get(task_id).participants.at(0).username.c_str()==value)
                            lastTaskMatched = task_id;
                    for(int task_id = FIRST_TASK_ID ; task_id <= length ; task_id++){//task_id <= tasks.size()
                        auto thetask = tasks.get(task_id);
                        if(thetask.participants.at(0).username.c_str()==value){
                            printask(task_id);
                            if(task_id!=lastTaskMatched){
                                print(",");
                            }
                        }
                    }
                    print("]}");
                }else{
                    print("{ \"message\": \"filter == taskauthor, but judge failed.\" }");
                }
            }else if(filter=="taskreward"){
                if(judge=="equal"){
                    print("{\"tasks\":[");
                    for(int task_id = FIRST_TASK_ID; task_id <= length ;task_id++)
                        if(tasks.get(task_id).reward==value)
                            lastTaskMatched = task_id;
                    for(int task_id = FIRST_TASK_ID ; task_id <= length ; task_id++){//task_id <= tasks.size()
                        auto thetask = tasks.get(task_id);
                        if(thetask.reward==value){
                            printask(task_id);
                            if(task_id!=lastTaskMatched){
                                print(",");
                            }
                        }
                    }
                    print("]}");
                }else if(judge=="bigger"){
                    print("{\"tasks\":[");
                    for(int task_id = FIRST_TASK_ID; task_id <= length ;task_id++)
                        if(tasks.get(task_id).reward > value)
                            lastTaskMatched = task_id;
                    for(int task_id = FIRST_TASK_ID ; task_id <= length ; task_id++){//task_id <= tasks.size()
                        auto thetask = tasks.get(task_id);
                        if(thetask.reward > value){
                            printask(task_id);
                            if(task_id!=lastTaskMatched){
                                print(",");
                            }
                        }
                    }
                    print("]}");
                }else if(judge=="nosmaller"){
                    print("{\"tasks\":[");
                    for(int task_id = FIRST_TASK_ID; task_id <= length ;task_id++)
                        if(tasks.get(task_id).reward >= value)
                            lastTaskMatched = task_id;
                    for(int task_id = FIRST_TASK_ID ; task_id <= length ; task_id++){//task_id <= tasks.size()
                        auto thetask = tasks.get(task_id);
                        if(thetask.reward >= value){
                            printask(task_id);
                            if(task_id!=lastTaskMatched){
                                print(",");
                            }
                        }
                    }
                    print("]}");
                }else if(judge=="smaller"){
                    print("{\"tasks\":[");
                    for(int task_id = FIRST_TASK_ID; task_id <= length ;task_id++)
                        if(tasks.get(task_id).reward < value)
                            lastTaskMatched = task_id;
                    for(int task_id = FIRST_TASK_ID ; task_id <= length ; task_id++){//task_id <= tasks.size()
                        auto thetask = tasks.get(task_id);
                        if(thetask.reward < value){
                            printask(task_id);
                            if(task_id!=lastTaskMatched){
                                print(",");
                            }
                        }
                    }
                    print("]}");
                }else if(judge=="nobigger"){
                    print("{\"tasks\":[");
                    for(int task_id = FIRST_TASK_ID; task_id <= length ;task_id++)
                        if(tasks.get(task_id).reward <= value)
                            lastTaskMatched = task_id;
                    for(int task_id = FIRST_TASK_ID ; task_id <= length ; task_id++){//task_id <= tasks.size()
                        auto thetask = tasks.get(task_id);
                        if(thetask.reward <= value){
                            printask(task_id);
                            if(task_id!=lastTaskMatched){
                                print(",");
                            }
                        }
                    }
                    print("]}");
                }else{
                    print("{ \"message\": \"filter == taskreward, but judge failed.\" }");
                }
            }
            
        }
        
    }


    [[eosio::action]]
    void Task::update(const account_name author, uint64_t id, string& title, string& description, string& status,
    string& rolenumbers, string& reward, string& pledge, string& updatedat, string& requires){// ID is not changeable.
        
        // require_auth( _self );
        require_auth( author );
        Task::taskIndex tasks(_self, _self);
        auto iterator = tasks.find(id);
        eosio_assert(iterator != tasks.end(), "This ID of Task DID NOT exist !!!");
        
        tasks.modify(iterator, author, [&](auto& tasks) {
            tasks.title = title;
            tasks.description = description;
            tasks.status = status;
            tasks.rolenumbers = rolenumbers;
            tasks.reward = reward;
            tasks.pledge = pledge;
            tasks.updatedat = updatedat;
            tasks.requires = requires;
        });
        print("{ \"message\" : \" Successfully updated. \"}");
    }

    [[eosio::action]]
    void Task::updatestatus(const account_name author, uint64_t task_id, string& status){
        
        // require_auth( _self );
        require_auth( author );
        Task::taskIndex tasks(_self, _self);
        auto iterator = tasks.find(task_id);
        eosio_assert(iterator != tasks.end(), "This ID of Task DID NOT exist !!!");
        
        tasks.modify(iterator, author, [&](auto& tasks) {
            tasks.status = status;
        });
        print("{ \"message\" : \" Successfully updated status. \"}");
    }

    [[eosio::action]]
    void Task::updatevotes(const account_name author, uint64_t task_id, string& likevote, string& hatevote){
        
        // require_auth( _self );
        require_auth( author );
        Task::taskIndex tasks(_self, _self);
        auto iterator = tasks.find(task_id);
        eosio_assert(iterator != tasks.end(), "This ID of Task DID NOT exist !!!");
        
        tasks.modify(iterator, author, [&](auto& tasks) {
            tasks.likevote = likevote;
            tasks.hatevote = hatevote;
        });
        print("{ \"message\" : \" Successfully updated votes. \"}");
    }

    //只有发任务者可以更新状态。并且会通知每个参加任务的人。
    //, uint64_t participantid
    [[eosio::action]]
    void Task::participate(const account_name author, uint64_t task_id, string& participantname){
        
        // require_auth( _self );
        require_auth( author );
        Task::taskIndex tasks(_self, _self);
        auto iterator = tasks.find(task_id);
        eosio_assert(iterator != tasks.end(), "This ID of Task DID NOT exist !!!");
        
        auto thetask = tasks.get(task_id);
        bool existflag = false;
        if (thetask.participants.size() > 0) {
            for (uint32_t i = 0; i < thetask.participants.size(); i++) {//i = 1 => i = 0
                // ATN： thetask.participants.at(0).id = 1 ！！！！
                // print("  \"id\": ",thetask.participants.at(i).id, ", ");
                if(thetask.participants.at(i).username.c_str()==participantname)
                    existflag = true;
            }
        } else {
            print("{\"message\" : \"participants attribute undefined.\" }");
        }

        if(existflag){
            print("{ \"message\" : \" Participant ALREADY exists! \"}");
        }else{
            iterator = tasks.find(task_id);
            tasks.modify(iterator, author, [&](auto& tasks) {
                tasks.participants.push_back(user{
                    //participantid,
                    participantname,
                    "0 ZJUBCA",
                    "0.0"
                });
            });
            print("{ \"message\" : \" Successfully add a participant. \"}");
        }
    }

    [[eosio::action]]
    void Task::withdraw(const account_name author, uint64_t task_id, string& participantname){
        
        // require_auth( _self );
        require_auth( author );
        Task::taskIndex tasks(_self, _self);
        auto iterator = tasks.find(task_id);
        eosio_assert(iterator != tasks.end(), "This ID of Task DID NOT exist !!!");
        
        auto thetask = tasks.get(task_id);
        bool existflag = false;
        if (thetask.participants.size() > 0) {
            for (uint32_t i = 0; i < thetask.participants.size(); i++) {//i = 1 => i = 0
                if(thetask.participants.at(i).username.c_str()==participantname)
                    existflag = true;
            }
        } else {
            print("{\"message\" : \"participants attribute undefined.\" }");
        }

        if(existflag){
            iterator = tasks.find(task_id);
            tasks.modify(iterator, author, [&](auto& tasks) {
                // tasks.participants.push_back(user{
                //     //participantid,
                //     participantname
                // });
                // tasks.participants.erase(tasks.participants.find(participantname));
                auto match_paticipate ([participantname](user p) { return p.username == participantname;});
                const auto new_end(
                    remove_if( begin(tasks.participants),
                            end(tasks.participants),
                            match_paticipate )
                );
                tasks.participants.erase(new_end, end(tasks.participants));
            });
            print("{ \"message\" : \" Successfully withdraw a participant. \"}");
        }else{
            print("{ \"message\" : \" Participant DID NOT exist! \"}");
        }
    }

    [[eosio::action]]
    void Task::erase(const account_name author, uint64_t task_id){
        
        // require_auth( _self );
        require_auth( author );
        Task::taskIndex tasks(_self, _self);
        auto iterator = tasks.find(task_id);
        auto thetask = tasks.get(task_id);

        string tasktitle = thetask.title;
        eosio_assert(iterator != tasks.end(), "This ID of Task DID NOT exist !!!");
        tasks.erase(iterator);
        print("{ \"message\" : \" Successfully erase a task titled ", tasktitle, ". \" }");
    }

    [[eosio::action]]
    void Task::allocateb(const account_name author, uint64_t task_id, string& participantname, 
    string distribution, string score){
        
        require_auth( author );
        Task::taskIndex tasks(_self, _self);
        auto iterator = tasks.find(task_id);
        eosio_assert(iterator != tasks.end(), "This ID of Task DID NOT exist !!!");
        
        auto thetask = tasks.get(task_id);
        string tasktitle = thetask.title;

        bool existflag = false;
        if (thetask.participants.size() > 0) {
            for (uint32_t i = 0; i < thetask.participants.size(); i++) {
                if(thetask.participants.at(i).username.c_str()==participantname){
                    existflag = true;
                    tasks.modify(iterator, author, [&](auto& t) {
                        // auto it = find_if(t.participants.begin(),t.participants.end(), [&](auto& p) {
                        //     return p.username == participantname
                        // });
                        t.participants.at(i).distribution = distribution;
                        t.participants.at(i).score = score;
                    });
                    print("{ \"message\" : \" Successfully allocateb for participant----", participantname, " at task ", tasktitle, " . \"}");
                }
            }
        } else {
            print("{\"message\" : \"participants size <= 0 .\" }");
        }
        if(!existflag){
            print("{ \"message\" : \" Participant DID NOT exist! \"}");
        }
    }

    // [[eosio::action]]
    // void Task::allocateab(const account_name author, uint64_t task_id, vector<string> participantname, vector<string> distribution, vector<string> score){
        
    //     for(uint32_t i = 0;i<participantname.size();i++){
    //         Task::allocateb(author, task_id, participantname[i], distribution[i], score[i]);
    //     }
    // }

    // [[eosio::action]]
    // void Task::allocateab(const account_name author, uint64_t task_id, vector<Task::user> participants){
        
    //     require_auth( author );
    //     Task::taskIndex tasks(_self, _self);
    //     auto iterator = tasks.find(task_id);
    //     eosio_assert(iterator != tasks.end(), "This ID of Task DID NOT exist !!!");
        
    //     auto thetask = tasks.get(task_id);
    //     string tasktitle = thetask.title;
    //     uint32_t size = thetask.participants.size();

    //     for(uint32_t i = 0; i < size; i++) {
    //         for(uint32_t j = 0; j < size; j++) {
    //             if( thetask.participants[i].username == participants[j].username){
    //                 tasks.modify(iterator, author, [&](auto& t) {
    //                     t.participants.at(i).distribution = participants[j].distribution;
    //                     t.participants.at(i).score = participants[j].score;
    //                 });
    //                 print("{ \"message\" : \" Successfully allocateb for participant----", 
    //                 participants[j].username, " at task ", tasktitle, " . \"}");
    //             }
    //         }
    //     }
    // }
}
