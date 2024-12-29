

CREATE FUNCTION CalculateOverdueDays (@CheckoutId INT)
RETURNS INT
AS
BEGIN
    DECLARE @DueDate DATETIME2, @ReturnDate DATETIME2, @OverdueDays INT;
    SELECT @DueDate = DueDate, @ReturnDate = ReturnDate
    FROM Checkouts WHERE CheckoutId = @CheckoutId;
    
    IF @ReturnDate IS NULL
        SET @OverdueDays = DATEDIFF(DAY, @DueDate, GETDATE());
    ELSE
        SET @OverdueDays = DATEDIFF(DAY, @DueDate, @ReturnDate);
    
    RETURN CASE WHEN @OverdueDays > 0 THEN @OverdueDays ELSE 0 END;
END;