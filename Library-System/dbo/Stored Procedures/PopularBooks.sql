-- Example: View to get popular books by checkout frequency
CREATE PROCEDURE PopularBooks AS
BEGIN
	SELECT Books.BookId, Books.Title, COUNT(CheckedBooks.BookId) AS CheckoutCount
	FROM Books
	JOIN CheckedBooks ON Books.BookId = CheckedBooks.BookId
	GROUP BY Books.BookId, Books.Title
	ORDER BY CheckoutCount DESC
END;