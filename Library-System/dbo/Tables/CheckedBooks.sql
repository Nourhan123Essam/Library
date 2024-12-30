CREATE TABLE [dbo].[CheckedBooks] (
    [CheckedBookId] INT IDENTITY (1, 1) NOT NULL,
    [CheckoutId]    INT NOT NULL,
    [BookId]        INT NOT NULL,
    [Quantity]      INT NULL,
    PRIMARY KEY CLUSTERED ([CheckedBookId] ASC),
    CHECK ([Quantity]>(0)),
    CONSTRAINT [FK_CheckedBooks_Books] FOREIGN KEY ([BookId]) REFERENCES [dbo].[Books] ([BookId]) ON DELETE CASCADE,
    CONSTRAINT [FK_CheckedBooks_Checkouts] FOREIGN KEY ([CheckoutId]) REFERENCES [dbo].[Checkouts] ([CheckoutId]) ON DELETE CASCADE
);




GO
CREATE   TRIGGER ConstrainsForCheckoutBooks
ON [dbo].[CheckedBooks]
AFTER INSERT
AS
BEGIN
	DECLARE @quantity INT = (SELECT [Quantity] FROM inserted);
	DECLARE @stockQuantity INT = (SELECT B.Quantity FROM inserted i INNER JOIN Books b ON b.BookId = i.BookId);

    IF (@quantity >= 3 OR @stockQuantity < @quantity)
    BEGIN
        SELECT('You have exceeded the number of allowed borrowed books');
        ROLLBACK TRANSACTION;
    END
END
GO
CREATE TRIGGER UpdateBookStock
ON [dbo].[CheckedBooks]
AFTER INSERT, DELETE
AS
BEGIN
    -- Update stock after checkout
    IF EXISTS (SELECT 1 FROM Inserted)
    BEGIN
        UPDATE Books
        SET Quantity = Quantity - (SELECT Quantity FROM Inserted)
        WHERE BookId IN (SELECT BookId FROM Inserted);
    END;

    -- Update stock after return
    IF EXISTS (SELECT 1 FROM Deleted)
    BEGIN
        UPDATE Books
        SET Quantity = Quantity + (SELECT Quantity FROM Inserted)
        WHERE BookId IN (SELECT BookId FROM Deleted);
    END;
END;