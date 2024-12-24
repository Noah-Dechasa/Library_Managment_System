DROP DATABASE IF EXISTS librarymanagementsystem;
-- Step 1: Created the Library Management Database
CREATE DATABASE librarymanagementsystem;
USE librarymanagementsystem;

-- Step 2: Created the Authors Table
CREATE TABLE Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100),
    Nationality VARCHAR(50)
);

-- Step 3: Created the Books Table
DROP TABLE IF EXISTS Books;
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    ISBN VARCHAR(13) UNIQUE NOT NULL,
    AuthorID INT NOT NULL,
    Publisher VARCHAR(50),
    PublicationYear INT,
    Genre VARCHAR(50),
    Status ENUM('Available', 'Checked Out') DEFAULT 'Available',
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);


-- Step 4: Created the Patrons Table
-- Patrons Table with Trigger for MembershipDate
CREATE TABLE Patrons (
    PatronID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100),
    BirthDate DATE,
    MembershipDate DATE
);

DELIMITER //
CREATE TRIGGER SetMembershipDate
BEFORE INSERT ON Patrons
FOR EACH ROW
BEGIN
    IF NEW.MembershipDate IS NULL THEN
        SET NEW.MembershipDate = CURDATE();
    END IF;
END;
//
DELIMITER ;

-- Librarians Table with Trigger for HireDate
CREATE TABLE Librarians (
    WorkerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100),
    Position VARCHAR(50),
    HireDate DATE
);

DELIMITER //
CREATE TRIGGER SetHireDate
BEFORE INSERT ON Librarians
FOR EACH ROW
BEGIN
    IF NEW.HireDate IS NULL THEN
        SET NEW.HireDate = CURDATE();
    END IF;
END;
//
DELIMITER ;

-- Transactions Table with Trigger for DateOut
CREATE TABLE Transactions (
    TransactionID INT AUTO_INCREMENT PRIMARY KEY,
    BookID INT NOT NULL,
    PatronID INT NOT NULL,
    WorkerID INT NOT NULL,
    DueDate DATE NOT NULL,
    DateOut DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (PatronID) REFERENCES Patrons(PatronID),
    FOREIGN KEY (WorkerID) REFERENCES Librarians(WorkerID)
);

DELIMITER //
CREATE TRIGGER SetDateOut
BEFORE INSERT ON Transactions
FOR EACH ROW
BEGIN
    IF NEW.DateOut IS NULL THEN
        SET NEW.DateOut = CURDATE();
    END IF;
END;
//
DELIMITER ;


-- Step 7: Created the Fines Table
-- Created the Fines table without DEFAULT CURRENT_DATE
CREATE TABLE Fines (
    FineID INT AUTO_INCREMENT PRIMARY KEY,
    PatronID INT NOT NULL,
    TransactionID INT NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    DateAssessed DATE,
    DatePaid DATE,
    FOREIGN KEY (PatronID) REFERENCES Patrons(PatronID),
    FOREIGN KEY (TransactionID) REFERENCES Transactions(TransactionID)
);

-- Created a trigger to set the current date for DateAssessed
DELIMITER //
CREATE TRIGGER SetDateAssessed
BEFORE INSERT ON Fines
FOR EACH ROW
BEGIN
    IF NEW.DateAssessed IS NULL THEN
        SET NEW.DateAssessed = CURDATE();
    END IF;
END;
//
DELIMITER ;

--  Sample Data into Authors Table
INSERT INTO Authors (FirstName, LastName, Email, Nationality)
VALUES
('J.K.', 'Rowling', 'jk.rowling@example.com', 'British'),
('George', 'Orwell', 'george.orwell@example.com', 'British'),
('Jane', 'Austen', 'jane.austen@example.com', 'British'),
('Mark', 'Twain', 'mark.twain@example.com', 'American'),
('Agatha', 'Christie', 'agatha.christie@example.com', 'British'),
('F. Scott', 'Fitzgerald', 'f.scott.fitzgerald@example.com', 'American'),
('Ernest', 'Hemingway', 'ernest.hemingway@example.com', 'American'),
('Mary', 'Shelley', 'mary.shelley@example.com', 'British');

--  Sample Data into Books Table
INSERT INTO Books (Title, ISBN, AuthorID, Publisher, PublicationYear, Genre, Status)
VALUES
('Harry Potter and the Philosopher\'s Stone', '9780747532743', 1, 'Bloomsbury', 1997, 'Fantasy', 'Available'),
('1984', '9780451524935', 2, 'Secker & Warburg', 1949, 'Dystopian', 'Available'),
('Pride and Prejudice', '9780141439518', 3, 'T. Egerton', 1813, 'Romance', 'Checked Out'),
('Adventures of Huckleberry Finn', '9780486280615', 4, 'Charles L. Webster and Company', 1884, 'Adventure', 'Available'),
('Murder on the Orient Express', '9780007119318', 5, 'HarperCollins', 1934, 'Mystery', 'Available'),
('The Great Gatsby', '9780743273565', 6, 'Scribner', 1925, 'Classic', 'Checked Out'),
('The Old Man and the Sea', '9780684830490', 7, 'Charles Scribner\'s Sons', 1952, 'Fiction', 'Available'),
('Frankenstein', '9780486282114', 8, 'Lackington, Hughes, Harding, Mavor & Jones', 1818, 'Horror', 'Available'),
('The Catcher in the Rye', '9780316769488', 6, 'Little, Brown and Company', 1951, 'Classic', 'Checked Out'),
('To Kill a Mockingbird', '9780060935467', 7, 'J.B. Lippincott & Co.', 1960, 'Classic', 'Available');


--  Sample Data into Patrons Table
INSERT INTO Patrons (FirstName, LastName, Email, BirthDate, MembershipDate)
VALUES
('John', 'Doe', 'john.doe@example.com', '1990-05-15', '2020-01-10'),
('Jane', 'Smith', 'jane.smith@example.com', '1985-10-25', '2019-03-14'),
('Alice', 'Johnson', 'alice.johnson@example.com', '2000-07-20', '2021-05-30'),
('Michael', 'Brown', 'michael.brown@example.com', '1992-04-18', '2018-06-12'),
('Emily', 'Clark', 'emily.clark@example.com', '1988-11-22', '2020-02-20'),
('Daniel', 'Garcia', 'daniel.garcia@example.com', '1995-09-05', '2019-10-15'),
('Sarah', 'Lopez', 'sarah.lopez@example.com', '1999-01-30', '2021-07-08'),
('Laura', 'Martinez', 'laura.martinez@example.com', '2001-12-17', '2022-03-25');

--  Sample Data into Librarians Table
INSERT INTO Librarians (FirstName, LastName, Email, Position, HireDate)
VALUES
('Emma', 'Brown', 'emma.brown@example.com', 'Senior Librarian', '2015-08-01'),
('Oliver', 'Jones', 'oliver.jones@example.com', 'Junior Librarian', '2020-06-15'),
('Sophia', 'Williams', 'sophia.williams@example.com', 'Assistant Librarian', '2019-09-01'),
('James', 'Taylor', 'james.taylor@example.com', 'Librarian', '2021-03-15'),
('Mia', 'Davis', 'mia.davis@example.com', 'Head Librarian', '2017-12-01');

--  Sample Data into Transactions Table
INSERT INTO Transactions (BookID, PatronID, WorkerID, DueDate, DateOut, ReturnDate)
VALUES
(3, 1, 1, '2024-11-15', '2024-11-01', NULL), -- Checked out and not yet returned
(2, 2, 2, '2024-10-20', '2024-10-05', '2024-10-19'), -- Checked out and returned
(4, 3, 1, '2024-12-01', '2024-11-15', NULL), -- Currently checked out
(1, 4, 3, '2024-12-05', '2024-11-20', NULL), -- Currently checked out
(6, 2, 1, '2024-11-25', '2024-11-10', NULL), -- Currently checked out
(3, 5, 2, '2024-11-18', '2024-11-01', '2024-11-15'), -- Returned
(7, 1, 3, '2024-11-30', '2024-11-15', NULL), -- Currently checked out
(2, 3, 1, '2024-11-20', '2024-11-05', NULL), -- Currently overdue
(8, 5, 2, '2024-12-10', '2024-11-25', NULL); -- Currently checked out

--  Sample Data into Fines Table
INSERT INTO Fines (PatronID, TransactionID, Amount, DateAssessed, DatePaid)
VALUES
(1, 1, 5.00, '2024-11-20', NULL), -- Fine not yet paid
(2, 2, 2.50, '2024-10-25', '2024-11-01'), -- Fine paid
(3, 5, 10.00, '2024-11-21', NULL), -- Fine not yet paid
(5, 6, 15.00, '2024-11-30', NULL), -- Fine not yet paid
(4, 1, 7.50, '2024-11-20', '2024-11-25'), -- Fine paid
(2, 2, 12.00, '2024-11-15', NULL); -- Fine not yet paid

-------------------------------------------------------------------------------------------------------------------------------------

-- View 1: Available Books
-- Purpose: Lists all books currently available for borrowing.
-- This view filters books with a status of 'Available', helping librarians and patrons quickly access inventory.
CREATE VIEW AvailableBooks AS
SELECT 
    B.BookID, 
    B.Title, 
    CONCAT(A.FirstName, ' ', A.LastName) AS Author, 
    B.Genre, 
    B.PublicationYear, 
    B.Status
FROM 
    Books B
JOIN 
    Authors A ON B.AuthorID = A.AuthorID
WHERE 
    B.Status = 'Available';

-- View 2: Overdue Transactions
-- Purpose: Displays overdue transactions with patron and book details.
-- This view identifies overdue books and calculates how many days a book is overdue, assisting librarians in managing returns and notifications.
CREATE VIEW OverdueTransactions AS
SELECT 
    T.TransactionID, 
    P.FirstName, 
    P.LastName, 
    B.Title, 
    T.DueDate, 
    DATEDIFF(CURDATE(), T.DueDate) AS OverdueDays
FROM 
    Transactions T
JOIN 
    Patrons P ON T.PatronID = P.PatronID
JOIN 
    Books B ON T.BookID = B.BookID
WHERE 
    T.DueDate < CURDATE() AND T.ReturnDate IS NULL;

-- View 3: Total Fines Owed
-- Purpose: Calculates the total fines owed by each patron.
-- This view aggregates unpaid fines for each patron, enabling the library to track outstanding payments and take necessary actions.
CREATE VIEW TotalFinesOwed AS
SELECT 
    P.PatronID, 
    P.FirstName, 
    P.LastName, 
    SUM(F.Amount) AS TotalFines
FROM 
    Patrons P
JOIN 
    Fines F ON P.PatronID = F.PatronID
WHERE 
    F.DatePaid IS NULL
GROUP BY 
    P.PatronID;

-- View 4: Genre Borrowing Trends
-- Purpose: Shows borrowing trends by genre.
-- This view counts the number of times books in each genre have been borrowed, providing insights into user preferences for inventory planning.
CREATE VIEW GenreBorrowingTrends AS
SELECT 
    B.Genre, 
    COUNT(T.TransactionID) AS BorrowedCount
FROM 
    Transactions T
JOIN 
    Books B ON T.BookID = B.BookID
GROUP BY 
    B.Genre
ORDER BY 
    BorrowedCount DESC;







