using namespace types;

// command to delete stuff
// void pet::delbattles(string /* reason */) {
//   require_auth(_self);

//   // multi_index can't erase when the format changed
//   auto it = db_lowerbound_i64(_self, _self, N(battles), 0);
//   while (it >= 0) {
//     auto     del = it;
//     uint64_t dummy;
//     it = db_next_i64(it, &dummy);
//     db_remove_i64(del);
//   }
// }

void pet::changemktfee(uint64_t new_fee, string /* reason */) {
  require_auth(_self);
  auto pc       = _get_pet_config();
  pc.market_fee = new_fee;
  _update_pet_config(pc);
}

void pet::changecreawk(int64_t new_creation_awake, string /* reason */) {
  require_auth(_self);
  auto pc           = _get_pet_config();
  pc.creation_awake = new_creation_awake;
  _update_pet_config(pc);
}

void pet::changehungtz(uint32_t new_hunger_to_zero, string /* reason */) {
  require_auth(_self);
  auto pc           = _get_pet_config();
  pc.hunger_to_zero = new_hunger_to_zero;
  _update_pet_config(pc);
}

void pet::changecrtol(uint32_t new_interval) {
  require_auth(_self);
  auto pc               = _get_pet_config();
  pc.creation_tolerance = new_interval;
  _update_pet_config(pc);
}

void pet::changebatma(uint16_t new_max_arenas) {
  require_auth(_self);
  auto pc              = _get_pet_config();
  pc.battle_max_arenas = new_max_arenas;
  _update_pet_config(pc);
}

void pet::changebatidt(uint32_t new_idle_tolerance) {
  require_auth(_self);
  auto pc                  = _get_pet_config();
  pc.battle_idle_tolerance = new_idle_tolerance;
  _update_pet_config(pc);
}

void pet::changebatami(uint8_t new_attack_min_factor) {
  require_auth(_self);
  auto pc              = _get_pet_config();
  pc.attack_min_factor = new_attack_min_factor;
  _update_pet_config(pc);
}

void pet::changebatama(uint8_t new_attack_max_factor) {
  require_auth(_self);
  auto pc              = _get_pet_config();
  pc.attack_max_factor = new_attack_max_factor;
  _update_pet_config(pc);
}

void pet::addelemttype(vector<uint8_t> ratios) {
  require_auth(_self);

  eosio_assert(ratios.size() > 0, "each type must have at least 1 ratio");

  elements.emplace(_self, [&](auto& r) {
    r.id     = _next_element_id();
    r.ratios = ratios;
  });
}

void pet::changeelemtt(uint64_t id, vector<uint8_t> ratios) {
  require_auth(_self);

  eosio_assert(ratios.size() > 0, "each type must have at least 1 ratio!");

  auto itr_elmt = elements.find(id);
  eosio_assert(itr_elmt != elements.end(), "E404|Invalid element");
  st_elements elmt = *itr_elmt;

  elements.modify(itr_elmt, _self, [&](auto& r) { r.ratios = ratios; });
}

void pet::addpettype(vector<uint8_t> elements) {
  require_auth(_self);

  eosio_assert(elements.size() > 0, "each type must have at least 1 element");

  pettypes.emplace(_self, [&](auto& r) {
    r.id       = _next_pet_type_id();
    r.elements = elements;
  });
}

void pet::changepettyp(uint64_t id, vector<uint8_t> elements) {
  require_auth(_self);

  eosio_assert(elements.size() > 0, "each type must have at least 1 element");

  auto itr_pt = pettypes.find(id);
  eosio_assert(itr_pt != pettypes.end(), "E404|Invalid pet type");
  st_pet_types pt = *itr_pt;

  pettypes.modify(itr_pt, _self, [&](auto& r) { r.elements = elements; });
}

void pet::techrevive(uuid pet_id, string memo) {
  require_auth(_self);
  print(pet_id, "| reviving pet for technical reasons... ");
  eosio_assert(memo.size() <= 256, "memo has more than 256 bytes");

  auto itr_pet = pets.find(pet_id);
  eosio_assert(itr_pet != pets.end(), "E404|Invalid pet");
  st_pets pet = *itr_pet;

  pets.modify(itr_pet, 0, [&](auto& r) {
    r.death_at      = 0;
    r.last_fed_at   = now();
    r.last_bed_at   = r.last_fed_at;
    r.last_awake_at = r.last_fed_at + 1;
  });
}

uuid pet::_next_id() {
  auto pc = _get_pet_config();
  pc.last_id++;
  eosio_assert(pc.last_id > 0, "_next_id overflow detected");
  _update_pet_config(pc);
  return pc.last_id;
}

uint64_t pet::_next_element_id() {
  auto pc = _get_pet_config();
  pc.last_element_id++;
  eosio_assert(pc.last_element_id > 0, "_next_element_id overflow detected");
  _update_pet_config(pc);
  return pc.last_element_id - 1; // zero based id
}

uint64_t pet::_next_pet_type_id() {
  auto pc = _get_pet_config();
  pc.last_pet_type_id++;
  eosio_assert(pc.last_pet_type_id > 0, "_next_pet_type_id overflow detected");
  _update_pet_config(pc);
  return pc.last_pet_type_id - 1; // zero based id
}

pet::st_pet_config2 pet::_get_pet_config() {
  st_pet_config2 pc;

  if (pet_config2.exists()) {
    pc = pet_config2.get();
  } else {
    pc = st_pet_config2{};

    // // migration from old singleton
    // if (pet_config.exists()) {
    //   auto old_pc            = pet_config.get();
    //   pc.last_id             = old_pc.last_id;
    //   pc.creation_fee        = old_pc.creation_fee;
    //   pc.max_health          = old_pc.max_health;
    //   pc.hunger_to_zero      = old_pc.hunger_to_zero;
    //   pc.min_hunger_interval = old_pc.min_hunger_interval;
    //   pc.max_hunger_points   = old_pc.max_hunger_points;
    //   pc.hunger_hp_modifier  = old_pc.hunger_hp_modifier;
    //   pc.min_awake_interval  = old_pc.min_awake_interval;
    //   pc.min_sleep_period    = old_pc.min_sleep_period;
    //   pc.creation_tolerance  = old_pc.creation_tolerance;

    //   pet_config.remove();
    // }

    pet_config2.set(pc, _self);
  }

  return pc;
}

void pet::_update_pet_config(const st_pet_config2& pc) { pet_config2.set(pc, _self); }
