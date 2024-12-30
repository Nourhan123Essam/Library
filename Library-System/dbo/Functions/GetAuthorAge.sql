-- Example: Function to calculate the age of an author
CREATE FUNCTION dbo.GetAuthorAge (@AuthorId INT)
RETURNS INT
AS
BEGIN
    DECLARE @Age INT;
    SELECT @Age = DATEDIFF(YEAR, BirthDate, GETDATE()) FROM Authors WHERE AuthorId = @AuthorId;
    RETURN @Age;
END;