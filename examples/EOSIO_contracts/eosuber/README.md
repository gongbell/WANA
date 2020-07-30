This is a framework for making decentralised Uber/Taxi services on the EOSIO platform.
Using the EOSIO CDT for developing Smart Contracts.

You can find drivers and reviews of drivers for free, anonymously.
- findtaxi(user_lat, user_lon)
- findreview(driver)

You can apply to be a driver or update your record (at your own ram cost)
- createdriver(driver, driver_name, driver_phone, driver_base_lat, driver_base_lon, driver_travel_radius_km)
- updatedriver(driver, driver_name, driver_phone, driver_base_lat, driver_base_lon, driver_travel_radius_km)

You can create a review or update your review (at your own ram cost)
- createreview(owner, driver, review_title, review_body, score)
- updatereview(owner, driver, review_title, review_body, score)

/SampleWebGlu : This directory contains examples of using Google Maps maplaces.js plugin to extract lat/lon coordinates and a radius in km from google maps (to be used by drivers) and using HTML5/JS to request a users current lat/lon position from their mobile phone (to be used by users).

:: Compile

eosio-cpp eosuber.cpp -o eosuber.wasm --abigen

:: Notes

Some basic cell-space-partitioning would go a long way in the findtaxi() function.
