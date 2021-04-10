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


19:50:45	LOAD DATA LOCAL INFILE '/Users/jonahpayne/Documents/College - Senior/Spring 2021/CS 3265/Project 2/Project 2 Data/Accidents0514.csv' INTO TABLE accident_info FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES	1640597 row(s) affected, 64 warning(s): 1265 Data truncated for column 'longitude' at row 1 1265 Data truncated for column 'latitude' at row 1 1265 Data truncated for column 'longitude' at row 2 1265 Data truncated for column 'latitude' at row 2 1265 Data truncated for column 'longitude' at row 3 1265 Data truncated for column 'latitude' at row 3 1265 Data truncated for column 'longitude' at row 4 1265 Data truncated for column 'latitude' at row 4 1265 Data truncated for column 'longitude' at row 5 1265 Data truncated for column 'latitude' at row 5 1265 Data truncated for column 'longitude' at row 6 1265 Data truncated for column 'latitude' at row 6 1265 Data truncated for column 'longitude' at row 7 1265 Data truncated for column 'latitude' at row 7 1265 Data truncated for column 'longitude' at row 8 1265 Data truncated for column 'latitude' at row 8 1265 Data truncated for column 'longitude' at row 9 1265 Data truncated for column 'latitude' at row 9 1265 Data truncated for column 'longitude' at row 10 1265 Data truncated for column 'latitude' at row 10 1265 Data truncated for column 'longitude' at row 11 1265 Data truncated for column 'latitude' at row 11 1265 Data truncated for column 'longitude' at row 12 1265 Data truncated for column 'latitude' at row 12 1265 Data truncated for column 'longitude' at row 13 1265 Data truncated for column 'latitude' at row 13 1265 Data truncated for column 'longitude' at row 14 1265 Data truncated for column 'latitude' at row 14 1265 Data truncated for column 'longitude' at row 15 1265 Data truncated for column 'latitude' at row 15 1265 Data truncated for column 'longitude' at row 16 1265 Data truncated for column 'latitude' at row 16 1265 Data truncated for column 'longitude' at row 17 1265 Data truncated for column 'latitude' at row 17 1265 Data truncated for column 'longitude' at row 18 1265 Data truncated for column 'latitude' at row 18 1265 Data truncated for column 'longitude' at row 19 1265 Data truncated for column 'latitude' at row 19 1265 Data truncated for column 'longitude' at row 20 1265 Data truncated for column 'latitude' at row 20 1265 Data truncated for column 'longitude' at row 21 1265 Data truncated for column 'latitude' at row 21 1265 Data truncated for column 'longitude' at row 22 1265 Data truncated for column 'latitude' at row 22 1265 Data truncated for column 'longitude' at row 23 1265 Data truncated for column 'latitude' at row 23 1265 Data truncated for column 'longitude' at row 24 1265 Data truncated for column 'latitude' at row 24 1265 Data truncated for column 'longitude' at row 25 1265 Data truncated for column 'latitude' at row 25 1265 Data truncated for column 'longitude' at row 26 1265 Data truncated for column 'latitude' at row 26 1265 Data truncated for column 'longitude' at row 27 1265 Data truncated for column 'latitude' at row 27 1265 Data truncated for column 'longitude' at row 28 1265 Data truncated for column 'latitude' at row 28 1265 Data truncated for column 'longitude' at row 29 1265 Data truncated for column 'latitude' at row 29 1265 Data truncated for column 'longitude' at row 30 1265 Data truncated for column 'latitude' at row 30 1265 Data truncated for column 'longitude' at row 31 1265 Data truncated for column 'latitude' at row 31 1265 Data truncated for column 'longitude' at row 32 1265 Data truncated for column 'latitude' at row 32 Records: 1640597  Deleted: 0  Skipped: 0  Warnings: 3281558	14.834 sec
19:52:55	LOAD DATA LOCAL INFILE '/Users/jonahpayne/Documents/College - Senior/Spring 2021/CS 3265/Project 2/Project 2 Data/Accidents0514.csv' INTO TABLE accident_info FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES	1640597 row(s) affected, 64 warning(s): 1265 Data truncated for column 'location_northing_OSGR' at row 185697 1265 Data truncated for column 'location_northing_OSGR' at row 185698 1265 Data truncated for column 'location_northing_OSGR' at row 185699 1265 Data truncated for column 'location_northing_OSGR' at row 185700 1265 Data truncated for column 'location_northing_OSGR' at row 185701 1265 Data truncated for column 'location_northing_OSGR' at row 185702 1265 Data truncated for column 'location_northing_OSGR' at row 185703 1264 Out of range value for column 'first_road_number' at row 185703 1265 Data truncated for column 'location_northing_OSGR' at row 185704 1265 Data truncated for column 'location_northing_OSGR' at row 185706 1265 Data truncated for column 'location_northing_OSGR' at row 185707 1265 Data truncated for column 'location_northing_OSGR' at row 185708 1265 Data truncated for column 'location_northing_OSGR' at row 185709 1265 Data truncated for column 'location_northing_OSGR' at row 185710 1265 Data truncated for column 'location_northing_OSGR' at row 185711 1265 Data truncated for column 'location_northing_OSGR' at row 185712 1265 Data truncated for column 'location_northing_OSGR' at row 185713 1265 Data truncated for column 'location_northing_OSGR' at row 185714 1265 Data truncated for column 'location_northing_OSGR' at row 185716 1265 Data truncated for column 'location_northing_OSGR' at row 185717 1265 Data truncated for column 'location_northing_OSGR' at row 185718 1265 Data truncated for column 'location_northing_OSGR' at row 185719 1265 Data truncated for column 'location_northing_OSGR' at row 185720 1265 Data truncated for column 'location_northing_OSGR' at row 185721 1265 Data truncated for column 'location_northing_OSGR' at row 185722 1265 Data truncated for column 'location_northing_OSGR' at row 185723 1265 Data truncated for column 'location_northing_OSGR' at row 185724 1265 Data truncated for column 'location_northing_OSGR' at row 185725 1265 Data truncated for column 'location_northing_OSGR' at row 185726 1265 Data truncated for column 'location_northing_OSGR' at row 185727 1265 Data truncated for column 'location_northing_OSGR' at row 185728 1265 Data truncated for column 'location_northing_OSGR' at row 185729 1265 Data truncated for column 'location_northing_OSGR' at row 185730 1265 Data truncated for column 'location_northing_OSGR' at row 185731 1265 Data truncated for column 'location_northing_OSGR' at row 185732 1265 Data truncated for column 'location_northing_OSGR' at row 185733 1265 Data truncated for column 'location_northing_OSGR' at row 185735 1265 Data truncated for column 'location_northing_OSGR' at row 185736 1265 Data truncated for column 'location_northing_OSGR' at row 185737 1265 Data truncated for column 'location_northing_OSGR' at row 185738 1265 Data truncated for column 'location_northing_OSGR' at row 185739 1265 Data truncated for column 'location_northing_OSGR' at row 185740 1265 Data truncated for column 'location_northing_OSGR' at row 185741 1265 Data truncated for column 'location_northing_OSGR' at row 185742 1265 Data truncated for column 'location_northing_OSGR' at row 185743 1265 Data truncated for column 'location_northing_OSGR' at row 185744 1265 Data truncated for column 'location_northing_OSGR' at row 185745 1265 Data truncated for column 'location_northing_OSGR' at row 185746 1265 Data truncated for column 'location_northing_OSGR' at row 185747 1265 Data truncated for column 'location_northing_OSGR' at row 185748 1265 Data truncated for column 'location_northing_OSGR' at row 185749 1265 Data truncated for column 'location_northing_OSGR' at row 185750 1265 Data truncated for column 'location_northing_OSGR' at row 185751 1265 Data truncated for column 'location_northing_OSGR' at row 185752 1265 Data truncated for column 'location_northing_OSGR' at row 185753 1265 Data truncated for column 'location_northing_OSGR' at row 185754 1265 Data truncated for column 'location_northing_OSGR' at row 185755 1265 Data truncated for column 'location_northing_OSGR' at row 185756 1265 Data truncated for column 'location_northing_OSGR' at row 185757 1265 Data truncated for column 'location_northing_OSGR' at row 185758 1265 Data truncated for column 'location_northing_OSGR' at row 185759 1265 Data truncated for column 'location_northing_OSGR' at row 185760 1265 Data truncated for column 'location_northing_OSGR' at row 185761 1265 Data truncated for column 'location_northing_OSGR' at row 185762 Records: 1640597  Deleted: 0  Skipped: 0  Warnings: 586	13.523 sec
19:54:22	LOAD DATA LOCAL INFILE '/Users/jonahpayne/Documents/College - Senior/Spring 2021/CS 3265/Project 2/Project 2 Data/Accidents0514.csv' INTO TABLE accident_info FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES	1640597 row(s) affected, 2 warning(s): 1264 Out of range value for column 'first_road_number' at row 185703 1264 Out of range value for column 'first_road_number' at row 186129 Records: 1640597  Deleted: 0  Skipped: 0  Warnings: 2	13.455 sec
