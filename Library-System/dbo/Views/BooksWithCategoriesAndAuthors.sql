CREATE VIEW BooksWithCategoriesAndAuthors AS
SELECT 
    b.BookId,
    b.Title,
    b.ISBN,
    b.Quantity,
    b.Description,
    c.Name AS CategoryName,
    a.Name AS AuthorName
FROM 
    Books b
JOIN 
    Categories c ON b.CategoryId = c.CategoryId
JOIN 
    BookAuthors ba ON b.BookId = ba.BookId
JOIN 
    Authors a ON ba.AuthorId = a.AuthorId;