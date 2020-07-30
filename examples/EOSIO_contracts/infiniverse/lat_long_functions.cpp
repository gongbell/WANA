#include <cmath>
#include <utility>

const double meters_per_degree_latitude = 111133;
const double meters_per_degree_longitude_equator = 111320;

std::pair<double, double> lat_long_to_meters(const double& lat1,
    const double& long1, const double& lat2, const double& long2)
{
    double average_lat_radians = (lat1 + lat2)/2 * M_PI / 180;
    double lat_difference = abs(lat1 - lat2);
    double long_difference = abs(long1 - long2);
    double lat_distance_meters = lat_difference * meters_per_degree_latitude;
    double long_distance_meters = long_difference * meters_per_degree_longitude_equator * cos(average_lat_radians);
    return std::pair<double, double>(lat_distance_meters, long_distance_meters);
}

double meters_to_lat_dist(const double& lat_distance_meters)
{
    return lat_distance_meters / meters_per_degree_latitude;
}

double meters_to_long_dist(const double& long_distance_meters, const double& lat1, const double& lat2)
{
    double average_lat_radians = (lat1 + lat2)/2 * M_PI / 180;
    return long_distance_meters / meters_per_degree_longitude_equator / cos(average_lat_radians);
}
