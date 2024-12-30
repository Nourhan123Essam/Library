CREATE PROCEDURE GetBooksByCategory
    @CategoryId INT
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
    WHERE 
        b.CategoryId = @CategoryId;
END;