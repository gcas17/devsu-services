CREATE DATABASE IF NOT EXISTS devsudb;
USE devsudb;

DROP TABLE IF EXISTS Movement;
DROP TABLE IF EXISTS Account;
DROP TABLE IF EXISTS Client;
DROP TABLE IF EXISTS Person;

CREATE TABLE Person (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    gender VARCHAR(255),
    age INT,
    identification VARCHAR(255),
    address VARCHAR(255),
    phone VARCHAR(255)
);

CREATE TABLE Client (
    id INT PRIMARY KEY AUTO_INCREMENT,
    password VARCHAR(255),
    status VARCHAR(255),
    person_id INT,
    FOREIGN KEY (person_id) REFERENCES Person(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Account (
    id INT PRIMARY KEY AUTO_INCREMENT,
    account_number VARCHAR(255),
    account_type VARCHAR(255),
    initial_balance DECIMAL(10, 2),
    status VARCHAR(255),
    client_id INT,
    FOREIGN KEY (client_id) REFERENCES Client(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Movement (
    id INT PRIMARY KEY AUTO_INCREMENT,
    date DATE,
    movement_type VARCHAR(255),
    value DECIMAL(10, 2),
    available_balance DECIMAL(10, 2),
    account_id INT,
    FOREIGN KEY (account_id) REFERENCES Account(id) ON DELETE CASCADE ON UPDATE CASCADE
);