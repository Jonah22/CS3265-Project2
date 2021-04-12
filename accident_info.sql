-- Name: Jonah Payne, Eric Mitchell III
-- Email: jonah.a.payne@vanderbilt.edu, eric.mitchell@vanderbilt.edu
-- Project 2, Part 2

-- Create the database.
DROP DATABASE IF EXISTS uk_car_accidents;
CREATE DATABASE uk_car_accidents;
USE uk_car_accidents;

-- Create the megatable.
DROP TABLE IF EXISTS accident_info;
CREATE TABLE IF NOT EXISTS accident_info (
	accident_index VARCHAR(15),
    location_easting_OSGR VARCHAR(6),
    location_northing_OSGR VARCHAR(7),
    longitude VARCHAR(9),
    latitude VARCHAR(9),
    police_force TINYINT UNSIGNED,
    accident_severity TINYINT UNSIGNED,
    number_of_vehicles INT UNSIGNED,
    number_of_casualties INT UNSIGNED,
    date_of_accident VARCHAR(10),
    day_of_week TINYINT UNSIGNED,
    time_of_accident VARCHAR(5),
    local_authority_district TINYINT UNSIGNED,
    local_authority_highway VARCHAR(9),
    first_road_class TINYINT,
    first_road_number INT,
    road_type TINYINT,
    speed_limit TINYINT UNSIGNED,
    junction_detail TINYINT,
    junction_control TINYINT,
    second_road_class TINYINT,
    second_road_number INT,
    pedestrian_crossing_human_control TINYINT,
    pedestrian_crossing_physical_facilities TINYINT,
    light_conditions TINYINT,
    weather_conditions TINYINT,
    road_surface_conditions TINYINT,
    special_conditions_at_site TINYINT,
    carriageway_hazards TINYINT,
    urban_or_rural_area TINYINT UNSIGNED,
    did_police_officer_attend_scene_of_accident TINYINT,
    LSOA_of_accident_location VARCHAR(10),
    PRIMARY KEY (accident_index)
) ENGINE = INNODB;

-- Load data into accident_info table.
LOAD DATA LOCAL INFILE '/Users/jonahpayne/Documents/College - Senior/Spring 2021/CS 3265/Project 2/Project 2 Data/Accidents0514.csv'
INTO TABLE accident_info
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

-- Change primary key and order of columns.
ALTER TABLE accident_info
DROP PRIMARY KEY;

ALTER TABLE accident_info
ADD COLUMN accident_id INT AUTO_INCREMENT PRIMARY KEY;

ALTER TABLE accident_info 
CHANGE COLUMN accident_id 
accident_id INT(11) NOT NULL AUTO_INCREMENT FIRST;

-- Create accident table.
CREATE TABLE IF NOT EXISTS accident (
	accident_id INT,
	accident_index VARCHAR(15),
    police_force TINYINT UNSIGNED,
    accident_severity TINYINT UNSIGNED,
    number_of_vehicles INT UNSIGNED,
    number_of_casualties INT UNSIGNED,
    date_of_accident VARCHAR(10),
    day_of_week TINYINT UNSIGNED,
    time_of_accident VARCHAR(5),
	did_police_officer_attend_scene_of_accident TINYINT,
    CONSTRAINT fk_acc_id FOREIGN KEY (accident_id)
		REFERENCES accident_info (accident_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE = INNODB;

-- Create location table.
CREATE TABLE IF NOT EXISTS location (
	accident_id INT,
    location_easting_OSGR VARCHAR(6),
    location_northing_OSGR VARCHAR(7),
    longitude VARCHAR(9),
    latitude VARCHAR(9),
    local_authority_district TINYINT UNSIGNED,
    local_authority_highway VARCHAR(9),
    first_road_class TINYINT,
    first_road_number INT,
    second_road_class TINYINT,
    second_road_number INT,
    urban_or_rural_area TINYINT UNSIGNED,
    LSOA_of_accident_location VARCHAR(10),
    CONSTRAINT fk_acc_id FOREIGN KEY (accident_id)
		REFERENCES accident_info (accident_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE = INNODB;

-- Create conditions table.
CREATE TABLE IF NOT EXISTS conditions (
	accident_id INT,
    road_type TINYINT,
    speed_limit TINYINT UNSIGNED,
    junction_detail TINYINT,
    junction_control TINYINT,
    pedestrian_crossing_human_control TINYINT,
    pedestrian_crossing_physical_facilities TINYINT,
    light_conditions TINYINT,
    weather_conditions TINYINT,
    road_surface_conditions TINYINT,
    special_conditions_at_site TINYINT,
    carriageway_hazards TINYINT,
    CONSTRAINT fk_acc_id FOREIGN KEY (accident_id)
		REFERENCES accident_info (accident_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE = INNODB;

-- Insert data from accident_info into accident table
INSERT INTO accident(accident_id,
					accident_index,
					police_force,
					accident_severity,
					number_of_vehicles,
					number_of_casualties,
					date_of_accident,
					day_of_week,
					time_of_accident,
					did_police_officer_attend_scene_of_accident) 
SELECT accident_id,
		accident_index,
		police_force,
		accident_severity,
		number_of_vehicles,
		number_of_casualties,
		date_of_accident,
		day_of_week,
		time_of_accident,
		did_police_officer_attend_scene_of_accident 
FROM accident_info;

-- Insert data from accident_info into location table
INSERT INTO location(accident_id,
					location_easting_OSGR,
					location_northing_OSGR,
					longitude,
					latitude,
					local_authority_district,
					local_authority_highway,
					first_road_class,
					first_road_number,
					second_road_class,
					second_road_number,
					urban_or_rural_area,
					LSOA_of_accident_location)
SELECT accident_id,
		location_easting_OSGR,
		location_northing_OSGR,
		longitude,
		latitude,
		local_authority_district,
		local_authority_highway,
		first_road_class,
		first_road_number,
		second_road_class,
		second_road_number,
		urban_or_rural_area,
		LSOA_of_accident_location
FROM accident_info;

-- Insert data from accident_info into conditions table
INSERT INTO conditions(accident_id,
						road_type,
						speed_limit,
						junction_detail,
						junction_control,
						pedestrian_crossing_human_control,
						pedestrian_crossing_physical_facilities,
						light_conditions,
						weather_conditions,
						road_surface_conditions,
						special_conditions_at_site,
						carriageway_hazards)
SELECT accident_id,
		road_type,
		speed_limit,
		junction_detail,
		junction_control,
		pedestrian_crossing_human_control,
		pedestrian_crossing_physical_facilities,
		light_conditions,
		weather_conditions,
		road_surface_conditions,
		special_conditions_at_site,
		carriageway_hazards
FROM accident_info;
