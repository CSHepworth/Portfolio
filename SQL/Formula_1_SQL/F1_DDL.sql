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

CREATE TABLE status (
    status_id INT AUTO_INCREMENT,
    status VARCHAR(50) NOT NULL,
    PRIMARY KEY (status_id)
)

CREATE TABLE results (
    result_id INT AUTO_INCREMENT,
    race_id INT,
    driver_id INT,
    constructor_id INT,
    number INT,
    grid INT,
    position INT,
    position_text VARCHAR(3),
    position_order INT,
    points DECIMAL(2, 1),
    laps INT,
    time TEXT,
    milliseconds INT,
    fastest_lap INT,
    rank INT,
    fastest_lap_time TEXT,
    fastest_lap_speed DECIMAL(3, 3),
    status_id INT,
    PRIMARY KEY (result_id),
    FOREIGN KEY (race_id), REFERENCES races,
    FOREIGN KEY (driver_id) REFERENCES drivers,
    FOREIGN KEY (constructor_id), REFERENCES constructors,
    FOREIGN KEY (status_id), REFERENCES status
);

CREATE TABLE lap_times (
    race_id INT,
    driver_id INT,
    lap INT,
    position INT,
    time TEXT,
    milliseconds INT,
    PRIMARY KEY (race_id, driver_id, lap),
    FOREIGN KEY (race_id) REFERENCES races,
    FOREIGN KEY (driver_id) REFERENCES drivers
);

CREATE TABLE constructor_results (
    constructor_result_id INT AUTO_INCREMENT,
    race_id INT,
    constructor_id INT,
    points DECIMAL(2,1),
    status_id INT,
    PRIMARY KEY (constructor_result_id),
    FOREIGN KEY (race_id) REFERENCES races,
    FOREIGN KEY (constructor_id) REFERENCES constructors,
    FOREIGN KEY (status_id) REFERENCES status
);