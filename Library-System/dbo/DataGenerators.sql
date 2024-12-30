-- Generate data for Authors table
DECLARE @counter INT = 0;
WHILE @counter < 1000  -- Change 1000 to the number of records you want to insert
BEGIN
    INSERT INTO Authors (Name, Bio, BirthDate)
    VALUES 
    (CONCAT('Author ', @counter), 
    CONCAT('Bio of Author ', @counter),
    DATEADD(DAY, -RAND() * 10000, GETDATE()));  -- Random birthdate within the past 27 years

    SET @counter = @counter + 1;
END;

-- Generate data for Categories table
SET @counter = 0;
WHILE @counter < 10  -- Change 10 to the number of categories you want to insert
BEGIN
    INSERT INTO Categories (Name, Description)
    VALUES 
    (CONCAT('Category ', @counter),
	CONCAT('Description of Category ', @counter));  -- Random Category description
	;

    SET @counter = @counter + 1;
END;

-- Generate data for Books table with correct ISBN format
SET @counter = 0;
WHILE @counter < 1000 -- Number of records to insert
BEGIN
    -- Generate a random ISBN (13 characters, always valid format)
    DECLARE @ISBN VARCHAR(13);
    SET @ISBN = CONCAT('978-', FORMAT(ABS(CHECKSUM(NEWID())) % 1000000000, '0000000000'));

    -- If @ISBN is NULL or invalid, regenerate it
    IF @ISBN IS NULL OR LEN(@ISBN) <> 13
    BEGIN
        SET @ISBN = CONCAT('978-', FORMAT(ABS(CHECKSUM(NEWID())) % 1000000000, '0000000000'));
    END;

    -- Insert into Books table
    INSERT INTO Books (Title, ISBN, CategoryId, Quantity, Description)
    VALUES 
    (
        CONCAT('Book ', @counter),           -- Random book title
        @ISBN,                               -- Properly formatted ISBN
        FLOOR(RAND() * 10) + 1,              -- Random CategoryId (1 to 10)
        FLOOR(RAND() * 100) + 1,             -- Random Quantity (1 to 100)
        'This is a sample description.'      -- Static description
    );

    -- Increment the counter
    SET @counter = @counter + 1;
END;


-- Generate data for Readers table
SET @counter = 0;
WHILE @counter < 1000  -- Change 1000 to the number of records you want to insert
BEGIN
    INSERT INTO Readers (Name, Email, Address, Phone, CreatedAt)
    VALUES 
    (CONCAT('Name ', @counter), 
    CONCAT('reader', @counter, '@example.com'),
    CONCAT('Address ', @counter),
    CONCAT('123-456-', FLOOR(RAND() * 1000)), -- Random phone number
	GETDATE()
	);  

    SET @counter = @counter + 1;
END;

-- Generate data for Checkouts table
SET @counter = 0;
WHILE @counter < 1000  -- Change 1000 to the number of records you want to insert
BEGIN
    INSERT INTO Checkouts (ReaderId, CheckoutDate, DueDate, ReturnDate)
    VALUES 
    (FLOOR(RAND() * 1000) + 1,  -- Random ReaderId
    GETDATE(),
    DATEADD(DAY, FLOOR(RAND() * 30) + 7, GETDATE()),  -- Random DueDate (between 7 and 30 days from now)
    DATEADD(DAY, FLOOR(RAND() * 10) - 5, GETDATE()));  -- Random ReturnDate within 5 days of CheckoutDate

    SET @counter = @counter + 1;
END;

-- Generate data for CheckedBooks table
SET @counter = 0;
WHILE @counter < 1000  -- Change 1000 to the number of records you want to insert
BEGIN
    INSERT INTO CheckedBooks (CheckoutId, BookId, Quantity)
    VALUES 
    (FLOOR(RAND() * 1000) + 1,  -- Random CheckoutId
    FLOOR(RAND() * 1000) + 1,  -- Random BookId
    FLOOR(RAND() * 5) + 1);  -- Random Quantity (between 1 and 5)

    SET @counter = @counter + 1;
END;

-- Generate data for Publishers table
SET @counter = 0;
WHILE @counter < 1000  -- Change 1000 to the number of records you want to insert
BEGIN
    INSERT INTO Publishers (Name, Address, Phone, Email)
    VALUES 
    (CONCAT('Publisher ', @counter),
    CONCAT('Address of Publisher ', @counter),
    CONCAT('123-555-', FLOOR(RAND() * 1000)),
    CONCAT('publisher', @counter, '@example.com'));

    SET @counter = @counter + 1;
END;

-- Generate data for BookAuthors table (Many-to-Many relationship between Books and Authors)
SET @counter = 0;
WHILE @counter < 1000  -- Change 1000 to the number of records you want to insert
BEGIN
    INSERT INTO BookAuthors (BookId, AuthorId)
    VALUES 
    (FLOOR(RAND() * 1000) + 1,  -- Random BookId
    FLOOR(RAND() * 1000) + 1);  -- Random AuthorId

    SET @counter = @counter + 1;
END;

-- Generate data for BookPublishers table (Many-to-Many relationship between Books and Publishers)
SET @counter = 0;
WHILE @counter < 1000  -- Change 1000 to the number of records you want to insert
BEGIN
    INSERT INTO BookPublishers (BookId, PublisherId, PublishYear)
    VALUES 
    (FLOOR(RAND() * 1000) + 1,  -- Random BookId
    FLOOR(RAND() * 1000) + 1,  -- Random PublisherId
    FLOOR(RAND() * (2024 - 1900 + 1)) + 1900);  -- Random PublishYear between 1900 and 2024

    SET @counter = @counter + 1;
END;

