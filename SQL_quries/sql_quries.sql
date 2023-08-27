create database telangana_growth_analysis

use telangana_growth_analysis

CREATE TABLE dim_date(
    `month` DATE,
    mmm VARCHAR(10),
    `quarter` VARCHAR(5),
    fiscal_year YEAR,
    PRIMARY KEY (`month`)
);

-- Table 2: districts
CREATE TABLE districts(
    dist_code VARCHAR(10) PRIMARY KEY,
    district VARCHAR(255)
);

-- Table 3: documents
CREATE TABLE documents(
    id INT AUTO_INCREMENT PRIMARY KEY,
    dist_code VARCHAR(10),
    month DATE,
    documents_registered_cnt INT,
    documents_registered_rev DECIMAL(15,2),
    estamps_challans_cnt INT,
    estamps_challans_rev DECIMAL(15,2),
    FOREIGN KEY (dist_code) REFERENCES districts(dist_code),
    FOREIGN KEY (month) REFERENCES dim_date(month)
);

-- Table 4: vehicles
CREATE TABLE vehicles(
    id INT AUTO_INCREMENT PRIMARY KEY,
    dist_code VARCHAR(10),
    month DATE,
    fuel_type_petrol INT,
    fuel_type_diesel INT,
    fuel_type_electric INT,
    fuel_type_others INT,
    vehicleClass_MotorCycle INT,
    vehicleClass_MotorCar INT,
    vehicleClass_AutoRickshaw INT,
    vehicleClass_Agriculture INT,
    vehicleClass_others INT,
    seatCapacity_1_to_3 INT,
    seatCapacity_4_to_6 INT,
    seatCapacity_above_6 INT,
    brand_new_vehicles INT,
    pre_owned_vehicles INT,
    category_non_transport INT,
    category_transport INT,
    FOREIGN KEY (dist_code) REFERENCES districts(dist_code),
    FOREIGN KEY (month) REFERENCES dim_date(month)
);

-- Table 5: investments
CREATE TABLE investments(
    id INT AUTO_INCREMENT PRIMARY KEY,
    dist_code VARCHAR(10),
    month DATE,
    sector VARCHAR(255),
    investment_in_cr DECIMAL(15,2),
    number_of_employees INT,
    FOREIGN KEY (dist_code) REFERENCES districts(dist_code),
    FOREIGN KEY (month) REFERENCES dim_date(month)
);


show tables;

describe table dim_date;
describe table districts;
describe table documents;
describe table investments;
describe table vehicles;


load data infile 'D:\\Telangana_DS_Project\\dataset\\dim_date.csv'
into table dim_date
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

select * from dim_date;

load data infile 'D:\\Telangana_DS_Project\\dataset\\dim_districts.csv'
into table districts
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

select * from districts;

LOAD DATA INFILE 'D:\\Telangana_DS_Project\\dataset\\fact_stamps.csv'
INTO TABLE documents
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(dist_code, month, documents_registered_cnt, documents_registered_rev, estamps_challans_cnt, estamps_challans_rev);


select * from documents;

LOAD DATA INFILE 'D:\\Telangana_DS_Project\\dataset\\fact_transport.csv'
INTO TABLE vehicles
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(dist_code, month, fuel_type_petrol, fuel_type_diesel, fuel_type_electric, fuel_type_others, vehicleClass_MotorCycle, vehicleClass_MotorCar, vehicleClass_AutoRickshaw, vehicleClass_Agriculture, vehicleClass_others, seatCapacity_1_to_3, seatCapacity_4_to_6, seatCapacity_above_6, brand_new_vehicles, pre_owned_vehicles, category_non_transport, category_transport);

select * from vehicles;

LOAD DATA INFILE 'D:\\Telangana_DS_Project\\dataset\\fact_TS_iPASS.csv'
INTO TABLE investments
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(dist_code, @var_month, sector, investment_in_cr, number_of_employees)
SET month = STR_TO_DATE(@var_month, '%d-%m-%Y');



select * from investments;
