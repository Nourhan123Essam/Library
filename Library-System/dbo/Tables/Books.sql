CREATE TABLE Books (
    BookId INT IDENTITY(1,1) PRIMARY KEY,
    Title NVARCHAR(200) NOT NULL,
    ISBN NVARCHAR(13) UNIQUE NOT NULL,
    Quantity INT CHECK (Quantity >= 0),
    CategoryId INT NOT NULL,
    Description NVARCHAR(MAX),
    CONSTRAINT FK_Books_Categories FOREIGN KEY (CategoryId) REFERENCES Categories(CategoryId) ON DELETE CASCADE,
);