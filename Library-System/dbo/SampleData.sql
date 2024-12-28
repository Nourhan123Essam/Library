-- Insert Sample Data into Readers table
INSERT INTO Readers (Name, Email, Phone, Address)
VALUES 
('John Doe', 'john.doe@example.com', '123-456-7890', '123 Main St, City, Country'),
('Jane Smith', 'jane.smith@example.com', '987-654-3210', '456 Elm St, City, Country'),
('Alice Brown', 'alice.brown@example.com', '555-123-4567', '789 Oak St, City, Country');

-- Insert Sample Data into Categories table
INSERT INTO Categories (Name, Description)
VALUES 
('Fiction', 'Books that contain stories created from the imagination, not based on real events.'),
('Non-fiction', 'Books that are based on factual information and real events.'),
('Science', 'Books that cover topics related to the natural and physical sciences, including physics, biology, and chemistry.'),
('History', 'Books that focus on past events, people, and the interpretation of historical facts.');

-- Insert Sample Data into Books table
INSERT INTO Books (Title, ISBN, CategoryId, Quantity, Description)
VALUES 
('The Great Adventure', '9781234567890', 1, 10, 'A thrilling novel of epic proportions, filled with adventure and excitement.'),
('The Science of Everything', '9780987654321', 3, 5, 'A comprehensive guide that explains the world of science in a simple and accessible way.'),
('The History of Time', '9781234987654', 4, 7, 'An exploration of the origins and the evolution of time, from a scientific and philosophical perspective.');

-- Insert Sample Data into Authors table
INSERT INTO Authors (Name, Bio, Birthdate)
VALUES 
('George Orwell', 'English novelist, essayist, journalist, and critic. Famous for works like "1984" and "Animal Farm."', '1903-06-25'),
('Stephen Hawking', 'Theoretical physicist, cosmologist, and author known for his work on black holes and his book "A Brief History of Time."', '1942-01-08'),
('Isaac Newton', 'English mathematician, astronomer, and physicist who is widely recognized as one of the most influential scientists of all time.', '1643-01-04'),
('Carl Sagan', 'Astronomer, astrophysicist, and science communicator, known for his work on the study of extraterrestrial life and the Cosmos TV series.', '1934-11-09');

-- Insert Sample Data into Publishers table
INSERT INTO Publishers (Name, Address, Phone, Email)
VALUES 
('Penguin Books', '375 Hudson Street, New York, NY', '+1-800-123-4567', 'contact@penguin.com'),
('HarperCollins', '195 Broadway, New York, NY', '+1-800-234-5678', 'info@harpercollins.com'),
('Oxford University Press', 'Great Clarendon Street, Oxford, UK', '+44-1865-555555', 'support@oup.com');

-- Insert Sample Data into Checkouts table
INSERT INTO Checkouts (ReaderId, CheckoutDate, DueDate, ReturnDate)
VALUES
(1, GETDATE(), DATEADD(DAY, 14, GETDATE()), NULL),  -- John Doe checks out a book
(2, GETDATE(), DATEADD(DAY, 14, GETDATE()), NULL),  -- Jane Smith checks out a book
(3, GETDATE(), DATEADD(DAY, 14, GETDATE()), NULL);  -- Alice Brown checks out a book

-- Insert Sample Data into CheckedBooks table (Books checked out in Checkouts)
INSERT INTO CheckedBooks (CheckoutId, BookId, Quantity)
VALUES
(1, 2, 1),  -- John Doe checks out The Great Adventure
(2, 3, 1),  -- Jane Smith checks out The Science of Everything
(3, 1, 1);  -- Alice Brown checks out The History of Time



-- Insert Sample Data into BookAuthors table (Many-to-Many Relationship)
INSERT INTO BookAuthors (BookId, AuthorId)
VALUES
(1, 1),  -- The Great Adventure by George Orwell
(2, 2),  -- The Science of Everything by Stephen Hawking
(3, 3),  -- The History of Time by Isaac Newton
(3, 4);  -- The History of Time by Carl Sagan

-- Insert Sample Data into BookPublishers table (Many-to-Many Relationship)
INSERT INTO BookPublishers (BookId, PublisherId, PublishYear)
VALUES
(3, 1, 2020),  -- The Great Adventure published by Penguin Books in 2020
(1, 2, 2021),  -- The Science of Everything published by HarperCollins in 2021
(2, 3, 2022);  -- The History of Time published by Oxford University Press in 2022