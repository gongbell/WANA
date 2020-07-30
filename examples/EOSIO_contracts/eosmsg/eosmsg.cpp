/**
 *  @file
 *
 * 1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
 * 1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
 * 1188888881111888888811118888888111188888811111881111111111888881111118888811111888888811
 * 1188111111111881118811118811111111188111881111881111111118811188131188111881111881111111
 * 1188111111111881118811118111111111188111881111881111111118811188111188111111111881111111
 * 1188888811111881118811118888888111188888811111881111111118888888111188111111111888888111
 * 1188111111111881118811111111188111188111111111881111111118811188111188111111111881111111
 * 1188111111111881118811111111188111188111111111881111111118811188111188111881111881111111
 * 1188888881111888888811118888888111188111111111888888811118811188111118888811111888888811
 * 1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
 * 1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
 */

#include <utility>
#include <vector>
#include <string>
#include <eosiolib/eosio.hpp>
#include <eosiolib/asset.hpp>
#include <eosiolib/contract.hpp>
#include <eosiolib/time.hpp>
#include <eosiolib/print.hpp>
#include <eosiolib/transaction.hpp>

using namespace eosio;

class messenger : public eosio::contract
{
public:
  using contract::contract;

  messenger(account_name self) : contract(self) {}

  //@abi action
[[eosio::action]]
  void sendmsg(const account_name from,
               const account_name to,
               const std::string msg)
  {
    require_auth(from);

    eosio_assert(msg.size() > 0, "Empty message");

    // verificar se account "to" existe

    notification_table notifications(_self, _self);
    message_table messages(_self, from);    
    
    uint64_t newid = notifications.available_primary_key();

    notifications.emplace(from, [&](auto &n) {
      n.id = newid;
      n.from = from;
      n.to = to;
    });

    messages.emplace(from, [&](auto &m) {
      m.id = newid;
      m.to = to;
      m.text = msg;
      m.send_at = eosio::time_point_sec(now());
    });
  }

  //@abi action
[[eosio::action]]
  void receivemsg(const account_name to, uint64_t id)
  {
    require_auth(to);

    notification_table notifications(_self, _self);
    auto itr_notif = notifications.find(id);
    eosio_assert(itr_notif != notifications.end(), "Notification not found");
    const auto &notif = *itr_notif;
    
    eosio_assert(notif.to == to, "Message not to your account");
    
    message_table messages(_self, notif.from);    
    auto itr_msg = messages.find(id);
    eosio_assert(itr_msg != messages.end(), "Message not found");
    
    notifications.erase(itr_notif);
    messages.erase(itr_msg);
  }

  //@abi action
[[eosio::action]]
  void erasemsg(const account_name from, uint64_t id)
  {
    require_auth(from);

    notification_table notifications(_self, _self);
    auto itr_notif = notifications.find(id);
    eosio_assert(itr_notif != notifications.end(), "Notification not found");
    const auto &notif = *itr_notif;

    eosio_assert(notif.from == from, "Message not from your account");
    
    message_table messages(_self, from);
    auto itr_msg = messages.find(id);
    eosio_assert(itr_msg != messages.end(), "Message not found");
    
    notifications.erase(itr_notif);
    messages.erase(itr_msg);
  }

private:

  //@abi table message i64
  struct message
  {
    uint64_t id;
    account_name to;
    std::string text;
    eosio::time_point_sec send_at;
    uint8_t type;

    uint64_t primary_key() const { return id; }

    EOSLIB_SERIALIZE(message, (id)(to)(text)(send_at)(type))
  };
  typedef eosio::multi_index<N(message), message> message_table;

  //@abi table notification i64
  struct notification
  {
    uint64_t id;
    account_name from;
    account_name to;

    uint64_t primary_key() const { return id; }
    account_name get_to_key() const { return to; }
    
    EOSLIB_SERIALIZE(notification, (id)(from)(to))
  };

  typedef eosio::multi_index<N(notification), notification,
                             eosio::indexed_by<N(to),
                                               eosio::const_mem_fun<
                                                   notification,
                                                   account_name,
                                                   &notification::get_to_key>>>
      notification_table;

};

EOSIO_ABI(messenger, (sendmsg)(receivemsg)(erasemsg))

