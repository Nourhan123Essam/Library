CREATE PROCEDURE MostCheckedOutBooks 
AS
BEGIN
	SELECT 
		b.BookId,
		b.Title AS BookTitle,
		COUNT(cb.CheckedBookId) AS TotalCheckouts
	FROM 
		Books b
	INNER JOIN CheckedBooks cb ON b.BookId = cb.BookId
	GROUP BY 
		b.BookId, b.Title
	ORDER BY 
		TotalCheckouts DESC
END;