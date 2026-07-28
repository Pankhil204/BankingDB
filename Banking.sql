CREATE DATABASE BankingDB;
USE BankingDB;

CREATE TABLE Customers
(
	CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    MobileNo VARCHAR(10),
    AccountCreationDate DATE
);

DESC customers;

select * from customers;