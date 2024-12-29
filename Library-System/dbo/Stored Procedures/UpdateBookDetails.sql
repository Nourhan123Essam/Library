CREATE PROCEDURE UpdateBookDetails
    @BookId INT,
    @Title NVARCHAR(255),
    @ISBN NVARCHAR(50),
    @CategoryId INT,
    @Quantity INT,
    @Description NVARCHAR(MAX)
AS
BEGIN
    UPDATE Books
    SET Title = @Title,
        ISBN = @ISBN,
        CategoryId = @CategoryId,
        Quantity = @Quantity,
        Description = @Description
    WHERE BookId = @BookId;
END;