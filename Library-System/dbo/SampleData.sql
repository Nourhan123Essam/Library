-- Insert Sample Data into Readers table (Expanded)
INSERT INTO Readers (Name, Email, Phone, Address)
VALUES 
('John Doe', 'john.doe@example.com', '123-456-7890', '123 Main St, City, Country'),
('Jane Smith', 'jane.smith@example.com', '987-654-3210', '456 Elm St, City, Country'),
('Alice Brown', 'alice.brown@example.com', '555-123-4567', '789 Oak St, City, Country'),
('Michael Johnson', 'michael.johnson@example.com', '234-567-8901', '101 Maple St, City, Country'),
('Emily Davis', 'emily.davis@example.com', '678-123-4567', '202 Pine St, City, Country'),
('Chris Wilson', 'chris.wilson@example.com', '345-678-9012', '303 Cedar St, City, Country'),
('Olivia Martinez', 'olivia.martinez@example.com', '456-789-0123', '404 Birch St, City, Country'),
('Daniel Clark', 'daniel.clark@example.com', '567-890-1234', '505 Redwood St, City, Country'),
('Sophia Rodriguez', 'sophia.rodriguez@example.com', '678-901-2345', '606 Palm St, City, Country'),
('Lucas Lee', 'lucas.lee@example.com', '789-012-3456', '707 Willow St, City, Country');

-- Insert Sample Data into Categories table (Expanded)
INSERT INTO Categories (Name)
VALUES 
('Fiction'),
('Non-fiction'),
('Science'),
('History'),
('Fantasy'),
('Romance'),
('Thriller'),
('Biography'),
('Self-Help'),
('Mystery');

-- Insert Sample Data into Books table (Expanded)
INSERT INTO Books (Title, ISBN, CategoryId, Quantity, Price)
VALUES 
('The Great Adventure', '978-1234567890', 1, 10, 19.99),
('The Science of Everything', '978-0987654321', 3, 5, 29.99),
('The History of Time', '978-1234987654', 4, 7, 24.99),
('The Lord of the Rings', '978-0261102385', 5, 15, 39.99),
('The Secret Garden', '978-1503212185', 1, 3, 14.99),
('A Brief History of Time', '978-0553380163', 3, 12, 19.99),
('Pride and Prejudice', '978-0141439518', 6, 8, 12.99),
('The Da Vinci Code', '978-0307474278', 7, 20, 14.99),
('The Power of Habit', '978-0812981605', 9, 25, 15.99),
('The Catcher in the Rye', '978-0316769488', 1, 30, 10.99),
('Harry Potter and the Philosophers Stone', '978-0747532699', 5, 50, 20.99),
('The Girl with the Dragon Tattoo', '978-0307949486', 7, 18, 17.99),
('The Alchemist', '978-0062315007', 6, 9, 22.99),
('Becoming', '978-1524763138', 8, 16, 23.99),
('Atomic Habits', '978-0735211292', 9, 27, 18.99);

-- Insert Sample Data into Authors table (Expanded)
INSERT INTO Authors (Name)
VALUES 
('George Orwell'),
('Stephen Hawking'),
('Isaac Newton'),
('Carl Sagan'),
('J.R.R. Tolkien'),
('Frances Hodgson Burnett'),
('Jane Austen'),
('Dan Brown'),
('Charles Duhigg'),
('J.D. Salinger'),
('J.K. Rowling'),
('Stieg Larsson'),
('Paulo Coelho'),
('Michelle Obama'),
('James Clear');

-- Insert Sample Data into Publishers table (Expanded)
INSERT INTO Publishers (Name)
VALUES 
('Penguin Books'),
('HarperCollins'),
('Oxford University Press'),
('Hachette Book Group'),
('Random House'),
('Macmillan'),
('Simon & Schuster'),
('Bloomsbury Publishing'),
('Knopf Doubleday'),
('Scribner');

-- Insert Sample Data into BookAuthors table (Many-to-Many Relationship, Expanded)
INSERT INTO BookAuthors (BookId, AuthorId)
VALUES
(1, 1),  -- The Great Adventure by George Orwell
(2, 2),  -- The Science of Everything by Stephen Hawking
(3, 3),  -- The History of Time by Isaac Newton
(4, 4),  -- The Lord of the Rings by J.R.R. Tolkien
(5, 5),  -- The Secret Garden by Frances Hodgson Burnett
(6, 2),  -- A Brief History of Time by Stephen Hawking
(7, 6),  -- Pride and Prejudice by Jane Austen
(8, 7),  -- The Da Vinci Code by Dan Brown
(9, 8),  -- The Power of Habit by Charles Duhigg
(10, 9), -- The Catcher in the Rye by J.D. Salinger
(11, 10), -- Harry Potter and the Philosopher's Stone by J.K. Rowling
(12, 11), -- The Girl with the Dragon Tattoo by Stieg Larsson
(13, 12), -- The Alchemist by Paulo Coelho
(14, 13), -- Becoming by Michelle Obama
(15, 14); -- Atomic Habits by James Clear

-- Insert Sample Data into BookPublishers table (Many-to-Many Relationship, Expanded)
INSERT INTO BookPublishers (BookId, PublisherId, PublisherYear)
VALUES
(1, 1, 2020),  -- The Great Adventure published by Penguin Books in 2020
(2, 2, 2021),  -- The Science of Everything published by HarperCollins in 2021
(3, 3, 2022),  -- The History of Time published by Oxford University Press in 2022
(4, 4, 2003),  -- The Lord of the Rings published by Hachette Book Group in 2003
(5, 5, 2015),  -- The Secret Garden published by Random House in 2015
(6, 2, 2018),  -- A Brief History of Time published by HarperCollins in 2018
(7, 6, 2009),  -- Pride and Prejudice published by Macmillan in 2009
(8, 7, 2006),  -- The Da Vinci Code published by Simon & Schuster in 2006
(9, 8, 2012),  -- The Power of Habit published by Scribner in 2012
(10, 9, 1951),  -- The Catcher in the Rye published by Knopf Doubleday in 1951
(11, 10, 1997),  -- Harry Potter and the Philosopher's Stone published by Bloomsbury Publishing in 1997
(12, 11, 2005),  -- The Girl with the Dragon Tattoo published by Alfred A. Knopf in 2005
(13, 12, 1988),  -- The Alchemist published by HarperOne in 1988
(14, 13, 2018),  -- Becoming published by Crown Publishing Group in 2018
(15, 14, 2019);  -- Atomic Habits published by Penguin Books in 2019

-- Insert Sample Data into Checkouts table (Expanded)
INSERT INTO Checkouts (ReaderId, CheckoutDate, DueDate)
VALUES
(1, GETDATE(), DATEADD(DAY, 14, GETDATE())),  -- John Doe checks out a book
(2, GETDATE(), DATEADD(DAY, 14, GETDATE())),  -- Jane Smith checks out a book
(3, GETDATE(), DATEADD(DAY, 14, GETDATE())),  -- Alice Brown checks out a book
(4, GETDATE(), DATEADD(DAY, 14, GETDATE())),  -- Michael Johnson checks out a book
(5, GETDATE(), DATEADD(DAY, 14, GETDATE())),  -- Emily Davis checks out a book
(6, GETDATE(), DATEADD(DAY, 14, GETDATE())),  -- Chris Wilson checks out a book
(7, GETDATE(), DATEADD(DAY, 14, GETDATE())),  -- Olivia Martinez checks out a book
(8, GETDATE(), DATEADD(DAY, 14, GETDATE())),  -- Daniel Clark checks out a book
(9, GETDATE(), DATEADD(DAY, 14, GETDATE())),  -- Sophia Rodriguez checks out a book
(10, GETDATE(), DATEADD(DAY, 14, GETDATE()));  -- Lucas Lee checks out a book

-- Insert Sample Data into CheckedBooks table (Expanded)
INSERT INTO CheckedBooks (CheckoutId, BookId)
VALUES
(1, 1),  -- John Doe checks out The Great Adventure
(2, 2),  -- Jane Smith checks out The Science of Everything
(3, 3),  -- Alice Brown checks out The History of Time
(4, 4),  -- Michael Johnson checks out The Lord of the Rings
(5, 5),  -- Emily Davis checks out The Secret Garden
(6, 6),  -- Chris Wilson checks out A Brief History of Time
(7, 7),  -- Olivia Martinez checks out Pride and Prejudice
(8, 8),  -- Daniel Clark checks out The Da Vinci Code
(9, 9),  -- Sophia Rodriguez checks out The Power of Habit
(10, 10);  -- Lucas Lee checks out The Catcher in the Rye
