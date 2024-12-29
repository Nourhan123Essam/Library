CREATE VIEW BooksWithAuthorsAndPublishers AS
SELECT 
    b.BookId,
    b.Title,
    a.Name AS AuthorName,
    p.Name AS PublisherName
FROM Books b
LEFT JOIN BookAuthors ba ON b.BookId = ba.BookId
LEFT JOIN Authors a ON ba.AuthorId = a.AuthorId
LEFT JOIN BookPublishers bp ON b.BookId = bp.BookId
LEFT JOIN Publishers p ON bp.PublisherId = p.PublisherId;