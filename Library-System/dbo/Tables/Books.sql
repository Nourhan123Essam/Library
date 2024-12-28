CREATE TABLE Books (
    BookId INT IDENTITY(1,1) PRIMARY KEY,
    Title NVARCHAR(200) NOT NULL,
    ISBN NVARCHAR(13) UNIQUE NOT NULL,
    Quantity INT CHECK (Quantity >= 0),
    PublishedDate DATE,
    CategoryId INT NOT NULL,
    CONSTRAINT FK_Books_Categories FOREIGN KEY (CategoryId) REFERENCES Categories(CategoryId)
);