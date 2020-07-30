/**
 *  @file
 *  @copyright defined in eos/LICENSE.txt
 */
#include <pandafun.hpp>
#include <string.h>

namespace pandafun
{
    using namespace eosio;
    void pausecheck();
    void blackcheck(account_name user);
    void apply_signup( const pandafun::signup& signup_msg );

    int hashcheck(checksum256 submit_hash, uint64_t randomnumber)
    {
        checksum256 hash;
        char str[LENINT64];
        memset(str, 0, LENINT64);
        snprintf(str, LENINT64, "%llu", randomnumber);
        sha256(str, strlen(str), &hash);
        if(strncmp((const char *)submit_hash.hash, (const char *)hash.hash, 32) != 0)
        {
            /* Consumes too much time
            print(" client random: ", randomnumber, " \n");
            print(" client random in string: ");
            prints(str);
            print(" submit hash: ");
            printhex( &submit_hash, 32 );
            print(" hash: ");
            printhex( &hash, 32 );
            print(" end of hash \n ");
            */
            return 1;
        }
        return 0;
    }

    void apply_init()
    {
        require_auth( auth_account );
        config_type configs(code_account, code_account);
        auto itr = configs.find(0);
        if (itr == configs.end())
        {
            configs.emplace(code_account, [&](auto &rec)
            {
                rec.id = 0;
                rec.normal = 0;
                rec.copper = 0;
                rec.silver = 0;
                rec.gold = 0;
                rec.diamond = 0;
                rec.players = 28000;
                rec.normalkey = 10000;
                rec.diamondkey = 1;
                rec.upgrade7days = 0;
                rec.transform7days = 0;
                rec.candles7days = 0;
                rec.paused = RUNNING;
            });

            uint32_t index = now() / SECONDSADAY - 1;
            asset_count_type candles(code_account, N(pray));
            auto candlesitr = candles.find(index);
            if (candlesitr == candles.end())
            {
                candles.emplace(code_account, [&](auto &rec)
                {
                    rec.timestamp = index;
                    rec.number = 15000;
                });
            }
            asset_count_type books(code_account, N(upgrade));
            auto booksitr = books.find(index);
            if (booksitr == books.end())
            {
                books.emplace(code_account, [&](auto &rec)
                {
                    rec.timestamp = index;
                    rec.number = 15000;
                });
            }
            asset_count_type tea(code_account, N(transform));
            auto teaitr = tea.find(index);
            if (teaitr == tea.end())
            {
                tea.emplace(code_account, [&](auto &rec)
                {
                    rec.timestamp = index;
                    rec.number = 15000;
                });
            }
            pandafun::signup signup_msg = {code_account, 0};
            pandafun::apply_signup(signup_msg);
            signup_msg.user = auth_account;
            pandafun::apply_signup(signup_msg);
        }
    }

    // Only for pandafun to sell pandas more than one to the user
    void apply_transfers( const pandafun::transfers& transfers_msg )
    {
        eosio_assert(transfers_msg.memo.size() <= 256, "memo has more than 256 bytes" );
        require_auth( auth_account );
        pausecheck();
        blackcheck(transfers_msg.to);
        panda_table_type pandas_to(code_account, transfers_msg.to);
        apply_init();
        eosio_assert(transfers_msg.quantity > 0, "Transfer from account pandafun, quantity must larger than 0!");
        eosio_assert(transfers_msg.quantity < 1001, "Transfer from account pandafun, quantity must less than 1001!");
        config_type configs(code_account, code_account);
        auto itr = configs.find(0);
        eosio_assert(itr != configs.end(), "NO key 0 row found in table configs.\n");
        auto normalkey = itr->normalkey;
        auto normal = itr->normal;
        for (short i = 0; i < transfers_msg.quantity; i++)
        {
            pandas_to.emplace(code_account, [&](auto &rec)
            {
                rec.id = normalkey;
                rec.type = normal_type;
                memset(rec.skills, 0, SKILLLEN);
                rec.skills[INNER_DAN] = 10;
            });
            normalkey += 1;
            normal += 1;
        }
        configs.modify(itr, code_account, [&](auto &rec)
        {
            rec.normalkey = normalkey;
            rec.normal = normal;
        });
    }


    void apply_sell( const pandafun::sell& sell_msg )
    {
        eosio_assert(sell_msg.memo.size() <= 256, "memo has more than 256 bytes" );
        require_auth( sell_msg.seller );
        pausecheck();
        blackcheck(sell_msg.seller);
        panda_table_type pandas(code_account, sell_msg.seller);
        selling_table_type pandas_selling(code_account, sell_msg.seller);
        eosio_assert( sell_msg.price.symbol == S(4,EOS) , "Only EOS token allowed.\n" );
        eosio_assert( sell_msg.price.is_valid(), "Invalid sell_msg.price\n" );
        eosio_assert( sell_msg.price.amount > 0, "The sell_msg.price must be positive.\n" );
        auto sellitr = pandas_selling.find(sell_msg.id);
        eosio_assert(sellitr == pandas_selling.end(), "sell(): The panda has been in sale.\n");
        auto pandaitr = pandas.find(sell_msg.id);
        eosio_assert(pandaitr != pandas.end(), "sell(): The panda does not exist.\n");
        pandas_selling.emplace(code_account, [&](auto &rec)
        {
            rec.id = pandaitr->id;
            rec.type = pandaitr->type;
            memcpy(rec.skills, pandaitr->skills, SKILLLEN);
            rec.price = sell_msg.price;
        });
        pandas.erase(pandaitr);
    }

    void apply_cancelsell( const pandafun::cancelsell& cancelsell_msg )
    {
        eosio_assert(cancelsell_msg.memo.size() <= 256, "memo has more than 256 bytes" );
        require_auth( cancelsell_msg.seller );
        pausecheck();
        blackcheck(cancelsell_msg.seller);
        panda_table_type pandas(code_account, cancelsell_msg.seller);
        selling_table_type pandas_selling(code_account, cancelsell_msg.seller);
        auto sellitr = pandas_selling.find(cancelsell_msg.id);
        eosio_assert(sellitr != pandas_selling.end(), "cancelsell(): The panda isn't in sale.\n");
        pandas.emplace(code_account, [&](auto &rec)
        {
            rec.id = sellitr->id;
            rec.type = sellitr->type;
            memcpy(rec.skills, sellitr->skills, SKILLLEN);
        });
        pandas_selling.erase(sellitr);
    }

    void apply_buy( const pandafun::buy& buy_msg )
    {
        eosio_assert(buy_msg.memo.size() <= 256, "memo has more than 256 bytes" );
        require_auth( auth_account );
        pausecheck();
        blackcheck(buy_msg.buyer);
        panda_table_type pandas_buyer(code_account, buy_msg.buyer);
        selling_table_type pandas_selling(code_account, buy_msg.seller);
        auto sellitr = pandas_selling.find(buy_msg.id);
        eosio_assert(sellitr != pandas_selling.end(), "buy(): The panda isn't in sale.\n");
        eosio_assert(buy_msg.price >= sellitr->price, "buy(): The buyer's price is lower than the seller's.\n");
        pandas_buyer.emplace(code_account, [&](auto &rec)
        {
            rec.id = sellitr->id;
            rec.type = sellitr->type;
            memcpy(rec.skills, sellitr->skills, SKILLLEN);
        });
        pandas_selling.erase(sellitr);
    }

    void apply_recvhashs( const pandafun::recvhashs& recvhashs_msg )
    {
        require_auth( recvhashs_msg.from );
        if (recvhashs_msg.from != auth_account)
        {
            pausecheck();
            blackcheck(recvhashs_msg.from);
        }
        hashmore_type hashs(code_account, recvhashs_msg.scope);
        auto itr = hashs.begin();
        if (itr != hashs.end())
        {
            // check the exist hashs are of the same txn with the coming one
            // clear it if not
            if (recvhashs_msg.from == auth_account)
            {
                if (itr->txnid == recvhashs_msg.txnid)
                {
                    for (uint8_t i = 0; i < HASHNUM; i++)
                    {
                        hashs.modify(itr, code_account, [&](auto &rec)
                        {
                            rec.srvhash = recvhashs_msg.hashs[i];
                        });
                        itr++;
                    }
                }
                else
                {
                    for (uint8_t i = 0; i < HASHNUM; i++)
                    {
                        hashs.modify(itr, code_account, [&](auto &rec)
                        {
                            rec.srvhash = recvhashs_msg.hashs[i];
                            memset(&rec.hash, 0, sizeof(checksum256));
                            rec.txnid = recvhashs_msg.txnid;
                        });
                        itr++;
                    }
                }
            }
            else
            {
                if (itr->txnid == recvhashs_msg.txnid)
                {
                    for (uint8_t i = 0; i < HASHNUM; i++)
                    {
                        hashs.modify(itr, code_account, [&](auto &rec)
                        {
                            rec.hash = recvhashs_msg.hashs[i];
                        });
                        itr++;
                    }
                }
                else
                {
                    for (uint8_t i = 0; i < HASHNUM; i++)
                    {
                        hashs.modify(itr, code_account, [&](auto &rec)
                        {
                            rec.hash = recvhashs_msg.hashs[i];
                            memset(&rec.srvhash, 0, sizeof(checksum256));
                            rec.txnid = recvhashs_msg.txnid;
                        });
                        itr++;
                    }
                }
            }
        }
        else
        {
            if (recvhashs_msg.from == auth_account)
            {
                for (uint8_t i = 0; i < HASHNUM; i++)
                {
                    hashs.emplace(code_account, [&](auto &rec)
                    {
                        rec.id = hashs.available_primary_key();
                        rec.srvhash = recvhashs_msg.hashs[i];
                        rec.txnid = recvhashs_msg.txnid;
                    });
                }
            }
            else
            {
                for (uint8_t i = 0; i < HASHNUM; i++)
                {
                    hashs.emplace(code_account, [&](auto &rec)
                    {
                        rec.id = hashs.available_primary_key();
                        rec.hash = recvhashs_msg.hashs[i];
                        rec.txnid = recvhashs_msg.txnid;
                    });
                }
            }
        }
    }

    void apply_recvhash( const pandafun::recvhash& recvhash_msg )
    {
        require_auth( recvhash_msg.from );
        if (recvhash_msg.from != auth_account)
        {
            pausecheck();
            blackcheck(recvhash_msg.from);
        }
        hash_type hashs(code_account, recvhash_msg.scope);
        auto itr = hashs.find(0);
        if (itr != hashs.end())
        {
            // sometimes we cannot clean the hash table, it will contain
            // one hash, so we cannot reauire the txnid match with each other,
            // so we just update the txnid based on the last one, let the action
            // ensure the hash's txnid matches the action's txnid
            //eosio_assert(itr->txnid == recvhash_msg.txnid, "The received txnid doesn't match the exist one.\n");
            if (recvhash_msg.from == auth_account)
            {
                hashs.modify(itr, code_account, [&](auto &rec)
                {
                    rec.srvhash = recvhash_msg.hash;
                    if (rec.txnid != recvhash_msg.txnid)
                    {
                        rec.txnid = recvhash_msg.txnid;
                        memset(&rec.hash, 0, sizeof(checksum256));
                    }
                });
            }
            else
            {
                hashs.modify(itr, code_account, [&](auto &rec)
                {
                    rec.hash = recvhash_msg.hash;
                    if (rec.txnid != recvhash_msg.txnid)
                    {
                        rec.txnid = recvhash_msg.txnid;
                        memset(&rec.srvhash, 0, sizeof(checksum256));
                    }
                });
            }
        }
        else
        {
            if (recvhash_msg.from == auth_account)
            {
                hashs.emplace(code_account, [&](auto &rec)
                {
                    rec.id = 0;
                    rec.srvhash = recvhash_msg.hash;
                    rec.txnid = recvhash_msg.txnid;
                });
            }
            else
            {
                hashs.emplace(code_account, [&](auto &rec)
                {
                    rec.id = 0;
                    rec.hash = recvhash_msg.hash;
                    rec.txnid = recvhash_msg.txnid;
                });
            }
        }
    }

    void apply_dice( const pandafun::dice& dice_msg )
    {
        require_auth( auth_account );
        pausecheck();
        blackcheck(dice_msg.player);
        hash_type hashs(code_account, dice_msg.player);
        auto itr = hashs.find(0);
        eosio_assert (itr != hashs.end(), "No hash found under player.\n");
        eosio_assert (itr->txnid == dice_msg.txnid, "dice(): txnid doesn't match.\n");
        auto submit_hash = itr->hash;
        auto server_hash = itr->srvhash;
        uint64_t random = 0;
        // owner
        if (hashcheck(submit_hash, dice_msg.randomvalue) == 0)
            random ^= dice_msg.randomvalue;
        eosio_assert(hashcheck(server_hash, dice_msg.srvrandom) == 0, "dice(): server's random number's sha256 sum doesn't match the submitted one.\n");
        random ^= dice_msg.srvrandom;
        auto finalvalue = random % 11 + 2;
        dice_type dice(code_account, dice_msg.player);
        auto diceitr = dice.find(0);
        if (diceitr == dice.end())
        {
            dice.emplace(code_account, [&](auto &rec)
            {
                rec.id = 0;
                rec.txnid = dice_msg.txnid;
                rec.value = finalvalue;
            });
        }
        else
        {
            dice.modify(diceitr, code_account, [&](auto &rec)
            {
                rec.txnid = dice_msg.txnid;
                rec.value = finalvalue;
            });
        }
    }

    void generate_rand(uint32_t input, char out[3], uint32_t mod, int needed)
    {
        int32_t tmp = 0;
        int32_t equal = 0;
        int32_t produced = 0;
        for (int i = 0; produced < needed; i++)
        {
            for (int j = i + 1; produced < needed; j++)
            {
                equal = 0;
                auto middle = input + j;
                tmp = (char)(middle * middle * middle % mod);
                for (int k = 0; k < 3; k++)
                {
                    if (tmp == out[k])
                    {
                        equal = 1;
                        break;
                    }
                }
                if (!equal)
                {
                    out[i] = tmp;
                    produced++;
                    if (produced == needed)
                        return;
                    break;
                }
            }
        }
    }

    void apply_pray( const pandafun::pray& pray_msg )
    {
        require_auth( auth_account );
        pausecheck();
        blackcheck(pray_msg.player);
        panda_table_type pandas(code_account, pray_msg.player);
        auto pandaitr = pandas.find(pray_msg.panda_id);
        eosio_assert(pandaitr != pandas.end(), "pray(): The panda does not exist.\n");
        eosio_assert(pandaitr->type != diamond_type, "pray(): The diamond panda cannot pray.\n");

        asset_type assets(code_account, pray_msg.player);
        auto asset_itr = assets.find(0);
        eosio_assert (asset_itr != assets.end(), "pray(): No asset found in table assets.\n");
        eosio_assert (asset_itr->candles > 0, "pray(): No candles left..\n");
        assets.modify(asset_itr, code_account, [&](auto &rec)
        {
            rec.candles = asset_itr->candles - 1;
            print("One used, left candles: ", rec.candles, " ");
        });

        hash_type hashs(code_account, pray_msg.player);
        auto hashitr = hashs.find(0);
        eosio_assert (hashitr != hashs.end(), "No hash found under player.\n");
        eosio_assert (hashitr->txnid == pray_msg.txnid, "pray(): txnid doesn't match.\n");
        auto submit_hash = hashitr->hash;
        auto server_hash = hashitr->srvhash;

        eosio_assert(hashcheck(submit_hash, pray_msg.randomvalue) == 0, "pray(): player's random number's sha256 sum doesn't match the submitted one.\n");
        eosio_assert(hashcheck(server_hash, pray_msg.srvrandom) == 0, "pray(): server's random number's sha256 sum doesn't match the submitted one.\n");
        auto result = pray_msg.randomvalue ^ pray_msg.srvrandom;
        const int32_t range = 45000;
        auto probability = result % range;

        config_type configs(code_account, code_account);
        auto cfgitr = configs.find(0);
        eosio_assert(cfgitr != configs.end(), "pray(): NO key 0 row found in table configs.\n");
        auto candles7days = cfgitr->candles7days;
        auto allplayers = cfgitr->players;
        hashs.erase(hashitr);
        auto lefttimes = pandaitr->skills[INNER_DAN] - 1;
        if (lefttimes == 0)
        {
            if (pandaitr->type == normal_type)
            {
                configs.modify(cfgitr, code_account, [&](auto &rec)
                {
                    rec.normal = cfgitr->normal - 1;
                });
            }
            else if (pandaitr->type == copper_type)
            {
                configs.modify(cfgitr, code_account, [&](auto &rec)
                {
                    rec.copper = cfgitr->copper - 1;
                });
            }
            else if (pandaitr->type == silver_type)
            {
                configs.modify(cfgitr, code_account, [&](auto &rec)
                {
                    rec.silver = cfgitr->silver - 1;
                });
            }
            else if (pandaitr->type == gold_type)
            {
                configs.modify(cfgitr, code_account, [&](auto &rec)
                {
                    rec.gold = cfgitr->gold - 1;
                });
            }
            pandas.erase(pandaitr);
        }
        else
        {
            pandas.modify(pandaitr, code_account, [&](auto &rec)
            {
                rec.skills[INNER_DAN] = lefttimes;
            });
        }

        // update the statistics table for candles
        uint32_t index = now() / SECONDSADAY;
        asset_count_type candles(code_account, N(pray));
        auto candlesitr = candles.find(index);
        if (candlesitr == candles.end())    // a new day
        {
            candles.emplace(code_account, [&](auto &rec)
            {
                rec.timestamp = index;
                rec.number = 1;
            });
            // add yesterday's value to the statistics, subtract the 8th day's value before if exists
            auto reverseitr = candles.rbegin();
            if (reverseitr != candles.rend())
                reverseitr++;
            if (reverseitr != candles.rend())
            {
                configs.modify(cfgitr, code_account, [&](auto &rec)
                {
                    rec.candles7days = cfgitr->candles7days + reverseitr->number;
                });
            }
            reverseitr = candles.rbegin();
            for (int i = 0; i < 7; i++)
            {
                if (reverseitr != candles.rend())
                    reverseitr++;
                else
                    break;
            }
            if (reverseitr != candles.rend())
            {
                configs.modify(cfgitr, code_account, [&](auto &rec)
                {
                    rec.candles7days = cfgitr->candles7days - reverseitr->number;
                });
            }
        }
        else
        {
            candles.modify(candlesitr, code_account, [&](auto &rec)
            {
                rec.number = candlesitr->number + 1;
            });
        }

        // probability, according to different panda type
        int32_t pup = -1;
        int32_t psame = -1;
        panda_type newtype = 0;
        int32_t success = 1;
        // three sections: [0~45000)
        // 1. upgraded probability, such as [0-1000)
        // 2. the same probability, such as [1000-10000)
        // 3. fail probability, the left, we just judge the first two's probability
        if (pandaitr->type == normal_type)
        {
            // (NP - N7) / (50 * (NP - N7)) + 0.06
            // up:   range * [(NP - N7) / (300 * (NP - N7)) + 0.014]
            // same: range * [(NP - N7) / (50 * (NP - N7)) + 0.04]
            // 45000 / 300 = 150
            // 45000 / 50 = 900
            pup = (int)(150. * (allplayers - candles7days) / (allplayers + candles7days) + 0.5) + 630;
            psame = (int)(900. * (allplayers - candles7days) / (allplayers + candles7days) + 0.5) + 1800 + pup;
            if (probability >= psame)
            {
                success = 0;
            }
            else if (probability < pup)
            {
                newtype = copper_type;
            }
            else
            {
                newtype = normal_type;
            }
        }
        else if (pandaitr->type == copper_type)
        {
            // up:   range * [(NP - N7) / (300 * (NP - N7)) + 0.011]
            // same: range * [(NP - N7) / (50 * (NP - N7)) + 0.037]
            pup = (int)(150. * (allplayers - candles7days) / (allplayers + candles7days) + 0.5) + 495;
            psame = (int)(900. * (allplayers - candles7days) / (allplayers + candles7days) + 0.5) + 1665 + pup;
            if (probability >= psame)
            {
                success = 0;
            }
            else if (probability < pup)
            {
                if (cfgitr->silver < SILVERMAX)
                {
                    newtype = silver_type;
                }
                else
                {
                    success = 0;
                    print("sorry, silver panda has reached the limit.\n");
                }
            }
            else
            {
                newtype = copper_type;
            }
        }
        else if (pandaitr->type == silver_type)
        {
            // up:   range * [(NP - N7) / (450 * (NP - N7)) + 0.0067]
            // same: range * [(NP - N7) / (75 * (NP - N7)) + 0.023]
            pup = (int)(100. * (allplayers - candles7days) / (allplayers + candles7days) + 0.5) + 301;
            psame = (int)(600. * (allplayers - candles7days) / (allplayers + candles7days) + 0.5) + 1035 + pup;
            if (probability >= psame)
            {
                success = 0;
            }
            else if (probability < pup)
            {
                if (cfgitr->gold < GOLDENMAX)
                {
                    newtype = gold_type;
                }
                else
                {
                    success = 0;
                    print("sorry, gold panda has reached the limit.\n");
                }
            }
            else
            {
                if (cfgitr->silver < SILVERMAX)
                {
                    newtype = silver_type;
                }
                else
                {
                    success = 0;
                    print("sorry, silver panda has reached the limit.\n");
                }
            }
        }
        else if (pandaitr->type == gold_type)
        {
            // up:   range * [(NP - N7) / (750 * (NP - N7)) + 0.0027]
            // same: range * [(NP - N7) / (125 * (NP - N7)) + 0.013]
            pup = (int)(60. * (allplayers - candles7days) / (allplayers + candles7days) + 0.5) + 121;
            psame = (int)(360. * (allplayers - candles7days) / (allplayers + candles7days) + 0.5) + 585 + pup;
            if (probability >= psame)
            {
                success = 0;
            }
            else if (probability < pup)
            {
                if (cfgitr->diamond < DIAMONDMAX)
                {
                    newtype = diamond_type;
                }
                else
                {
                    success = 0;
                    print("sorry, diamond panda has reached the limit.\n");
                }
            }
            else
            {
                if (cfgitr->gold < GOLDENMAX)
                {
                    newtype = gold_type;
                }
                else
                {
                    success = 0;
                    print("sorry, gold panda has reached the limit.\n");
                }
            }
        }
        else
        {
            print("pray(): Don't support this type to pray.\n");
        }

        pray_type prays(code_account, pray_msg.player);
        auto prayitr = prays.begin();
        // skip if it's a 10 continuous action
        if ((prayitr != prays.end()) && prayitr->txnid != pray_msg.txnid)
        {
            while (prayitr != prays.end())
            {
                prayitr = prays.erase(prayitr);
            }
        }
        if (success == 0)
        {
            prays.emplace(code_account, [&](auto &rec)
            {
                memset(&rec, 0, sizeof(rec));
                rec.txnid = pray_msg.txnid;
                rec.panda_id = cfgitr->normalkey;
            });
            configs.modify(cfgitr, code_account, [&](auto &rec)
            {
                rec.normalkey = cfgitr->normalkey + 1;
            });
            return;
        }
        // success
        char skill[3] = {0};
        char newskills[SKILLLEN] = {0};
        uint64_t newpandaid = 0;
        if (newtype == diamond_type)
        {
            newskills[INNER_DAN] = DIAMONDDAN;
            newpandaid = cfgitr->diamondkey;
            configs.modify(cfgitr, code_account, [&](auto &rec)
            {
                rec.diamondkey = cfgitr->diamondkey + 1;
                rec.diamond = cfgitr->diamond + 1;
            });
            // three skills
            generate_rand(probability, skill, SKILLS, 3);
            for (int i = 0; i < 3; i++)
            {
                BSETLEVEL(newskills[skill[i]], 1);
                if (i == 0)
                    BSETTIMES(newskills[skill[i]], 2);
                else
                    BSETTIMES(newskills[skill[i]], 1);
            }
        }
        else
        {
            newpandaid = cfgitr->normalkey;
            configs.modify(cfgitr, code_account, [&](auto &rec)
            {
                rec.normalkey = cfgitr->normalkey + 1;
            });
            if (newtype == normal_type)
            {
                newskills[INNER_DAN] = NORMALDAN;
                // no skills
                configs.modify(cfgitr, code_account, [&](auto &rec)
                {
                    rec.normal = cfgitr->normal + 1;
                });
            }
            else if (newtype == copper_type)
            {
                newskills[INNER_DAN] = BRONZEDAN;
                configs.modify(cfgitr, code_account, [&](auto &rec)
                {
                    rec.copper = cfgitr->copper + 1;
                });
                // one skill
                generate_rand(probability, skill, SKILLS, 1);
                BSETLEVEL(newskills[skill[0]], 0x1);
                BSETTIMES(newskills[skill[0]], 1);
            }
            else if (newtype == silver_type)
            {
                newskills[INNER_DAN] = SILVERDAN;
                configs.modify(cfgitr, code_account, [&](auto &rec)
                {
                    rec.silver = cfgitr->silver + 1;
                });
                // two skills
                generate_rand(probability, skill, SKILLS, 2);
                for (int i = 0; i < 2; i++)
                {
                    BSETLEVEL(newskills[skill[i]], 0x1);
                    BSETTIMES(newskills[skill[i]], 1);
                }
            }
            else if (newtype == gold_type)
            {
                newskills[INNER_DAN] = GOLDENDAN;
                configs.modify(cfgitr, code_account, [&](auto &rec)
                {
                    rec.gold = cfgitr->gold + 1;
                });
                // two skills
                generate_rand(probability, skill, SKILLS, 2);
                for (int i = 0; i < 2; i++)
                {
                    BSETLEVEL(newskills[skill[i]], 1);
                    if (i == 0)
                        BSETTIMES(newskills[skill[i]], 2);
                    else
                        BSETTIMES(newskills[skill[i]], 1);
                }
            }
        }
        pandas.emplace(code_account, [&](auto &rec)
        {
            rec.id = newpandaid;
            rec.type = newtype;
            memcpy(rec.skills, newskills, SKILLLEN);
        });
        prays.emplace(code_account, [&](auto &rec)
        {
            rec.panda_id = newpandaid;
            rec.type = newtype;
            memcpy(rec.skills, newskills, SKILLLEN);
            rec.txnid = pray_msg.txnid;
            rec.success = 1;
        });
    }

    // save the hashs from hashsmore to the 'hashs' table one by one
    // and call the apply_pray()
    void apply_prays( const pandafun::prays& prays_msg )
    {
        require_auth( auth_account );
        pausecheck();
        blackcheck(prays_msg.player);

        panda_table_type pandas(code_account, prays_msg.player);
        auto pandaitr = pandas.find(prays_msg.panda_id);
        eosio_assert(pandaitr != pandas.end(), "prays(): The panda does not exist.\n");
        eosio_assert(pandaitr->type != diamond_type, "prays(): The diamond panda cannot pray.\n");

        asset_type assets(code_account, prays_msg.player);
        auto asset_itr = assets.find(0);
        eosio_assert (asset_itr != assets.end(), "prays(): No asset found in table assets.\n");
        eosio_assert (asset_itr->candles >= 10, "prays(): the candles left are less than 10 ..\n");

        // clear the pray result table if it's not empty
        pray_type prays(code_account, prays_msg.player);
        auto prayitr = prays.begin();
        while (prayitr != prays.end())
        {
            prayitr = prays.erase(prayitr);
        }

        hashmore_type hashsmore(code_account, prays_msg.player);
        auto moreitr = hashsmore.begin();
        eosio_assert(moreitr != hashsmore.end(), "The hashsmore table is empty.\n ");
        eosio_assert (moreitr->txnid == prays_msg.txnid, "prays(): txnid doesn't match.\n");

        for (uint8_t i = 0; i < HASHNUM; i++)
        {
            // ensure the panda is alive
            panda_table_type pandas(code_account, prays_msg.player);
            auto pandaitr = pandas.find(prays_msg.panda_id);
            if (pandaitr == pandas.end())
            {
                print("The panda no longer exists.\n");
                break;
            }
            eosio_assert(moreitr != hashsmore.end(), "moreitr reaches the end of the table hashsmore.\n");
            // We MUST define it here, it's like the inode on the disk, the editor
            // holds the inode, but it's not the same one checked out by git, different inode!!
            hash_type hashs(code_account, prays_msg.player);
            auto hashitr = hashs.find(0);
            if (hashitr != hashs.end())
                hashs.erase(hashitr);
            hashs.emplace(code_account, [&](auto &rec)
            {
                rec.id = 0;
                rec.hash = moreitr->hash;
                rec.srvhash = moreitr->srvhash;
                rec.txnid = moreitr->txnid;
            });
            moreitr++;
            pandafun::pray pray_msg = {prays_msg.player, prays_msg.panda_id, prays_msg.randomvalue[i], prays_msg.srvrandom[i], prays_msg.txnid };
            pandafun::apply_pray(pray_msg);
        }
        hashmore_type hashsmorerm(code_account, prays_msg.player);
        moreitr = hashsmorerm.begin();
        while (moreitr != hashsmorerm.end())
        {
            moreitr = hashsmorerm.erase(moreitr);
        }
    }

    void apply_upgrade( const pandafun::upgrade& upgrade_msg )
    {
        require_auth( auth_account );
        pausecheck();
        blackcheck(upgrade_msg.player);
        asset_type assets(code_account, upgrade_msg.player);
        auto asset_itr = assets.find(0);
        eosio_assert (asset_itr != assets.end(), "upgrade(): No asset found in table assets.\n");
        eosio_assert (asset_itr->books > 0, "upgrade(): No books left..\n");
        panda_table_type pandas(code_account, upgrade_msg.player);
        auto pandaitr = pandas.find(upgrade_msg.panda_id);
        eosio_assert(pandaitr != pandas.end(), "upgrade(): The panda does not exist.\n");
        auto current_level = BGETLEVEL(pandaitr->skills[upgrade_msg.skill]);
        eosio_assert(current_level > 0, "upgrade(): This panda doesn't have this skill.\n");
        eosio_assert(current_level < skills[upgrade_msg.skill].top_level, "upgrade(): This skill has been the top level.\n");
        hash_type hashs(code_account, upgrade_msg.player);
        auto hashitr = hashs.find(0);
        eosio_assert (hashitr != hashs.end(), "No hash found under player.\n");
        eosio_assert (hashitr->txnid == upgrade_msg.txnid, "upgrade(): txnid doesn't match.\n");
        auto submit_hash = hashitr->hash;
        auto server_hash = hashitr->srvhash;

        eosio_assert(hashcheck(submit_hash, upgrade_msg.randomvalue) == 0, "upgrade(): player's random number's sha256 sum doesn't match the submitted one.\n");
        eosio_assert(hashcheck(server_hash, upgrade_msg.srvrandom) == 0, "upgrade(): server's random number's sha256 sum doesn't match the submitted one.\n");
        auto result = upgrade_msg.randomvalue ^ upgrade_msg.srvrandom;
        auto probability = result % 35000;

        if (!DEBUG)
        {
            hashs.erase(hashitr);
        }
        assets.modify(asset_itr, code_account, [&](auto &rec)
        {
            rec.books = asset_itr->books - 1;
            print("One used, left books: ", rec.books, " ");
        });

        // update the statistics table for books
        uint32_t index = now() / SECONDSADAY;
        config_type configs(code_account, code_account);
        auto cfgitr = configs.find(0);
        eosio_assert(cfgitr != configs.end(), "upgrade(): NO key 0 row found in table configs.\n");
        asset_count_type books(code_account, N(upgrade));
        auto booksitr = books.find(index);
        if (booksitr == books.end())    // a new day
        {
            books.emplace(code_account, [&](auto &rec)
            {
                rec.timestamp = index;
                rec.number = 1;
            });
            // add yesterday's value to the statistics, subtract the 8th day's value before if exists
            auto reverseitr = books.rbegin();
            if (reverseitr != books.rend())
                reverseitr++;
            if (reverseitr != books.rend())
            {
                configs.modify(cfgitr, code_account, [&](auto &rec)
                {
                    rec.upgrade7days = cfgitr->upgrade7days + reverseitr->number;
                });
            }
            reverseitr = books.rbegin();
            for (int i = 0; i < 7; i++)
            {
                if (reverseitr != books.rend())
                    reverseitr++;
                else
                    break;
            }
            if (reverseitr != books.rend())
            {
                configs.modify(cfgitr, code_account, [&](auto &rec)
                {
                    rec.upgrade7days = cfgitr->upgrade7days - reverseitr->number;
                });
            }
        }
        else
        {
            books.modify(booksitr, code_account, [&](auto &rec)
            {
                rec.number = booksitr->number + 1;
            });
        }

        int32_t pup = -1;
        int32_t newlevel = current_level;
        int32_t success = 1;
        auto allplayers = cfgitr->players;
        auto upgrade7days = cfgitr->upgrade7days;
        if (current_level == 1)
        {
            // 2 sections, enlarge by 35000: [0~35000]
            // (NP - N7) / (50 * (NP + N7)) + 0.04 / 0.01
            // 1. upgraded probability, such as [0-1000)
            // 2. fail probability, the left
            pup = (int)(700. * (allplayers - upgrade7days) / (allplayers + upgrade7days) + 0.5) + 1400;
            if (probability < pup)
            {
                newlevel = current_level + 1;
            }
            else
            {
                success = 0;
            }

        }
        else if (current_level == 2)
        {
            pup = (int)(200. * (allplayers - upgrade7days) / (allplayers + upgrade7days) + 0.5) + 350;
            if (probability < pup)
            {
                newlevel = current_level + 1;
            }
            else
            {
                success = 0;
            }

        }

        upgrade_type upgraderec(code_account, upgrade_msg.player);
        auto upgradeitr = upgraderec.begin();
        // skip if it's a 10 continuous action
        if ((upgradeitr != upgraderec.end()) && upgradeitr->txnid != upgrade_msg.txnid)
        {
            while (upgradeitr != upgraderec.end())
            {
                upgradeitr = upgraderec.erase(upgradeitr);
            }
        }
        if (success == 0)
        {
            upgraderec.emplace(code_account, [&](auto &rec)
            {
                rec.id = upgraderec.available_primary_key();
                rec.newlevel = 0;
                rec.txnid = upgrade_msg.txnid;
                rec.success = 0;
            });
            return;
        }
        else
        {
            upgraderec.emplace(code_account, [&](auto &rec)
            {
                rec.id = upgraderec.available_primary_key();
                rec.newlevel = newlevel;
                rec.txnid = upgrade_msg.txnid;
                rec.success = 1;
            });
        }
        // success
        auto current_skill = pandaitr->skills[upgrade_msg.skill];
        BSETLEVEL(current_skill, newlevel);
        pandas.modify(pandaitr, code_account, [&](auto &rec)
        {
            rec.skills[upgrade_msg.skill] = current_skill;
        });
    }


    void apply_upgrades( const pandafun::upgrades& upgrades_msg )
    {
        require_auth( auth_account );
        pausecheck();
        blackcheck(upgrades_msg.player);

        asset_type assets(code_account, upgrades_msg.player);
        auto asset_itr = assets.find(0);
        eosio_assert (asset_itr != assets.end(), "upgrades(): No asset found in table assets.\n");
        eosio_assert (asset_itr->books >= 10, "upgrades(): the books left are less than 10 ..\n");

        panda_table_type pandas(code_account, upgrades_msg.player);
        auto pandaitr = pandas.find(upgrades_msg.panda_id);
        eosio_assert(pandaitr != pandas.end(), "upgrades(): The panda does not exist.\n");
        auto current_level = BGETLEVEL(pandaitr->skills[upgrades_msg.skill]);
        eosio_assert(current_level > 0, "upgrades(): This panda doesn't have this skill.\n");
        eosio_assert(current_level < skills[upgrades_msg.skill].top_level, "upgrades(): This skill has been the top level.\n");

        // clear the upgrade result table if it's not empty
        upgrade_type upgraderec(code_account, upgrades_msg.player);
        auto upgradeitr = upgraderec.begin();
        while (upgradeitr != upgraderec.end())
        {
            upgradeitr = upgraderec.erase(upgradeitr);
        }

        hashmore_type hashsmore(code_account, upgrades_msg.player);
        auto moreitr = hashsmore.begin();
        eosio_assert(moreitr != hashsmore.end(), "The hashsmore table is empty.\n ");
        eosio_assert (moreitr->txnid == upgrades_msg.txnid, "upgrades(): txnid doesn't match.\n");

        for (uint8_t i = 0; i < HASHNUM; i++)
        {
            panda_table_type pandas(code_account, upgrades_msg.player);
            auto pandaitr = pandas.find(upgrades_msg.panda_id);
            auto current_level = BGETLEVEL(pandaitr->skills[upgrades_msg.skill]);
            if(current_level >= skills[upgrades_msg.skill].top_level)
            {
                print(" upgrades(): This skill has been the top level.\n");
                break;
            }
            eosio_assert(moreitr != hashsmore.end(), "moreitr reaches the end of the table hashsmore.\n");
            hash_type hashs(code_account, upgrades_msg.player);
            auto hashitr = hashs.find(0);
            if (hashitr != hashs.end())
                hashs.erase(hashitr);
            hashs.emplace(code_account, [&](auto &rec)
            {
                rec.id = 0;
                rec.hash = moreitr->hash;
                rec.srvhash = moreitr->srvhash;
                rec.txnid = moreitr->txnid;
            });
            moreitr++;
            pandafun::upgrade upgrade_msg = {upgrades_msg.player, upgrades_msg.panda_id, upgrades_msg.randomvalue[i], upgrades_msg.srvrandom[i], upgrades_msg.txnid, upgrades_msg.skill };
            pandafun::apply_upgrade(upgrade_msg);
        }
        hashmore_type hashsmorerm(code_account, upgrades_msg.player);
        moreitr = hashsmorerm.begin();
        while (moreitr != hashsmorerm.end())
        {
            moreitr = hashsmorerm.erase(moreitr);
        }
    }

    void apply_transform( const pandafun::transform& transform_msg )
    {
        require_auth( auth_account );
        pausecheck();
        blackcheck(transform_msg.player);
        asset_type assets(code_account, transform_msg.player);
        auto asset_itr = assets.find(0);
        eosio_assert (asset_itr != assets.end(), "transform(): No asset found in table assets.\n");
        eosio_assert (asset_itr->peace_tea > 0, "transform(): No peace_tea left..\n");
        panda_table_type pandas(code_account, transform_msg.player);
        auto pandaitr = pandas.find(transform_msg.panda_id);
        eosio_assert(pandaitr != pandas.end(), "transform(): The panda does not exist.\n");
        auto current_level = BGETLEVEL(pandaitr->skills[transform_msg.skillpos]);
        eosio_assert(current_level > 0, "transform(): This panda doesn't have this skill.\n");
        hash_type hashs(code_account, transform_msg.player);
        auto hashitr = hashs.find(0);
        eosio_assert (hashitr != hashs.end(), "No hash found under player.\n");
        eosio_assert (hashitr->txnid == transform_msg.txnid, "transform(): txnid doesn't match.\n");
        auto submit_hash = hashitr->hash;
        auto server_hash = hashitr->srvhash;

        eosio_assert(hashcheck(submit_hash, transform_msg.randomvalue) == 0, "transform(): player's random number's sha256 sum doesn't match the submitted one.\n");
        eosio_assert(hashcheck(server_hash, transform_msg.srvrandom) == 0, "transform(): server's random number's sha256 sum doesn't match the submitted one.\n");

        const int32_t range = 600 * SKILLS;
        auto result = transform_msg.randomvalue ^ transform_msg.srvrandom;
        auto probability = result % range;

        if (!DEBUG)
        {
            hashs.erase(hashitr);
        }
        assets.modify(asset_itr, code_account, [&](auto &rec)
        {
            rec.peace_tea = asset_itr->peace_tea - 1;
            print("One used, left tea: ", rec.peace_tea, " ");
        });

        // update the statistics table for tea
        uint32_t index = now() / SECONDSADAY;
        config_type configs(code_account, code_account);
        auto cfgitr = configs.find(0);
        eosio_assert(cfgitr != configs.end(), "transform(): NO key 0 row found in table configs.\n");
        asset_count_type tea(code_account, N(transform));
        auto teaitr = tea.find(index);
        if (teaitr == tea.end())    // a new day
        {
            tea.emplace(code_account, [&](auto &rec)
            {
                rec.timestamp = index;
                rec.number = 1;
            });
            // add yesterday's value to the statistics, subtract the 8th day's value before if exists
            auto reverseitr = tea.rbegin();
            if (reverseitr != tea.rend())
                reverseitr++;
            if (reverseitr != tea.rend())
            {
                configs.modify(cfgitr, code_account, [&](auto &rec)
                {
                    rec.transform7days = cfgitr->transform7days + reverseitr->number;
                });
            }
            reverseitr = tea.rbegin();
            for (int i = 0; i < 7; i++)
            {
                if (reverseitr != tea.rend())
                    reverseitr++;
                else
                    break;
            }
            if (reverseitr != tea.rend())
            {
                configs.modify(cfgitr, code_account, [&](auto &rec)
                {
                    rec.transform7days = cfgitr->transform7days - reverseitr->number;
                });
            }
        }
        else
        {
            tea.modify(teaitr, code_account, [&](auto &rec)
            {
                rec.number = teaitr->number + 1;
            });
        }

        int32_t newskillpos = -1;
        int32_t success = 1;
        // 2 sections, enlarge by 6900: [0~4600]
        //   1 / 3 / 23
        // 1. transform probability, such as [0-1000)
        // 2. fail probability, the left
        auto ptransform = range * 1 / 3;
        auto step = 600 * 1 / 3;
        if (probability < ptransform)
        {
            newskillpos = probability / step;   // 200 = 600 * 1 / 3
            if ((newskillpos == transform_msg.skillpos) || (pandaitr->skills[newskillpos] != 0))
                success = 0;
        }
        else
        {
            success = 0;
        }


        char newskill = 0;
        transform_type transformrec(code_account, transform_msg.player);
        auto transformitr = transformrec.find(0);
        if (success == 0)
        {
            if (transformitr == transformrec.end())
            {
                transformrec.emplace(code_account, [&](auto &rec)
                {
                    memset(&rec, 0, sizeof(rec));    // containing id=0
                    rec.txnid = transform_msg.txnid;
                });
            }
            else
            {
                transformrec.modify(transformitr, code_account, [&](auto &rec)
                {
                    // one of the ten transform
                    if (transformitr->txnid == transform_msg.txnid)
                    {
                        rec.success |= 0;
                    }
                    else
                    {
                        memset(&rec, 0, sizeof(rec));
                        rec.txnid = transform_msg.txnid;
                    }
                });
            }
            return;
        }
        else
        {
            auto oldtimes = BGETTIMES(pandaitr->skills[transform_msg.skillpos]);
            BSETLEVEL(newskill, 1);
            BSETTIMES(newskill, oldtimes);
            if (transformitr == transformrec.end())
            {
                transformrec.emplace(code_account, [&](auto &rec)
                {
                    memset(&rec, 0, sizeof(rec));
                    rec.newskills[newskillpos] = newskill;
                    rec.txnid = transform_msg.txnid;
                    rec.success = 1;
                });
            }
            else
            {
                transformrec.modify(transformitr, code_account, [&](auto &rec)
                {
                    // new transform
                    if (transformitr->txnid != transform_msg.txnid)
                    {
                        memset(rec.newskills, 0, SKILLLEN);
                        rec.txnid = transform_msg.txnid;
                    }
                    rec.success = 1;
                    rec.newskills[newskillpos] = newskill;
                });
            }
        }
    }

    void apply_transforms( const pandafun::transforms& transforms_msg )
    {
        require_auth( auth_account );
        pausecheck();
        blackcheck(transforms_msg.player);

        asset_type assets(code_account, transforms_msg.player);
        auto asset_itr = assets.find(0);
        eosio_assert (asset_itr != assets.end(), "transforms(): No asset found in table assets.\n");
        eosio_assert (asset_itr->peace_tea >= 10, "transforms(): the peace_tea left are less than 10..\n");

        panda_table_type pandas(code_account, transforms_msg.player);
        auto pandaitr = pandas.find(transforms_msg.panda_id);
        eosio_assert(pandaitr != pandas.end(), "transforms(): The panda does not exist.\n");
        auto current_level = BGETLEVEL(pandaitr->skills[transforms_msg.skillpos]);
        eosio_assert(current_level > 0, "transforms(): This panda doesn't have this skill.\n");

        // clear the transform result table if it's not empty
        transform_type transformrec(code_account, transforms_msg.player);
        auto transformitr = transformrec.find(0);
        if (transformitr != transformrec.end())
        {
            transformitr = transformrec.erase(transformitr);
        }

        hashmore_type hashsmore(code_account, transforms_msg.player);
        auto moreitr = hashsmore.begin();
        eosio_assert(moreitr != hashsmore.end(), "The hashsmore table is empty.\n ");
        eosio_assert (moreitr->txnid == transforms_msg.txnid, "transforms(): txnid doesn't match.\n");

        for (uint8_t i = 0; i < HASHNUM; i++)
        {
            eosio_assert(moreitr != hashsmore.end(), "moreitr reaches the end of the table hashsmore.\n");
            hash_type hashs(code_account, transforms_msg.player);
            auto hashitr = hashs.find(0);
            if (hashitr != hashs.end())
                hashs.erase(hashitr);
            hashs.emplace(code_account, [&](auto &rec)
            {
                rec.id = 0;
                rec.hash = moreitr->hash;
                rec.srvhash = moreitr->srvhash;
                rec.txnid = moreitr->txnid;
            });
            moreitr++;
            pandafun::transform transform_msg = {transforms_msg.player, transforms_msg.panda_id, transforms_msg.randomvalue[i], transforms_msg.srvrandom[i], transforms_msg.txnid, transforms_msg.skillpos };
            pandafun::apply_transform(transform_msg);
        }
        hashmore_type hashsmorerm(code_account, transforms_msg.player);
        moreitr = hashsmorerm.begin();
        while (moreitr != hashsmorerm.end())
        {
            moreitr = hashsmorerm.erase(moreitr);
        }
    }

    void apply_confirmtrans( const pandafun::confirmtrans& confirmtrans_msg )
    {
        require_auth( confirmtrans_msg.player );
        pausecheck();
        blackcheck(confirmtrans_msg.player);
        transform_type transformrec(code_account, confirmtrans_msg.player);
        // cancel, clean the transform record
        if (confirmtrans_msg.confirm == 0)
        {
            auto confirmitr = transformrec.begin();
            while (confirmitr != transformrec.end())
            {
                confirmitr = transformrec.erase(confirmitr);
            }
            return;
        }
        panda_table_type pandas(code_account, confirmtrans_msg.player);
        auto pandaitr = pandas.find(confirmtrans_msg.panda_id);
        eosio_assert(pandaitr != pandas.end(), "transform(): The panda does not exist.\n");
        char current_level = BGETLEVEL(pandaitr->skills[confirmtrans_msg.oldskillpos]);
        char current_times = BGETTIMES(pandaitr->skills[confirmtrans_msg.oldskillpos]);
        eosio_assert(current_level > 0, "transform(): This panda doesn't have this skill.\n");

        auto transformitr = transformrec.find(0);
        eosio_assert(transformitr != transformrec.end(), "transform(): no transform record found.\n");
        //char new_level = BGETLEVEL(transformitr->newskills[confirmtrans_msg.newskillpos]);
        char new_times = BGETTIMES(transformitr->newskills[confirmtrans_msg.newskillpos]);
        eosio_assert(current_times == new_times, "transform(): times don't match.\n");
        eosio_assert(confirmtrans_msg.newskillpos != confirmtrans_msg.oldskillpos, "transform(): skill is the same.\n");

        char skill = 0;
        BSETLEVEL(skill, 1);
        BSETTIMES(skill, current_times);
        pandas.modify(pandaitr, code_account, [&](auto &rec)
        {
            rec.skills[confirmtrans_msg.oldskillpos] = 0;
            rec.skills[confirmtrans_msg.newskillpos] = skill;
        });
        auto confirmitr = transformrec.begin();
        while (confirmitr != transformrec.end())
        {
            confirmitr = transformrec.erase(confirmitr);
        }
    }

    void apply_saveresult( const pandafun::saveresult& saveresult_msg )
    {
        require_auth( auth_account );
        pausecheck();
        eosio_assert( saveresult_msg.in.symbol == S(4,EOS) , "Only EOS token allowed.\n" );
        eosio_assert( saveresult_msg.in.is_valid(), "Invalid saveresult_msg.in\n" );
        eosio_assert( saveresult_msg.in.amount > 0, "The saveresult_msg.in must be positive.\n" );
        result_type results(code_account, code_account);

        results.emplace(code_account, [&](auto &rec)
        {
            rec.id = results.available_primary_key();
            rec.player1 = saveresult_msg.player1;
            rec.panda1 = saveresult_msg.panda1;
            rec.player2 = saveresult_msg.player2;
            rec.panda2 = saveresult_msg.panda2;
            rec.player3 = saveresult_msg.player3;
            rec.panda3 = saveresult_msg.panda3;
            rec.winner = saveresult_msg.winner;
            rec.gameid = saveresult_msg.gameid;
            rec.in = saveresult_msg.in;
            rec.starttime = saveresult_msg.starttime;
            rec.endtime = saveresult_msg.endtime;
        });
        // pay
        auto amount = saveresult_msg.in * 3 * 965 / 1000;
        auto fee = saveresult_msg.in * 3 - amount;
        action(
           permission_level{ saveresult_msg.payer, N(active) },
           N(eosio.token), N(transfer),
           std::make_tuple(saveresult_msg.payer, saveresult_msg.winner, amount, std::string("pandafun.io: prize from pandafun."))
        ).send();
        action(
           permission_level{ saveresult_msg.payer, N(active) },
           N(eosio.token), N(transfer),
           std::make_tuple(saveresult_msg.payer, N(pandafunhot1), fee, std::string("pandafun.io: fee from pandafun."))
        ).send();
        // clean the old games
        uint32_t point = now() - SHOWDAYS * SECONDSADAY;
        auto resultitr = results.begin();
        while (resultitr != results.end())
        {
            if (resultitr->endtime < point)
                resultitr = results.erase(resultitr);
            else
                break;
        }
    }

    void apply_refund( const pandafun::refund& refund_msg )
    {
        require_auth( auth_account );
        pausecheck();
        eosio_assert( refund_msg.quantity.symbol == S(4,EOS) , "Only EOS token allowed.\n" );
        eosio_assert( refund_msg.quantity.is_valid(), "Invalid refund_msg.quantity\n" );
        eosio_assert( refund_msg.quantity.amount > 0, "The refund_msg.quantity must be positive.\n" );
        action(
           permission_level{ refund_msg.from, N(active) },
           N(eosio.token), N(transfer),
           std::make_tuple(refund_msg.from, refund_msg.to, refund_msg.quantity, std::string("pandafun.io: refund from pandafun."))
        ).send();
    }


    void apply_buycandles( const pandafun::buycandles& buycandles_msg )
    {
        require_auth( auth_account );
        pausecheck();
        blackcheck(buycandles_msg.buyer);
        eosio_assert(buycandles_msg.count > 0, "buycandles(), count must be larger than 0.\n");
        asset_type assets(code_account, buycandles_msg.buyer);
        auto asset_itr = assets.find(0);
        if (asset_itr != assets.end())
        {
            assets.modify(asset_itr, code_account, [&](auto &rec)
            {
                print("Candles: ", asset_itr->candles, " buy: ", buycandles_msg.count);
                rec.candles = asset_itr->candles + buycandles_msg.count;
                rec.txnid = buycandles_msg.txnid;
                print(" total: ", rec.candles);
            });
        }
        else
        {
            assets.emplace(code_account, [&](auto &rec)
            {
                rec.id = 0;
                rec.txnid = buycandles_msg.txnid;
                rec.candles = buycandles_msg.count;
                rec.peace_tea = 0;
                rec.books = 0;
                print("Candles: buy: ", buycandles_msg.count, " total: ", rec.candles);
            });
        }
    }

    void apply_buybooks( const pandafun::buybooks& buybooks_msg )
    {
        require_auth( auth_account );
        pausecheck();
        blackcheck(buybooks_msg.buyer);
        eosio_assert(buybooks_msg.count > 0, "buybooks(), count must be larger than 0.\n");
        asset_type assets(code_account, buybooks_msg.buyer);
        auto asset_itr = assets.find(0);
        if (asset_itr != assets.end())
        {
            assets.modify(asset_itr, code_account, [&](auto &rec)
            {
                print("Books: ", asset_itr->books, " buy: ", buybooks_msg.count);
                rec.books = asset_itr->books + buybooks_msg.count;
                rec.txnid = buybooks_msg.txnid;
                print(" total: ", rec.books);
            });
        }
        else
        {
            assets.emplace(code_account, [&](auto &rec)
            {
                rec.id = 0;
                rec.txnid = buybooks_msg.txnid;
                rec.candles = 0;
                rec.peace_tea = 0;
                rec.books = buybooks_msg.count;
                print("Books: buy: ", buybooks_msg.count, " total: ", rec.books);
            });
        }
    }

    void apply_buytea( const pandafun::buytea& buytea_msg )
    {
        require_auth( auth_account );
        pausecheck();
        blackcheck(buytea_msg.buyer);
        eosio_assert(buytea_msg.count > 0, "buytea(), count must be larger than 0.\n");
        asset_type assets(code_account, buytea_msg.buyer);
        auto asset_itr = assets.find(0);
        if (asset_itr != assets.end())
        {
            assets.modify(asset_itr, code_account, [&](auto &rec)
            {
                print("Tea: ", asset_itr->peace_tea, " buy: ", buytea_msg.count);
                rec.txnid = buytea_msg.txnid;
                rec.peace_tea = asset_itr->peace_tea + buytea_msg.count;
                print(" total: ", rec.peace_tea);
            });
        }
        else
        {
            assets.emplace(code_account, [&](auto &rec)
            {
                rec.id = 0;
                rec.txnid = buytea_msg.txnid;
                rec.candles = 0;
                rec.peace_tea = buytea_msg.count;
                rec.books = 0;
                print("Tea: buy: ", buytea_msg.count, " total: ", rec.peace_tea);
            });
        }
    }

    void apply_signup( const pandafun::signup& signup_msg )
    {
        require_auth( auth_account );
        apply_init();
        pausecheck();
        signup_type signup_table(code_account, code_account);
        auto signupitr = signup_table.find(signup_msg.user);
        eosio_assert(signupitr == signup_table.end(), "The user has registered.\n");
        signup_table.emplace(code_account, [&](auto &rec)
        {
            rec.user = signup_msg.user;
            rec.status = NORMAL;
        });
        config_type configs(code_account, code_account);
        auto cfgitr = configs.find(0);
        if (cfgitr != configs.end())
        {
            configs.modify(cfgitr, code_account, [&](auto &rec)
            {
                rec.players = cfgitr->players + 1;
            });
        }
    }

    void apply_pause()
    {
        require_auth( admin_account );
        config_type configs(code_account, code_account);
        auto cfgitr = configs.find(0);
        if (cfgitr != configs.end())
        {
            if (cfgitr->paused != PAUSED)
            {
                configs.modify(cfgitr, code_account, [&](auto &rec)
                {
                    rec.paused = PAUSED;
                });
            }
            else
            {
                print("The contract has been paused.\n");
            }
        }
        else
        {
            print("NO index 0 found in table configs.\n");
        }
    }

    void apply_resume()
    {
        require_auth( admin_account );
        config_type configs(code_account, code_account);
        auto cfgitr = configs.find(0);
        if (cfgitr != configs.end())
        {
            if (cfgitr->paused != RUNNING)
            {
                configs.modify(cfgitr, code_account, [&](auto &rec)
                {
                    rec.paused = RUNNING;
                });
            }
            else
            {
                print("The contract has been resumed.\n");
            }
        }
        else
        {
            print("NO index 0 found in table configs.\n");
        }
    }

    void pausecheck()
    {
        config_type configs(code_account, code_account);
        auto cfgitr = configs.find(0);
        eosio_assert(cfgitr != configs.end(), "NO key 0 row found in table configs.\n");
        eosio_assert(cfgitr->paused != PAUSED, "The contract has been paused, please wait a moment.\n");
    }

    void apply_setblack( const pandafun::setblack& setblack_msg )
    {
        require_auth( auth_account );
        pausecheck();
        signup_type signup_table(code_account, code_account);
        auto signupitr = signup_table.find(setblack_msg.user);
        if (signupitr != signup_table.end())
        {
            signup_table.modify(signupitr, code_account, [&](auto &rec)
            {
                rec.status = BLOCKD;
            });
        }
        else
        {
            print("Didn't find the user: ", name{setblack_msg.user}, ".\n");
        }
    }

    void apply_removeblack( const pandafun::removeblack& removeblack_msg )
    {
        require_auth( auth_account );
        pausecheck();
        signup_type signup_table(code_account, code_account);
        auto signupitr = signup_table.find(removeblack_msg.user);
        if (signupitr != signup_table.end())
        {
            signup_table.modify(signupitr, code_account, [&](auto &rec)
            {
                rec.status = NORMAL;
            });
        }
        else
        {
            print("Didn't find the user: ", name{removeblack_msg.user}, ".\n");
        }
    }

    void blackcheck(account_name user)
    {
        signup_type signup_table(code_account, code_account);
        auto signupitr = signup_table.find(user);
        eosio_assert(signupitr != signup_table.end(), "Didn't find the user in signup table.\n");
        eosio_assert(signupitr->status != BLOCKD, "The user has been blocked.\n");
    }

}  // namespace pandafun

using namespace pandafun;

/**
 *  The init() and apply() methods must have C calling convention so that the blockchain can lookup and
 *  call these methods.
 */
extern "C"
{
    /**
     *  Does not work.
     */
    void init()  {
    }

    // The apply method implements the dispatch of events to this contract
    void apply( uint64_t receiver, uint64_t code, uint64_t action )
    {
        if( code == code_account ) {
            // if( action == N(transfer) )
            //     pandafun::apply_transfer( unpack_action_data<transfer>() );
            if( action == N(transfers) )
                pandafun::apply_transfers( unpack_action_data<transfers>() );
            else if( action == N(sell) )
                pandafun::apply_sell( unpack_action_data<sell>() );
            else if( action == N(cancelsell) )
                pandafun::apply_cancelsell( unpack_action_data<cancelsell>() );
            else if( action == N(buy) )
                pandafun::apply_buy( unpack_action_data<buy>() );
            else if( action == N(recvhash) )
                pandafun::apply_recvhash( unpack_action_data<recvhash>() );
            else if( action == N(recvhashs) )
                pandafun::apply_recvhashs( unpack_action_data<recvhashs>() );
            else if( action == N(pray) )
                pandafun::apply_pray( unpack_action_data<pray>() );
            else if( action == N(prays) )
                pandafun::apply_prays( unpack_action_data<prays>() );
            else if( action == N(dice) )
                pandafun::apply_dice( unpack_action_data<dice>() );
            else if( action == N(upgrade) )
                pandafun::apply_upgrade( unpack_action_data<upgrade>() );
            else if( action == N(upgrades) )
                pandafun::apply_upgrades( unpack_action_data<upgrades>() );
            else if( action == N(transform) )
                pandafun::apply_transform( unpack_action_data<transform>() );
            else if( action == N(transforms) )
                pandafun::apply_transforms( unpack_action_data<transforms>() );
            else if( action == N(confirmtrans) )
                pandafun::apply_confirmtrans( unpack_action_data<confirmtrans>() );
            else if( action == N(saveresult) )
                pandafun::apply_saveresult( unpack_action_data<saveresult>() );
            else if( action == N(refund) )
                pandafun::apply_refund( unpack_action_data<refund>() );
            else if( action == N(buycandles) )
                pandafun::apply_buycandles( unpack_action_data<buycandles>() );
            else if( action == N(buybooks) )
                pandafun::apply_buybooks( unpack_action_data<buybooks>() );
            else if( action == N(buytea) )
                pandafun::apply_buytea( unpack_action_data<buytea>() );
            else if( action == N(signup) )
                pandafun::apply_signup( unpack_action_data<signup>() );
            else if( action == N(pause) )
                pandafun::apply_pause();
            else if( action == N(resume) )
                pandafun::apply_resume();
            else if( action == N(setblack) )
                pandafun::apply_setblack( unpack_action_data<setblack>() );
            else if( action == N(removeblack) )
                pandafun::apply_removeblack( unpack_action_data<removeblack>() );
            else
                eosio::print("No match action found, please check it.\n");
        }

    }

} // extern "C"
