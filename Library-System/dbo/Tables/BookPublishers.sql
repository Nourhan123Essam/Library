-- (Many-to-Many Relationship)

CREATE TABLE BookPublishers (
    BookId INT NOT NULL,
    PublisherId INT NOT NULL,
    PublishYear INT NOT NULL,
    PRIMARY KEY (BookId, PublisherId),
    CONSTRAINT FK_BookPublishers_Books FOREIGN KEY (BookId) REFERENCES Books(BookId),
    CONSTRAINT FK_BookPublishers_Publishers FOREIGN KEY (PublisherId) REFERENCES Publishers(PublisherId)
);