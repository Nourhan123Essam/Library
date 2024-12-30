CREATE VIEW BooksByPublisher AS
SELECT 
    p.PublisherId,
    p.Name AS PublisherName,
    b.BookId,
    b.Title AS BookTitle,
    bp.PublishYear
FROM 
    Publishers p
INNER JOIN BookPublishers bp ON p.PublisherId = bp.PublisherId
INNER JOIN Books b ON bp.BookId = b.BookId;