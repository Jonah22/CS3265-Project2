-- Name: Jonah Payne, Eric Mitchell III
-- Email: jonah.a.payne@vanderbilt.edu, eric.mitchell@vanderbilt.edu
-- Project 2, Part 2

-- Create the database.
DROP DATABASE IF EXISTS uk_car_accidents;
CREATE DATABASE uk_car_accidents;
USE uk_car_accidents;

-- Create the megatable.
DROP TABLE IF EXISTS accident_info;
CREATE TABLE accident_info (
	accident_index VARCHAR(15),
    location_easting_OSGR MEDIUMINT UNSIGNED,
    location_northing_OSGR MEDIUMINT UNSIGNED,
    longitude DECIMAL(7,6),
    latitude DECIMAL(8,6),
    police_force TINYINT UNSIGNED,
    accident_severity TINYINT UNSIGNED,
    number_of_vehicles TINYINT UNSIGNED,
    number_of_casualties TINYINT UNSIGNED,
    date_of_accident VARCHAR(10),
    time_of_accident TIME,
    local_authority_district TINYINT UNSIGNED,
    local_authority_highway TINYINT UNSIGNED,
    first_road_class TINYINT,
    first_road_number TINYINT UNSIGNED,
    road_type TINYINT UNSIGNED,
    speed_limit TINYINT UNSIGNED,
    junction_detail TINYINT UNSIGNED,
    junction_control TINYINT UNSIGNED,
    second_road_class TINYINT,
    second_road_number TINYINT UNSIGNED,
    pedestrian_crossing_human_control TINYINT UNSIGNED,
    pedestrian_crossing_physical_facilities TINYINT UNSIGNED,
    light_conditions TINYINT UNSIGNED,
    weather_conditions TINYINT UNSIGNED,
    road_surface_conditions TINYINT UNSIGNED,
    special_conditions_at_site TINYINT UNSIGNED,
    carriageway_hazards TINYINT UNSIGNED,
    urban_or_rural_area TINYINT UNSIGNED,
    did_police_officer_attend_scene_of_accident TINYINT UNSIGNED,
    LSOA_of_accident_location VARCHAR(9),
    PRIMARY KEY (accident_index)
) ENGINE = INNODB;

-- Load data into accident_info table.
LOAD DATA LOCAL INFILE '/Users/jonahpayne/Documents/College - Senior/Spring 2021/CS 3265/Project 2 Data/Accidents0514.csv'
INTO TABLE accident_info
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;