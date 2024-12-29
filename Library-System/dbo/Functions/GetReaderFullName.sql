CREATE FUNCTION GetReaderFullName (@ReaderId INT)
RETURNS NVARCHAR(255)
AS
BEGIN
    DECLARE @FullName NVARCHAR(255);
    SELECT @FullName = Name FROM Readers WHERE ReaderId = @ReaderId;
    RETURN @FullName;
END;