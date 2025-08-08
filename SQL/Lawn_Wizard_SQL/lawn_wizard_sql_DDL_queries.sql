-- Contains DDL (Data Definition Language) queries for creating tables within the lawn wizard database

CREATE TABLE state (
    state_id INT PRIMARY KEY,
    state_name VARCHAR(50),
    state_abbr CHAR(2)
)

CREATE TABLE city (
    city_id INT PRIMARY KEY,
    city_name VARCHAR(50),
    state_id INT NOT NULL,
    FOREIGN KEY state_id REFERENCES state(state_id)
)

CREATE TABLE address (
    address_id INT PRIMARY KEY,
    street_address VARCHAR(50),
    street_address_line_2 VARCHAR(50),
    city_id INT NOT NULL,
    zip CHAR(5)
    FOREIGN KEY (city_id) REFERENCES city(city_id)
)

CREATE TABLE branch (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(50),
    address_id INT,
    FOREIGN KEY (address_id) REFERENCES address(address_id)
)

CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    hire_date DATE DEFAULT CURRENT_DATE,
    DOB DATE,
    job_title VARCHAR(50),
    branch_id INT NOT NULL,
    address_id INT NOT NULL,
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id)
)

CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    acc_date DATE DEFAULT CURRENT_DATE,
    last_service DATE
)

CREATE TABLE customer_addresses (
    customer_id INT NOT NULL,
    address_id INT NOT NULL,
    PRIMARY KEY (customer_id, address_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
        ON DELETE CASCADE,
    FOREIGN KEY (address_id) REFERENCES address(address_id)
        ON DELETE CASCADE
)

CREATE TABLE service (
    service_id INT PRIMARY KEY,
    name VARCHAR(50),
    typical_price DECIMAL(6, 2),
    description TEXT
)

CREATE TABLE invoice (
    invoice_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    total_price DECIMAL(6, 2),
    date DATE,
    paid BOOLEAN,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (service_id) REFERENCES service(service_id)
)

CREATE TABLE invoice_services (
    service_id INT NOT NULL,
    invoice_id INT NOT NULL,
    PRIMARY KEY (invoice_id, service_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id)
        ON DELETE CASCADE,
    FOREIGN KEY (service_id) REFERENCES service(service_id)
        ON DELETE CASCADE
)