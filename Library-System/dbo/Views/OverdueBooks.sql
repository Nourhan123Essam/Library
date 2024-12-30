CREATE VIEW OverdueBooks AS
SELECT 
    co.CheckoutId,
    r.Name AS ReaderName,
    b.Title AS BookTitle,
    co.DueDate,
    DATEDIFF(DAY, co.DueDate, GETDATE()) AS OverdueDays
FROM 
    Checkouts co
INNER JOIN Readers r ON co.ReaderId = r.ReaderId
INNER JOIN CheckedBooks cb ON  cb.CheckoutId = co.CheckoutId
INNER JOIN Books b ON cb.BookId = b.BookId
WHERE 
    co.DueDate < GETDATE() AND co.ReturnDate IS NULL;