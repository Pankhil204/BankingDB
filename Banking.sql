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

SELECT 
	CONSTRAINT_NAME,
    CONSTRAINT_TYPE
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_SCHEMA = 'bankingdb'
  AND TABLE_NAME = 'Branches';

SHOW CREATE TABLE Accounts;

ALTER TABLE Transactions
ADD CONSTRAINT PK_Transactions
PRIMARY KEY (TransactionID);

ALTER TABLE Transactions
ADD AccountID INT;

ALTER TABLE Transactions
ADD CONSTRAINT FK_Transactions_Accounts
FOREIGN KEY (AccountID)
REFERENCES Accounts(AccountID);

desc Transactions;

ALTER TABLE loans
ADD CONSTRAINT PK_Loans
PRIMARY KEY (LoanID);

ALTER TABLE loans
ADD CustommerID INT;

ALTER TABLE loans
ADD CONSTRAINT FK_Loans_Customers
FOREIGN KEY (CustommerID)
REFERENCES Customers(CustomerID);

INSERT INTO Customers
(CustomerID, FirstName, LAstName, Email, MobileNo, DateOfBirth)
VALUES
(101,'Rahul','Sharma','rahul@gmail.com','9876543210','1998-04-15');


INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
Values
(201,101,'Savings',25000);

INSERT INTO Customers
VALUES
(102,'Ketan','Tiwari','ketan@gmail.com','7987846654','2026-08-04','2000-06-22');

INSERT INTO Customers
(CustomerID, FirstName, LAstName, Email, MobileNo, AccountCreationDate, DateOfBirth)
VALUES
(103,'Rohit','Mate','rohit@gmail.com','7418529630','2026-08-03','1996-11-05'),
(104,'Lokesh','Patil','lokesh@gmail.com','9874563210','2025-02-04','1999-01-13');

UPDATE Customers
SET AccountCreationDate = '2024-03-26'
WHERE CustomerID = 101;


select * from customers;
select * from Accounts;
select * from branches;
select * from loans;
select * from transactions;