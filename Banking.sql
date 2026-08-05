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

INSERT INTO Customers
VALUES
(105,'Gaurav','Thakare','gaurav@gmail.com','9322241286','2022-12-14','2004-08-27');

INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
Values
(202,102,'Current',50000),
(203,103,'Savings',40000),
(204,104,'Current',100000),
(205,105,'Savings',85000);

INSERT INTO Branches
(BranchID, BranchName, BranchAddress, BranchPhone)
VALUES
(01,'Panchvati','Panchvati Karanja',2233556),
(02,'Gangapur','Serene Meadows',2478523),
(03,'College Campus','College Road',2789456),
(04,'Indraprasth','Dindori Road',2258528),
(05,'Makhamalabad','Makhamalabad Road',2963963);

INSERT INTO Loans
(LoanID, LoanAmount, InterestRate, StartDate, EndDate, CustommerID)
VALUES
(301,50000,8,'2025-06-01','2026-05-31',101),
(302,89000,8,'2026-07-01','2027-06-30',105),
(303,67000,8,'2025-01-01','2026-04-30',104),
(304,55000,8,'2026-08-01','2028-08-31',102),
(305,40000,8,'2025-02-01','2026-11-30',103);

INSERT INTO Transactions
VALUES
(1,'2025-01-10',5000,'Deposit',201),
(2,'2026-10-05',10000,'Return',202),
(3,'2025-04-19',15000,'Deposit',203),
(4,'2024-06-01',25000,'Return',204),
(5,'2025-12-10',15000,'Deposit',205);

DELETE FROM customers
WHERE CustomerID = 101;

UPDATE Accounts
SET Balance = Balance + 5000
WHERE CustomerID = 101;

UPDATE Customers 
set 
	email = 'rahulsharma@gmail.com',
	MobileNo = '7884455112'
WHERE 
		CustomerID = 101;
 
SELECT
	CustomerID, FirstName, LastName, MobileNo
From
	Customers;

SELECT * FROM Accounts
WHERE Balance > 30000;

SELECT * FROM Accounts
WHERE AccountType = 'Savings' ;

SELECT * FROM Accounts
WHERE AccountType != 'Savings' ;

SELECT * FROM Accounts
WHERE AccountType <> 'Savings' ;

SELECT * FROM Accounts
WHERE Balance >= 30000 AND AccountType = 'Savings' ;

SELECT * FROM Accounts
WHERE Balance >= 30000 OR AccountType = 'Savings' ; -- use OR or || in syntax

SELECT * from Accounts
WHERE NOT AccountType = 'Savings';

SELECT * FROM Accounts
WHERE Balance >= 30000 && AccountType = 'Savings' ; -- use AND o && in Syntax 

select * from customers;
select * from Accounts;
select * from branches;
select * from loans;
select * from transactions;