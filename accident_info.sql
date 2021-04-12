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
    location_easting_OSGR VARCHAR(6),
    location_northing_OSGR VARCHAR(7),
    longitude VARCHAR(9),
    latitude VARCHAR(9),
    police_force INT UNSIGNED,
    accident_severity INT UNSIGNED,
    number_of_vehicles INT UNSIGNED,
    number_of_casualties INT UNSIGNED,
    date_of_accident VARCHAR(10),
    day_of_week INT UNSIGNED,
    time_of_accident VARCHAR(5),
    local_authority_district INT UNSIGNED,
    local_authority_highway VARCHAR(9),
    first_road_class INT,
    first_road_number INT,
    road_type INT,
    speed_limit INT UNSIGNED,
    junction_detail INT,
    junction_control INT,
    second_road_class INT,
    second_road_number INT,
    pedestrian_crossing_human_control INT,
    pedestrian_crossing_physical_facilities INT,
    light_conditions INT,
    weather_conditions INT,
    road_surface_conditions INT,
    special_conditions_at_site INT,
    carriageway_hazards INT,
    urban_or_rural_area INT UNSIGNED,
    did_police_officer_attend_scene_of_accident INT,
    LSOA_of_accident_location VARCHAR(10),
    PRIMARY KEY (accident_index)
) ENGINE = INNODB;

-- Load data into accident_info table.
LOAD DATA LOCAL INFILE '/Users/jonahpayne/Documents/College - Senior/Spring 2021/CS 3265/Project 2/Project 2 Data/Accidents0514.csv'
INTO TABLE accident_info
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

ALTER TABLE accident_info
DROP PRIMARY KEY;

ALTER TABLE accident_info
ADD COLUMN accident_id INT AUTO_INCREMENT PRIMARY KEY;
