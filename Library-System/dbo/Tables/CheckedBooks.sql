CREATE TABLE CheckedBooks (
    CheckedBookId INT IDENTITY(1,1) PRIMARY KEY,
    CheckoutId INT NOT NULL,
    BookId INT NOT NULL,
    Quantity INT CHECK (Quantity > 0),
    CONSTRAINT FK_CheckedBooks_Checkouts FOREIGN KEY (CheckoutId) REFERENCES Checkouts(CheckoutId) ON DELETE CASCADE,
    CONSTRAINT FK_CheckedBooks_Books FOREIGN KEY (BookId) REFERENCES Books(BookId)
);