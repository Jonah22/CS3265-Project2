-- Name: Jonah Payne, Eric Mitchell III
-- Email: jonah.a.payne@vanderbilt.edu, eric.mitchell@vanderbilt.edu
-- Project 2


-- Create the database.
DROP DATABASE IF EXISTS uk_car_accidents;
CREATE DATABASE uk_car_accidents;
USE uk_car_accidents;


-- Create the megatable titled accideent_info.
DROP TABLE IF EXISTS accident_info;
CREATE TABLE IF NOT EXISTS accident_info (
	# VARCHAR(15) to hold the alphanumeric characters of each accident's index code.
	accident_index VARCHAR(15),
    # VARCHAR(6) to hold the six characters of each accident's easting grid reference number.
    location_easting_OSGR VARCHAR(6),
    # VARCHAR(7) to hold the seven characters of each accident's northing grid reference number.
    location_northing_OSGR VARCHAR(7),
    # VARCHAR(9) to hold the characters of each accident's longitude.
    longitude VARCHAR(9),
    # VARCHAR(9) to hold the characters of each accident's latitude.
    latitude VARCHAR(9),
    # TINYINT to hold the number codes for each police force since there are less than 100.
    police_force TINYINT UNSIGNED,
	# TINYINT to hold the number codes for each accident's severity since there are only 3.
    accident_severity TINYINT UNSIGNED,
    # TINYINT to hold the number of vehicles for each accident since no accident involved over 127 vehicles.
    number_of_vehicles TINYINT UNSIGNED,
    # TINYINT to hold the number of casualties for each accident since no accident had over 127 casualties.
    number_of_casualties TINYINT UNSIGNED,
    # VARCHAR(10) to hold the British date format given in the data.
    date_of_accident VARCHAR(10),
    # TINYINT to hold the number codes for each day of the week.
    day_of_week TINYINT UNSIGNED,
    # TIME to hold the time that each accident occurred at.
    time_of_accident VARCHAR(5),
    # INT to hold the number codes for each district district since there are over 255 (TINYINT max).
    local_authority_district INT UNSIGNED,
    # VARCHAR(9) to hold the alphanumeric characters of the highway authority.
    local_authority_highway VARCHAR(9),
    # TINYINT to hold the number codes for each road class.
    first_road_class TINYINT,
    # INT to hold the road number than can be higher than 255 (TINYINT max).
    first_road_number INT,
    # TINYINT to hold the number codes for road type.
    road_type TINYINT,
    # TINYINT to hold the speed limit of the road.
    speed_limit TINYINT UNSIGNED,
    # TINYINT to hold the number codes for details about the junction where the accident occurred.
    junction_detail TINYINT,
    # TINYINT to hold the number codes for who/what controlled the junction traffic.
    junction_control TINYINT,
    # TINYINT to hold the number codes for each road class.
    second_road_class TINYINT,
    # INT to hold the road number than can be higher than 255 (TINYINT max).
    second_road_number INT,
    # TINYINT to hold the number codes for who controlled the pedestrian traffic in the area.
    pedestrian_crossing_human_control TINYINT,
    # TINYINT to hold the number codes for type of physical pedestrian crossing in the area.
    pedestrian_crossing_physical_facilities TINYINT,
    # TINYINT to hold the number codes for light conditions at the time.
    light_conditions TINYINT,
    # TINYINT to hold the number codes for weather conditions at the time.
    weather_conditions TINYINT,
    # TINYINT to hold the number codes for road surface conditions at the time.
    road_surface_conditions TINYINT,
    # TINYINT to hold the number codes for any special conditions at the scene of the accident.
    special_conditions_at_site TINYINT,
    # TINYINT to hold the number codes for anything that was in the carriageway.
    carriageway_hazards TINYINT,
    # TINYINT to hold the number codes for whether the area was urban or rural.
    urban_or_rural_area TINYINT UNSIGNED,
    # TINYINT to hold the number codes for whether or not an officer attended the accident scene.
    did_police_officer_attend_scene_of_accident TINYINT,
    # VARCHAR(10) to hold the ten characters of each accident's LSOA alphanumeric code.
    LSOA_of_accident_location VARCHAR(10),
    PRIMARY KEY (accident_index)
) ENGINE = INNODB;


-- Load data into accident_info table.
LOAD DATA LOCAL INFILE '/Users/jonahpayne/Documents/College - Senior/Spring 2021/CS 3265/Project 2/Project 2 Data/Accidents0514.csv'
INTO TABLE accident_info
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;


-- Change primary key.
ALTER TABLE accident_info
DROP PRIMARY KEY;

ALTER TABLE accident_info
ADD COLUMN accident_id INT AUTO_INCREMENT PRIMARY KEY;


-- Put newly added primary key column as the first in the megatable.
ALTER TABLE accident_info 
CHANGE COLUMN accident_id 
accident_id INT(11) NOT NULL AUTO_INCREMENT FIRST;


-- Create accident table.
DROP TABLE IF EXISTS accident;
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
    PRIMARY KEY(accident_id),
    CONSTRAINT fk_acc_id FOREIGN KEY (accident_id)
		REFERENCES accident_info (accident_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE = INNODB;


-- Create location table.
DROP TABLE IF EXISTS location;
CREATE TABLE IF NOT EXISTS location (
	accident_id INT,
    location_easting_OSGR VARCHAR(6),
    location_northing_OSGR VARCHAR(7),
    longitude VARCHAR(9),
    latitude VARCHAR(9),
    local_authority_district INT UNSIGNED,
    local_authority_highway VARCHAR(9),
    first_road_class TINYINT,
    first_road_number INT,
    second_road_class TINYINT,
    second_road_number INT,
    urban_or_rural_area TINYINT UNSIGNED,
    LSOA_of_accident_location VARCHAR(10),
    PRIMARY KEY(accident_id),
    CONSTRAINT fk_acc_id_loc FOREIGN KEY (accident_id)
		REFERENCES accident_info (accident_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE = INNODB;


-- Create conditions table.
DROP TABLE IF EXISTS conditions;
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
    PRIMARY KEY(accident_id),
    CONSTRAINT fk_acc_id_cond FOREIGN KEY (accident_id)
		REFERENCES accident_info (accident_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE = INNODB;


-- Insert data from accident_info into accident table.
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


-- Insert data from accident_info into location table.
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


-- Insert data from accident_info into conditions table.
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


-- Advanced Feature #1 - Stored procedure to insert a new accident.
DROP PROCEDURE IF EXISTS create_new_accident;

DELIMITER //

CREATE PROCEDURE create_new_accident(
	IN 
)

BEGIN

DECLARE EXIT HANDLER FOR 1048
SELECT "..." AS message;

# insert statement

SELECT "accident was inserted." AS message;

END //

-- Advanced Feature #2 - Stored procedure to edit an accident.


-- Advanced Feature #3 - Stored procedure to delete an accident.
DROP PROCEDURE IF EXISTS deleteAccident;

DELIMITER //

CREATE PROCEDURE deleteAccident(IN accidentIndex VARCHAR(50))
BEGIN

  DELETE FROM uk_car_accidents
  WHERE accident_index = accidentIndex;

END//

DELIMITER ;

-- Advanced Feature #4 - 

