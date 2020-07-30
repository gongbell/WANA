#include<bits/stdc++.h>
#include <iostream>
#include <cstdio>
#include <ctime>
#include <string.h>
#include <stdio.h>      /* printf, scanf, puts, NULL */
#include <stdlib.h>     /* srand, rand */
#include <time.h>       /* time */

using namespace std;

int main()
{
  //std::clock_t start;
  double duration;
  //start = std::clock();
  auto start = std::chrono::system_clock::now();
  srand (time(NULL));

  vector<char> directions = {'N','S','W','E'};
  vector<string> road_words = {"Interstate", "Parkway", "Highway", "State Road", "Boulevard", "Turnpike"};
  vector<string> road_names = {"Sunset", "California", "Norway", "Water", "Court", "Samson",
                  "Johnson", "Zebra", "Thomas", "Jets", "Falcons", "Peters", "Zinkey",
                  "Roosevelt", "Bush", "Eisenhower", "Jerry", "Jenkins", "Bussie", "Moore"};
  vector<char> name_chars =  {'1', '2', '3','4','5','a','b',
              'c','d','e','f','g','h','i','j','k','l',
              'm','n','o','p','q','r','s','t','u','v','x','y','z'};

  string key = "EOS8mmfnSz17w7qS78XbS8T5jBU7UsFQiKBMU15xJzHTjSt1kseHs";
  int num_gates = 5;
  int transactions = num_gates * 2;
  vector<string> gates = {};
  vector<string> toll_gate_users = {};

  for (int i=0; i< num_gates; i++) {
    string gate_id= "";
    for (int j = 0; j< 5; j++) {
        gate_id += name_chars[rand() % name_chars.size()];
    }
    gates.push_back(gate_id);

    string command = "cleos create account eosio " + gate_id + " " + key + " " + key;
    cout << "Executing: " << command.c_str() << endl;
    system (command.c_str());

    string road_name = road_names[rand() % road_names.size()];
    string road_word = road_words[rand() % road_words.size()];
    char direction = directions[rand() % directions.size()];
    string highway_name = road_name + " " + road_word;
    string gatename = highway_name + " Exit " + to_string(rand() % 300);

    command = "cleos push action tolls createtg \'[\"" + gate_id + "\",\""
        + gatename + "\","
        + to_string(rand() % 200000) + "," + to_string(rand() % 200000) + ",\""
        + highway_name + "\"," + to_string(rand() % 450)
        + ",\"" + direction + "\"]\' -p " + gate_id ;

    cout << "Executing: " << command.c_str() << endl;
    system(command.c_str());
  }

  int num_toll_gate_users = 5;
  transactions += num_toll_gate_users * 2;
  for (int i=0; i< num_toll_gate_users; i++) {
    string tgu_id = "";
    for (int j = 0; j< 5; j++) {
        tgu_id += name_chars[rand() % name_chars.size()];
    }
    toll_gate_users.push_back(tgu_id);

    string command = "cleos create account eosio " + tgu_id + " " + key + " " + key;
    cout << "Executing: " << command.c_str() << endl;
    system (command.c_str());

    command = "cleos push action tolls createtgu \'[\"" + tgu_id + "\"]\' -p " + tgu_id ;

    cout << "Executing: " << command.c_str() << endl;
    system(command.c_str());
  }

  int num_breaches = 8;
  transactions += num_breaches;
  for (int i=0; i< num_breaches; i++) {
    string gate = gates[rand() % gates.size()];
    string tgu = toll_gate_users[rand() % toll_gate_users.size()];
    int breach_id = rand() % 10000;

    string command = "cleos push action tolls breachtg \'[\""
        + to_string(breach_id) + "\",\"" + gate
        + "\",\"" + tgu + "\"]\' -p " + gate + " -p " + tgu;

    cout << "Executing: " << command.c_str() << endl;
    system(command.c_str());
  }

  auto end = std::chrono::system_clock::now();
  std::chrono::duration<double> elapsed_seconds = end-start;

  //duration = ( clock() - start ) / (double) CLOCKS_PER_SEC;
  cout << "Transactions: " << transactions;
  cout << " Elapsed time: " << elapsed_seconds.count() << "s\n";
}
