CREATE PROCEDURE GetBookByAuthor
    @AuthorId INT
AS
BEGIN
    SELECT 
        b.BookId,
        b.Title,
        b.ISBN,
        b.Quantity,
        b.Description
    FROM 
        Books b
    JOIN 
        BookAuthors ba ON b.BookId = ba.BookId
    WHERE 
        ba.AuthorId = @AuthorId;
END;