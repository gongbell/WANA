#include <eosiolib/eosio.hpp>
#include <eosiolib/print.hpp>
#include <eosiolib/crypto.h>

using namespace eosio;

template<typename CharT>
static std::string to_hex(const CharT* d, uint32_t s) {
  std::string r;
  const char* to_hex="0123456789abcdef";
  uint8_t* c = (uint8_t*)d;
  for( uint32_t i = 0; i < s; ++i ) {
    (r += to_hex[(c[i] >> 4)]) += to_hex[(c[i] & 0x0f)];
  }
  return r;
}

std::string hex_to_string(const std::string& input) {
  static const char* const lut = "0123456789abcdef";
  size_t len = input.length();
  if (len & 1) abort();
  std::string output;
  output.reserve(len / 2);
  for (size_t i = 0; i < len; i += 2) {
    char a = input[i];
    const char* p = std::lower_bound(lut, lut + 16, a);
    if (*p != a) abort();
    char b = input[i + 1];
    const char* q = std::lower_bound(lut, lut + 16, b);
    if (*q != b) abort();
    output.push_back(((p - lut) << 4) | (q - lut));
  }
  return output;
}

class merkle: public eosio::contract {
  public:
      using contract::contract;

      ///@abi action
[[eosio::action]]
      void verify(const vector<std::string>& proof, const vector<std::uint8_t>& positions, std::string root, std::string leaf) {
        std::string computed_hash = leaf;
        uint8_t hashlen = 32;

        auto size = proof.size();
        for (int i = 0; i < size; i++) {
          std::string proof_element = proof[i];
          std::string tmp;
          checksum256 digest;
          char data[64];

          char computed_hash_char[hashlen];
          tmp = hex_to_string(computed_hash.c_str());
          memcpy(computed_hash_char, tmp.c_str(), hashlen);

          char proof_element_char[hashlen];
          tmp = hex_to_string(proof_element.c_str());
          memcpy(proof_element_char, tmp.c_str(), hashlen);

          if (positions[i] == 1) {
            memcpy(data, computed_hash_char, hashlen);
            memcpy(data+hashlen, proof_element_char, hashlen);
          } else {
            memcpy(data, proof_element_char, hashlen);
            memcpy(data+hashlen, computed_hash_char, hashlen);
          }

          sha256(data, sizeof(data), &digest);
          computed_hash = to_hex(digest.hash, sizeof(digest.hash));
        }

        bool valid = (computed_hash == root);
        print("VALID: ", valid);
  }
};

EOSIO_ABI( merkle, (verify) )
