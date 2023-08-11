-- Drop tables if they already exist
DROP TABLE IF EXISTS Book;
DROP TABLE IF EXISTS Author;
DROP TABLE IF EXISTS Category;
DROP TABLE IF EXISTS Publisher;


-- Create Publisher table
CREATE TABLE Publisher (
    PID INT PRIMARY KEY,
    Publisher VARCHAR(255) UNIQUE NOT NULL
);

-- Create Category table
CREATE TABLE Category (
    CID INT PRIMARY KEY,
    Category VARCHAR(255) UNIQUE NOT NULL
);

-- Create Author table
CREATE TABLE Author (
    AID INT PRIMARY KEY,
    Author VARCHAR(255) UNIQUE NOT NULL
);

-- Create Book table
CREATE TABLE Book (
    BID INT PRIMARY KEY,
    BName VARCHAR(255),
    BPrice DECIMAL(10, 2),
    Author INT,
    Publisher INT,
    Category INT,
    FOREIGN KEY (Author) REFERENCES Author(AID),
    FOREIGN KEY (Publisher) REFERENCES Publisher(PID),
    FOREIGN KEY (Category) REFERENCES Category(CID)
);

-- Insert records in Category table
INSERT INTO Category (CID, Category) VALUES(1, 'Fiction'),(2, 'Mystery'),(3, 'Romance');
--SELECT * FROM Category

-- Insert records in Author table
INSERT INTO Author (AID, Author) VALUES(1, 'John Doe'),(2, 'Jane Smith'),(3, 'Michael Johnson');
--SELECT * FROM Author

-- Insert records in Publisher table
INSERT INTO Publisher (PID, Publisher) VALUES
(1, 'Publisher 1'),
(2, 'Publisher 2'),
(3, 'Publisher 3');


-- Insert records in Book table
INSERT INTO Book (BID, BName, BPrice, Author, Publisher, Category) VALUES
(1, 'Book 1', 9.99, 1, 1, 1),
(2, 'Book 2', 14.99, 2, 2, 2),
(3, 'Book 3', 12.99, 3, 3, 3),
(4, 'Book 4', 8.99, 1, 1, 2),
(5, 'Book 5', 11.99, 2, 2, 3),
(6, 'Book 6', 10.99, 3, 3, 1);


-- Retrieve the details from Book table
SELECT Book.BID, Book.BName, Book.BPrice, Author.Author, Publisher.Publisher, Category.Category
FROM Book
JOIN Author ON Book.Author = Author.AID
JOIN Publisher ON Book.Publisher = Publisher.PID
JOIN Category ON Book.Category = Category.CID;








---select e.Id,e.Fname+''+e.Lname 'Full Name', d.DName 'Department',d.DId, e.Salary, e.Designation
---from Emps5 e join Depts d on e.DId=d.DId



