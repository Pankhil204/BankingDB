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

CREATE TABLE Accounts (
    AccountID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(10,2)
);

CREATE TABLE Transactions (
    TransactionID INT,
    TransactionDate DATE,
    Amount DECIMAL(10,2),
    TransactionType VARCHAR(20)
);

CREATE TABLE Branches (
    BranchID INT,
    BranchName VARCHAR(100),
    BranchAddress VARCHAR(200),
    BranchPhone VARCHAR(15)
);

CREATE TABLE AccountBranches ( 
		AssignmentDate DATE
);

CREATE TABLE Loans (
    LoanID INT,
    LoanAmount DECIMAL(10,2),
    InterestRate DECIMAL(5,2),
    StartDate DATE,
    EndDate DATE
);

ALTER TABLE Customers
ADD DateOfBirth DATE;

desc Customers;

ALTER TABLE Customers
MODIFY Mobileno VARCHAR(20);

ALTER TABLE Accounts
ADD CONSTRAINT chk_MinBalance
CHECK (Balance >= 1000);

DROP TABLE accountbranches;

ALTER TABLE Accounts
ADD CustomerID INT;

ALTER TABLE Accounts
ADD CONSTRAINT FK_Account_Customers
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);

desc accounts;

ALTER TABLE Accounts
ADD CONSTRAINT primary key(AccountID);

ALTER TABLE Customers
MODIFY FirstName VARCHAR(50) NOT NULL;

desc Customers;

ALTER TABLE Customers
ADD CONSTRAINT uq_Email UNIQUE (Email);

ALTER TABLE Branches
ADD CONSTRAINT
PRIMARY KEY(BranchID);

desc Branches;

ALTER TABLE Accounts
ADD BranchID INT;

ALTER TABLE Accounts
ADD CONSTRAINT FK_Account_Branches
FOREIGN KEY (BranchID)
REFERENCES Branches(BranchID);

desc Accounts;