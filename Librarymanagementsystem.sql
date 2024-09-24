--Library management System project
create database librarymanagementsystem

use librarymanagementsystem

create table bookstable(BookID int primary key identity(1,1),Title varchar(40),
Author varchar(50),PublishedYear varchar(50),Publisher varchar(50),AvailableCopies int)

create table Authordetails(AuthorID int primary key identity(1,1),AuthorName varchar(50),Bio varchar(200))

create table student (UserID  int primary key identity(1,1),Username varchar(50),Password varchar(10),
	FullName varchar(50),Email varchar(50),Address varchar(50),Phone varchar(50))

create table Transactions (TransactionID int primary key identity(1,1),UserID  int,BookID int,
CheckoutDate  date,ReturnDate date,ActualReturnDate date,FineAmount money)

SELECT * FROM bookstable;

INSERT INTO bookstable (Title, Author, PublishedYear, Publisher, AvailableCopies)
VALUES
    ('Python', 'Author 1', 2020, 'Publisher A', 5),
    ('Java', 'Author 2', 2019, 'Publisher B', 3),
    ('SQL', 'Author 3', 2018, 'Publisher C', 7),
    ('Book Title 4', 'Author 4', 2021, 'Publisher D', 2),
    ('Book Title 5', 'Author 5', 2017, 'Publisher E', 4),
    ('Book Title 6', 'Author 6', 2016, 'Publisher F', 6),
    ('Book Title 7', 'Author 7', 2022, 'Publisher G', 1),
    ('Book Title 8', 'Author 8', 2015, 'Publisher H', 8),
    ('Book Title 9', 'Author 9', 2023, 'Publisher I', 3),
    ('Book Title 10', 'Author 10', 2014, 'Publisher J', 5),
    ('Book Title 11', 'Author 11', 2024, 'Publisher K', 2),
    ('Book Title 12', 'Author 12', 2013, 'Publisher L', 6),
    ('Book Title 13', 'Author 13', 2025, 'Publisher M', 4),
    ('Book Title 14', 'Author 14', 2012, 'Publisher N', 7),
    ('Book Title 15', 'Author 15', 2026, 'Publisher O', 1),
    ('Book Title 16', 'Author 16', 2011, 'Publisher P', 9),
    ('Book Title 17', 'Author 17', 2027, 'Publisher Q', 2),
    ('Book Title 18', 'Author 18', 2010, 'Publisher R', 4),
    ('Book Title 19', 'Author 19', 2028, 'Publisher S', 6),
    ('Book Title 20', 'Author 20', 2009, 'Publisher T', 3);

--Retrieve all books:
select * from bookstable

--Retrieve available books:
SELECT * FROM bookstable WHERE AvailableCopies > 0;

--Retrieve books by a specific author:
SELECT * FROM bookstable WHERE Author = 'Author 6';


--Retrieve data from author table:
select * from Authordetails

--Insert into author details table
INSERT INTO Authordetails (AuthorName, Bio)
VALUES
    ('Author 1', 'Bio 1 for Author X'),
    ('Author 2', 'Bio 2 for Author X'),
    ('Author 3', 'Bio 3 for Author X'),
    ('Author 4', 'Bio 4 for Author X'),
    ('Author 5', 'Bio 5 for Author X'),
    ('Author 6', 'Bio 6 for Author X'),
    ('Author 7', 'Bio 7 for Author X'),
    ('Author 8', 'Bio 8 for Author X'),
    ('Author 9', 'Bio 9 for Author X'),
    ('Author 10', 'Bio 10 for Author X'),
    ('Author 11', 'Bio 11 for Author X'),
    ('Author 12', 'Bio 12 for Author X'),
    ('Author 13', 'Bio 13 for Author X'),
    ('Author 14', 'Bio 14 for Author X'),
    ('Author 15', 'Bio 15 for Author X'),
    ('Author 16', 'Bio 16 for Author X'),
    ('Author 17', 'Bio 17 for Author X'),
    ('Author 18', 'Bio 18 for Author X'),
    ('Author 19', 'Bio 19 for Author X'),
    ('Author 20', 'Bio 20 for Author X');


--Insert into student table(students who issue the books) 
INSERT INTO student (Username, Password, FullName, Email, Address, Phone)
VALUES
    ('user1', 'password1', 'John Doe', 'john.doe@example.com', '123 Main St, City A', 1234567890),
    ('user2', 'password2', 'Jane Smith', 'jane.smith@example.com', '456 Oak Ave, City B', 2345678901),
    ('user3', 'password3', 'Michael Johnson', 'michael.johnson@example.com', '789 Elm Blvd, City C', 3456789012),
    ('user4', 'password4', 'Emily Brown', 'emily.brown@example.com', '567 Pine Ln, City D', 4567890123),
    ('user5', 'password5', 'Christopher Wilson', 'christopher.wilson@example.com', '890 Cedar Rd, City E', 5678901234),
    ('user6', 'password6', 'Sarah Martinez', 'sarah.martinez@example.com', '234 Birch Dr, City F', 6789012345),
    ('user7', 'password7', 'David Anderson', 'david.anderson@example.com', '901 Maple Ct, City G', 7890123456),
    ('user8', 'password8', 'Jessica Garcia', 'jessica.garcia@example.com', '345 Palm Ave, City H', 8901234567),
    ('user9', 'password9', 'Daniel Hernandez', 'daniel.hernandez@example.com', '678 Willow Pl, City I', 9012345678),
    ('user10', 'password10', 'Lisa Thompson', 'lisa.thompson@example.com', '123 Pineapple Cir, City J', 0123456789);


--select the student table
select * from student

--Retrieve books borrowed by a user:

SELECT * 
FROM bookstable 
INNER JOIN Transactions ON bookstable.BookID = Transactions.BookID 
WHERE Transactions.UserID = '1';

select * from Transactions

-- Insert a new transaction (checkout)
INSERT INTO Transactions (UserID, BookID, CheckoutDate, ReturnDate)
VALUES ('4', '8', '2024-07-01', '2024-07-05');

-- Update transaction (return book)
UPDATE Transactions 
SET ActualReturnDate = '2024-07-11', FineAmount = 200 
WHERE TransactionID = 6;

-- Calculate fine for overdue books
SELECT DATEDIFF(DAY, ReturnDate, ActualReturnDate) * FineAmount AS FineAmount 
FROM Transactions 
WHERE ActualReturnDate > ReturnDate;






