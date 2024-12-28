-- (Many-to-Many Relationship)
CREATE TABLE BookAuthors (
    BookId INT NOT NULL,
    AuthorId INT NOT NULL,
    PRIMARY KEY (BookId, AuthorId),
    CONSTRAINT FK_BookAuthors_Books FOREIGN KEY (BookId) REFERENCES Books(BookId),
    CONSTRAINT FK_BookAuthors_Authors FOREIGN KEY (AuthorId) REFERENCES Authors(AuthorId)
);