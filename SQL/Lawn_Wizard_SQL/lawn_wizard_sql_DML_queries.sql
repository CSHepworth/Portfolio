-- Contains DML (Data Manipulation Language) queries for create, read, update, delete operations ot the Lawn Wizard database

-- add states to database
INSERT INTO state
VALUES
    (1, "Idaho", "ID"),
    (2, "Wyoming", "WY"),
    (3, "Montana", "MT")
;

-- add cities to database
INSERT INTO city
VALUES
    (1, "Blackfoot", 1),
    (2, "Idaho Falls", 1),
    (3, "Pocatello", 1),
    (4, "Jackson Hole", 2),
    (5, "Helena", 3)
;

-- add an address
INSERT INTO address
VALUES
    (1, "123 First Street", "Building 4", 2, "83402")
;

-- add a SE Idaho Branch
INSERT INTO branch
VALUES
    (1, "SE Idaho Branch", 1)
;

-- update the SE Idaho Branch name to South East Idaho Branch
UPDATE branch
SET branch_name = "South East Idaho Branch"
WHERE branch_id = 1;

DELETE FROM city WHERE city_name = "Helena";

-- select all states
SELECT * FROM state;

-- select all cities, order them alphabetically
SELECT DISTINCT city_name
FROM city
ORDER BY city_name;

