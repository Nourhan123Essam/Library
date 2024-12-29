CREATE PROCEDURE AddNewBook
    @Title NVARCHAR(255),
    @ISBN NVARCHAR(50),
    @CategoryId INT,
    @Quantity INT,
    @Description NVARCHAR(MAX)
AS
BEGIN
    INSERT INTO Books (Title, ISBN, CategoryId, Quantity, Description)
    VALUES (@Title, @ISBN, @CategoryId, @Quantity, @Description);
END;