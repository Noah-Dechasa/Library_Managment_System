
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
