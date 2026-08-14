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

SELECT FirstName, LastName, MobileNo
FROM Customers
WHERE MobileNo IN ('7884455112','7418529630','9322241286');

SELECT CustomerID, AccountType, Balance
FROM Accounts
WHERE Balance BETWEEN 30000 and 75000; 

-- like operatior
-- find all customers whose first name starts wit 'r'
-- % matches any number of characters
SELECT * FROM Customers
WHERE FirstName LIKE 'R%';

-- last name ending with 'a'

SELECT * FROM Customers
WHERE LastName LIKE '%A';

-- "_" matchers exactly one character
-- find all customers whose last name has exactly 3 characters
SELECT * FROM Customers
WHERE LastName LIKE '_____';

-- ORDDER BY clause
-- sort the accounts table according to cusomters balance
SELECT CustomerId,Balance
FROM Accounts
ORDER BY balance;

-- sort the branches table according to branch name
SELECT BranchID, BranchName
FROM Branches
ORDER BY BranchName;

-- sort the accounts table according to cusomters balance highest to lowest
SELECT CustomerID, Balance
FROM Accounts
ORDER BY Balance DESC;

-- Sort According to multiple colummns
-- Sort Accounts table according the accounttype and balance
SELECT AccountID, AccountType, Balance, CustomerID
FROM Accounts
ORDER BY AccountType DESC, Balance DESC;

-- DISTINCT clause
-- Find distinct(unique) account types from accounts
select DISTINCT AccountType From Accounts;

-- Find distinct(unique) transactions types from transactions
SELECT DISTINCT TransactionType FROM Transactions;
SELECT DISTINCT TransactionType,accountid from Transactions;


select * from customers;
select * from Accounts;
select * from branches;
select * from loans;
select * from transactions;

select * from customers
LIMIT 3 OFFSET 2;

SELECT * FROM Accounts
LIMIT 2 OFFSET 3;

SELECT * FROM Accounts
ORDER BY Balance DESC
LIMIT 1 offset 2;

SELECT * FROM Accounts
LIMIT 2,1; -- here 2 specifies the rows to skip and 1 specifies the no of rows to return

INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, MobileNo, AccountCreationDate, DateOfBirth) 
VALUES
(106,'Priya', 'Patil', 'priya@gmail.com',NULL, '2025-03-15','1999-04-18'),
(107,'Amit', 'Verma', 'amit@gmail.com',9875000064, '2024-09-25','1995-01-08'),
(108,'Prathmesh', 'Lokhande', 'prathmesh@gmail.com',NULL, '2023-12-05','1996-05-28');

INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, MobileNo, AccountCreationDate, DateOfBirth) 
VALUES
(109,'Samiksha', 'Kale', 'samiksha@gmail.com',7889944445, '2021-02-03','1999-07-09'),
(110,'Krinshna', 'Korde', 'krishna@gmail.com',9875000064, '2019-10-12','2001-11-14');

SELECT * FROM Customers
WHERE MobileNo IS NULL;

INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
Values
(206,106,'Current',5000),
(207,107,'Current',15000),
(208,108,'Savings',80000),
(209,109,'Current',95000),
(210,110,'Savings',78000);

INSERT INTO Loans
(LoanID, LoanAmount, InterestRate, StartDate, EndDate, CustommerID)
VALUES
(306,40000,7.95,'2024-05-01','2026-010-31',110),
(307,99000,8.15,'2025-04-01','2027-08-30',106),
(308,75000,9.25,'2023-03-01','2026-03-30',108),
(309,45000,7,'2022-07-01','2028-03-31',107),
(310,48000,9,'2026-03-01','2026-10-30',109);

INSERT INTO Transactions
VALUES
(6,'2026-01-10',5000,'Deposit',206),
(7,'2025-10-05',10000,'Withdrawl',207),
(8,'2026-04-19',15000,'Deposit',208),
(9,'2023-06-01',25000,'Withdrawl',209),
(10,'2026-12-10',15000,'Deposit',210);

UPDATE Transactions 
SET 
    TransactionType = 'Withdrawl'
WHERE
    TransactionType = 'Return';

SELECT 
    AccountID,
    CustomerID,
    Balance,
    CASE
        WHEN Balance >= 50000 THEN 'High Value Customer'
        ELSE 'Low Value Customer'
    END AS Customer_value
FROM
    Accounts;
    
-- Categorize the deposit in the transactions table as per conditons given
-- if above 10000(included) high amount
-- if 5000 to 10000 medium amount
-- if upto 5000 low amount
-- for transaction type withdrawal "Not Applicable"

SELECT 
    TransactionID,
    Amount,
    AccountID,
    TransactionType,
    CASE
        WHEN TransactionType <> 'Deposit' THEN 'Not Applicable'
        WHEN Amount >= 10000 THEN 'High Amount'
        WHEN Amount >= 5000 THEN 'Medium Amount'
        ELSE 'Low Amount'
    END AS 'TransactionsCategory'
FROM
    Transactions;

SELECT CustomerID, UPPER(FirstName), UPPER(LastName) FROM Customers;
SELECT CustomerID, LOWER(FirstName), LOWER(LastName) FROM Customers; 

SELECT CustomerID,LastName, LENGTH(LastName) From Customers;

SELECT length("Nashik") AS "NoOfCharacters"; -- gives o/p in number of bytes
SELECT length("नाशिक"); -- gives o/p in number of bytes
SELECT char_length("NASHIK"); -- gives o/p in number of characters
SELECT char_length("नाशिक"); -- gives o/p in number of characters

SELECT CustomerID, CONCAT(FirstName," ", LastName) as "FullName", MobileNo FROM Customers;

SELECT CustomerID, CONCAT(substring(FirstName,1,1),".",LastName) As 'FullName', MobileNo from Customers;

-- Trim() Function
select length("  Hello World   ");
select length(trim("  Hello World   "));
select length(trim(substring("Hello World",6)));

-- Replace() function
select replace("Mat mat Mat","M","H");

-- abs() function
select abs(-6546);

-- avg() function
SELECT 
    AVG(Balance)
FROM
    accounts
WHERE
    AccountType = 'Savings';

-- round() function    
SELECT 
    ROUND(AVG(Balance),2)
FROM
    accounts
WHERE
    AccountType = 'Savings';

-- ceil() or ceiling() function
SELECT 
    ceil(ROUND(AVG(Balance),2))
FROM
    accounts
WHERE
    AccountType = 'Savings';
    
-- floor() function
SELECT 
    FLOOR(ROUND(AVG(Balance),2))
FROM
    accounts
WHERE
    AccountType = 'Savings';

SELECT 
    FLOOR(ROUND(AVG(Amount),2))
FROM
    Transactions
WHERE
    TransactionType = 'Deposit';

-- MOD value
select (7/3);
select 7 mod 3;

-- power()
select power(2,3);
select power(1.2,4);

-- sqrt()
select sqrt(121);

-- Date Functions
-- NOW() Functions
select NOW();

-- CURDATE() Function
select CURDATE();

-- CURTIME() Function
select CURTIME();

-- YEAR() MONTH() DAY()
SELECT 
    CustomerID,
    DateOfBirth,
    YEAR(DateOfBirth),
    MONTH(DateOfBirth),
    DAY(DateOfBirth)
FROM
    Customers;

-- datediff() function    
SELECT
	CONCAT(FirstName," ",LastName) as FullName,
    DateOfBirth,
    FLOOR(DATEDIFF(CURDATE(), DateOfBirth) / 365) as Age
FROM
	Customers;
    
-- DATE_ADD() function
SELECT
	CONCAT(FirstName," ",LastName) as FullName,
    AccountCreationDate,
    DATE_ADD(AccountCreationDate, INTERVAL 1 Year) as KYCRenewal
FROM
	Customers;
    
-- count() function
SELECT * FROM Customers;
SELECT COUNT(*) as TotalCustomers from Customers;
SELECT COUNT(MobileNo) as TotalCustomers from Customers;

-- sum() function
SELECT * FROM Accounts;
select sum(Balance) as TotalBalance from Accounts;
select sum(Balance) as SavingsBalance FROM Accounts
WHERE AccountType = 'Savings';
select sum(Balance) as CurrentBalance FROM Accounts
WHERE AccountType = 'Current';

-- avg() function
select * from transactions;
select avg(Amount) from Transactions;
select avg(Amount) as AvgDepositTransaction from Transactions
WHERE TransactionType = 'Deposit';
select avg(Amount) as AvgWithdrawlTransaction from Transactions
WHERE TransactionType = 'Withdrawl';

-- max() and min() function
-- find maximum balance available in savings account
-- find minimum balance available in savings account
select * from Accounts;
SELECT MAX(Balance) From Accounts
WHERE AccountType = 'Savings';
SELECT MIN(Balance) From Accounts
WHERE AccountType = 'Savings';

-- groupby() function
select * from transactions;
SELECT TransactionType, SUM(Amount) FROM Transactions
GROUP BY (TransactionType); 

select * from accounts;
SELECT 
    AccountType, 
    COUNT(*) AS TotalAccounts,
    sum(Balance) AS TotalBalance,
    Avg(Balance) AS avgBalance
FROM
    Accounts
GROUP BY (AccountType); 

-- Find total accounts for brnach and accounttype
SELECT BranchID, AccountType, Count(*) AS TotalAccounts
FROM Accounts
GROUP BY AccountType ,BranchID
order by BranchID;

-- having clause
SELECT BranchID, AccountType, Count(*) AS TotalAccounts
FROM Accounts
GROUP BY AccountType ,BranchID
HAVING TotalAccounts >=2 AND AccountType = 'Savings';

SELECT * from customers;

SELECT YEAR(AccountCreationDate) AS CreatedYear, Count(*) AS TotalAccounts
From Customers
GROUP BY YEAR(AccountCreationDate)
ORDER BY CreatedYear;