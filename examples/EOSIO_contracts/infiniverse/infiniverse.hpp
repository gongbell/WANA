#include <eosiolib/eosio.hpp>
#include <eosiolib/asset.hpp>
#include <eosiolib/time.hpp>

using namespace eosio;

CONTRACT infiniverse : public contract
{
    public:

    using contract::contract;

    struct vector3 {
        float x;
        float y;
        float z;
    };

    ACTION registerland(name owner, double lat_north_edge,
        double long_east_edge, double lat_south_edge, double long_west_edge);

    ACTION moveland(uint64_t land_id, double lat_north_edge,
        double long_east_edge, double lat_south_edge, double long_west_edge);

    ACTION setlandprice(uint64_t land_id, asset price);

    ACTION cancelsale(uint64_t land_id);

    ACTION buyland(name buyer, uint64_t land_id, asset price);

    ACTION persistpoly(uint64_t land_id, std::string poly_id,
        vector3 position, vector3 orientation, vector3 scale);

    ACTION updatepersis(uint64_t persistent_id, uint64_t land_id,
        vector3 position, vector3 orientation, vector3 scale);

    ACTION deletepersis(uint64_t persistent_id);

    ACTION opendeposit(name owner);

    ACTION closedeposit(name owner);

    ACTION depositinf(name from, name to, asset quantity, std::string memo);

    private:

    enum class PlacementSource : uint64_t
    {
        INVALID_MIN,
        POLY,
        INVALID_MAX
    };

    TABLE land
    {
        uint64_t id;
        name owner;
        double lat_north_edge;
        double long_east_edge;
        double lat_south_edge;
        double long_west_edge;
        time_point_sec reg_end_date;

        uint64_t primary_key() const { return id; }
        uint64_t get_owner() const { return owner.value; }
        double get_lat_north_edge() const { return lat_north_edge; }
        double get_long_east_edge() const { return long_east_edge; }
    };

    typedef multi_index<"land"_n, land,
        indexed_by<"byowner"_n, const_mem_fun<land, uint64_t, &land::get_owner>>,
        indexed_by<"bylatnorth"_n, const_mem_fun<land, double, &land::get_lat_north_edge>>,
        indexed_by<"bylongeast"_n, const_mem_fun<land, double, &land::get_long_east_edge>>>
        land_table;

    TABLE landprice
    {
        uint64_t land_id;
        asset price;

        uint64_t primary_key() const { return land_id; }
    };

    typedef multi_index<"landprice"_n, landprice>
        land_price_table;
    
    TABLE persistent {
        uint64_t id;
        uint64_t land_id;
        uint64_t source;
        uint64_t asset_id;
        vector3 position;
        vector3 orientation;
        vector3 scale;

        uint64_t primary_key() const { return id; }
        uint64_t get_land_id() const { return land_id; }
        // Pack the source and asset id into one int to store the composite index
        uint128_t get_source_and_asset_id() const { return (uint128_t) source << 64 | asset_id; }
    };

    typedef multi_index<"persistent"_n, persistent,
        indexed_by<"bylandid"_n, const_mem_fun<persistent, uint64_t, &persistent::get_land_id>>,
        indexed_by<"byassetid"_n, const_mem_fun<persistent, uint128_t, &persistent::get_source_and_asset_id>>>
        persistent_table;

    TABLE poly {
        uint64_t id;
        name user;
        std::string poly_id;

        uint64_t primary_key() const { return id; }
        uint64_t get_user() const { return user.value; }
    };

    typedef multi_index<"poly"_n, poly,
        indexed_by<"byuser"_n, const_mem_fun<poly, uint64_t, &poly::get_user>>>
        poly_table;

    TABLE deposit {
        name owner;
        asset balance;

        uint64_t primary_key() const { return owner.value; }
    };

    typedef multi_index<"deposit"_n, deposit> deposit_table;
    

    std::pair<double, double> assert_lat_long_values(const double& lat_north_edge,
        const double& long_east_edge, const double& lat_south_edge, const double& long_west_edge);

    void check_land_intersections(const land_table& lands, const double& lat_north_edge,
        const double& long_east_edge, const double& lat_south_edge, const double& long_west_edge, const uint64_t& exclude_land_id);

    asset calculate_land_reg_fee(const std::pair<double, double>& land_size, const uint32_t& inf_per_sqm, const double& years);

    asset calculate_land_reg_fee(const double& land_area, const uint32_t& inf_per_sqm, const double& years);
    
    void deduct_inf_deposit(const name& owner, const asset& inf_amount);
    
    uint64_t add_poly(const name& user, const std::string& poly_id);

    uint64_t get_land_id_from_persistent(const persistent_table& persistents, const uint64_t& persistent_id);

    name require_land_owner_auth(const uint64_t& land_id);

    void assert_vectors_within_bounds(const vector3& position, const vector3& orientation, const vector3& scale);

    void delete_persistents_from_land(const uint64_t& land_id);

    void delete_poly(const persistent_table& persistents, const uint64_t& source, const uint64_t& asset_id, const uint128_t& source_and_asset_id);

    void transfer_inf(name from, name to, asset quantity, std::string memo);
};
