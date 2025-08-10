-- create Formula One Database
CREATE DATABASE f1_database;

-- backup Formula One Database to PC
BACKUP DATABASE f1_database
TO DISK = "C:\Users\sirco\f1_sql_backup";

-- Tables
CREATE TABLE circuits (
    circuit_id INT AUTO_INCREMENT,
    circuit_ref VARCHAR(50),
    name VARCHAR(150),
    location VARCHAR(50),
    country VARCHAR(50),
    lat DECIMAL(2,5),
    long DECIMAL(3, 5),
    alt INT,
    url TEXT,
    PRIMARY KEY (circuit_id)
);

CREATE TABLE constructors (
    constructor_id INT AUTO_INCREMENT,
    constructor_ref VARCHAR(50),
    name VARCHAR(50),
    nationality VARCHAR(50),
    url TEXT,
    PRIMARY KEY (constructor_id)
);

CREATE TABLE drivers (
    driver_id INT AUTO_INCREMENT,
    driver_ref VARCHAR(50),
    number INT,
    code VARCHAR(10),
    forename VARCHAR(50),
    surname VARCHAR(50),
    dob DATE,
    nationality VARCHAR(50),
    url TEXT,
    PRIMARY KEY (driver_id)
);

CREATE TABLE races (
    race_id INT AUTO_INCREMENT,
    year CHAR(4),
    round INT,
    circuit_id INT,
    name VARCHAR(150),
    date DATE,
    time TIME,
    url TEXT,
    fp1_date DATE,
    fp1_time TIME,
    fp2_date DATE,
    fp2_time TIME,
    fp3_date DATE,
    fp3_time TIME,
    quali_date DATE,
    quali_time TIME,
    sprint_date DATE,
    sprint_time TIME,
    PRIMARY KEY (race_id),
    FOREIGN KEY (circuit_id) REFERENCES circuits
);

CREATE TABLE results (
    result_id INT AUTO_INCREMENT,
    race_id INT,
    driver_id INT,
    constructor_id INT,
    PRIMARY KEY (result_id),
    FOREIGN KEY (race_id), REFERENCES races,
    FOREIGN KEY (driver_id)m REFERENCES drivers,
    FOREIGN KEY (constructor_id), REFERENCES constructors
);