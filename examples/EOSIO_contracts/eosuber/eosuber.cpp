/*
      By James William Fletcher (~2018)

      This is a framework for making decentralised Uber/Taxi services on the EOSIO platform.
      Using the EOSIO CDT for developing Smart Contracts.

      //You can find drivers and reviews of drivers for free, anonymously.
      findtaxi(user_lat, user_lon)
      findreview(driver)
      
      //You can apply to be a driver or update your record (at your own ram cost)
      createdriver(driver, driver_name, driver_phone, driver_base_lat, driver_base_lon, driver_travel_radius_km)
      updatedriver(driver, driver_name, driver_phone, driver_base_lat, driver_base_lon, driver_travel_radius_km)
      
      //You can create a review or update your review (at your own ram cost)
      createreview(owner, driver, review_title, review_body, score)
      updatereview(owner, driver, review_title, review_body, score)
*/
#include <eosiolib/eosio.hpp>
#include <math.h>

class eostaxi : public eosio::contract
{

public:

      //Constructor
      eostaxi(account_name s): contract(s), _drivers(s, 0), _reviews(s, 0) {}

      //Find nearest taxi drivers to lat/lon
      __attribute__((eosio_action))
      void findtaxis(const double lat, const double lon)
      {
            //Iterate all the driver records checking the distance of each driver and return the name/phone of the ones near by
            for(auto i = _drivers.begin(); i != _drivers.end(); ++i)
            {
                  if(getDistanceKM(lat, lon, i->lat, i->lon) <= i->radius)
                        eosio::print("{", i->owner, " : ", i->name, " : ", i->phone, "}, ");
            }
      }

       //Find review
      __attribute__((eosio_action))
      void findreview(account_name driver)
      {
            auto r = _reviews.find(driver);
            eosio::print(driver, " : ", r->review_title, " : ", r->review_body, " : ", r->review_score);
      }

      //driver create
      __attribute__((eosio_action))
      void createdriver(const account_name owner, const std::string name, const std::string phone, const double lat, const double lon, const double radiuskm)
      {
            require_auth(owner);

            if(name.length() > 64)
            {
                  eosio::print("Sorry a driver name is limited to 64 characters.");
                  return;
            }

            if(phone.length() > 32)
            {
                  eosio::print("Sorry a driver phone number is limited to 32 characters.");
                  return;
            }

            if(radiuskm > 40)
            {
                  eosio::print("Sorry you cannot set a pickup radius more than 40 kilometers from your base lat/lon as it would take you more than 30 minutes at 80 km/h on average to reach this distance.");
                  return;
            }

            _drivers.emplace(owner, [&](auto& w)
            {
                  w.owner = owner;
                  w.name = name;
                  w.phone = phone;
                  w.lat = lat;
                  w.lon = lon;
                  w.radius = radiuskm;
            });
      }

      //driver update details
      __attribute__((eosio_action))
      void updatedriver(const account_name owner, const std::string name, const std::string phone, const double lat, const double lon, const double radiuskm)
      {
            require_auth(owner);

            if(name.length() > 64)
            {
                  eosio::print("Sorry a driver name is limited to 64 characters.");
                  return;
            }

            if(phone.length() > 32)
            {
                  eosio::print("Sorry a driver phone number is limited to 32 characters.");
                  return;
            }

            if(radiuskm > 40)
            {
                  eosio::print("Sorry you cannot set a pickup radius more than 40 kilometers from your base lat/lon as it would take you more than 30 minutes at 80 km/h on average to reach this distance.");
                  return;
            }

            //Update existing record
            auto r = _drivers.find(owner);
            _drivers.modify(r, owner, [&](auto& w)
            {
                  w.name = name;
                  w.phone = phone;
                  w.lat = lat;
                  w.lon = lon;
                  w.radius = radiuskm;
            });
      }

      //create review
      __attribute__((eosio_action))
      void createreview(const account_name owner, const account_name driver, const std::string review_title, const std::string review_body, const char score)
      {
            require_auth(owner);

            //Limit scoring range
            if(score < -5)
            {
                  eosio::print("You cannot rate a diver less than -5 (range is -5 to +5).");
                  return;
            }

            if(score > 5)
            {
                  eosio::print("You cannot rate a diver more than +5 (range is -5 to +5).");
                  return;
            }

            //We may not care how much ran a user spends, but I care how long table searches take so we're limiting string lengths
            if(review_title.length() > 64)
            {
                  eosio::print("Sorry a review title is limited to 64 characters.");
                  return;
            }

            if(review_body.length() > 439)
            {
                  eosio::print("Sorry a review body is limited to 439 characters.");
                  return;
            }

            //Ok lets place the review at the cost of the owner
            _reviews.emplace(owner, [&](auto& w)
            {
                  w.driver = driver;
                  w.review_title = review_title;
                  w.review_body = review_body;
                  w.review_score = score;
            });
      }

      //update review
      __attribute__((eosio_action))
      void updatereview(const account_name owner, const account_name driver, const std::string review_title, const std::string review_body, const char score)
      {
            require_auth(owner);

            //Limit scoring range
            if(score < -5)
            {
                  eosio::print("You cannot rate a diver less than -5 (range is -5 to +5).");
                  return;
            }

            if(score > 5)
            {
                  eosio::print("You cannot rate a diver more than +5 (range is -5 to +5).");
                  return;
            }

            //We may not care how much ran a user spends, but I care how long table searches take so we're limiting string lengths
            if(review_title.length() > 64)
            {
                  eosio::print("Sorry a review title is limited to 64 characters.");
                  return;
            }

            if(review_body.length() > 439)
            {
                  eosio::print("Sorry a review body is limited to 439 characters.");
                  return;
            }

            //Ok lets place the review at the cost of the owner=
            auto r = _reviews.find(driver);
            _reviews.modify(r, owner, [&](auto& w)
            {
                  w.review_title = review_title;
                  w.review_body = review_body;
                  w.review_score = score;
            });
      }

private:

      double deg2rad(const double deg)
      {
            return deg * 0.017453293;
      }

      double getDistanceKM(const double lat1, const double lon1, const double lat2, const double lon2)
	{
		const double deglat = deg2rad(lat2 - lat1)*0.5;
		const double deglon = deg2rad(lon2 - lon1)*0.5;

		return 6371 * (2 * asin(sqrt(sin(deglat) * sin(deglat) + cos(deg2rad(lat1)) * cos(deg2rad(lat2)) * sin(deglon) * sin(deglon))));
	}
      
      struct driver //128 bytes
      {
            account_name owner; //8 bytes
            std::string name; //64 bytes max
            std::string phone; //32 bytes max
            double lat; //8 bytes
            double lon; //8 bytes
            double radius; //8 bytes

            uint64_t primary_key() const{return owner;}
      };

      typedef eosio::multi_index<N(drivers), driver> driver_table;
      driver_table _drivers;

      struct review //512 bytes
      {
            account_name driver; //8 bytes
            std::string review_title; //64 bytes max
            std::string review_body; //439 bytes max
            char review_score; //1 byte

            uint64_t primary_key() const{return driver;} //no contribute
      };

      typedef eosio::multi_index<N(reviews), review> review_table;
      review_table _reviews;

};

EOSIO_ABI(eostaxi, (findtaxis)(findreview)(createreview)(createdriver)(updatereview)(updatedriver))
