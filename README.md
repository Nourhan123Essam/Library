# 📚 Library Management System

## 📝 Project Description

Welcome to the **Library Management System**! This system allows users to manage books, authors, publishers, readers, checkouts, and the relationships between these entities. It includes functionalities such as:

- Managing books, categories, authors, and publishers
- Managing readers and their checkouts
- Tracking which books are checked out by which readers and their due dates
- Supporting multiple authors for a book and multiple publishers for a book

The system uses a relational database to store data and manage the relationships between these entities.

--- 

## 🗂️ Database Overview

The **Library Management System** uses a normalized database schema with several tables to manage the data. The relationships between entities are modeled using foreign keys and normalization techniques to ensure data integrity and reduce redundancy.

## 📊 Database Entities

The following entities are part of the system:

- **Books**: Represents books in the library.
- **Authors**: Represents authors who have written books.
- **Publishers**: Represents publishers of books.
- **Readers**: Represents readers who borrow books.
- **Checkouts**: Represents records of books checked out by readers.
- **CheckedBooks**: Represents the details of the books checked out in each checkout.
- **Categories**: Represents categories or genres of books.
- **BookAuthors**: Represents the many-to-many relationship between books and authors.
- **BookPublishers**: Represents the many-to-many relationship between books and publishers.

## 🔗 Database Design

The database is designed with the following relationships:

- A **book** can have multiple **authors** (many-to-many).
- A **book** can have multiple **publishers** (many-to-many).
- A **book** relates to one **category** but a **category** can have multiple books (one-to-many).
- A **reader** can make many **checkouts** (one-to-many).
- A **checkout** has many **checked books** (one-to-many), with each **checked book** relating to a specific **book** and **checkout**.

## 📐 Database Diagrams

The following diagrams visually represent the structure of the database:

- **Entity Relationship Diagram (ERD)**: Shows the relationships between entities in the database.
- **Normalization Diagram**: Illustrates the normalization of the database to reduce redundancy and ensure data integrity.
- **Schema Diagram**: Represents the actual schema of the database, including tables and fields.

### Entity Relationship Diagram (ERD)

![ERD Diagram](https://github.com/Nourhan123Essam/Library/blob/master/Demo%20Images%20of%20the%20project/ERD.png)  
*Figure 1: Entity Relationship Diagram (ERD)*

### Normalization Diagram

![Normalization Diagram](https://github.com/Nourhan123Essam/Library/blob/master/Demo%20Images%20of%20the%20project/Normalization.png)  
*Figure 2: Normalization Diagram*

### Schema Diagram

![Schema Diagram](https://github.com/Nourhan123Essam/Library/blob/master/Demo%20Images%20of%20the%20project/Schema.png)  
*Figure 3: Schema Diagram*

---

## Stored Objects 🛠️
Stored objects include **Tables**, **Stored Procedures**, **Functions**, **Triggers**, and **Views**. These objects are essential for storing complex queries and business logic in the database.

### Benefits of Using Stored Objects:
- **Performance**: By using stored objects, SQL Server can create and cache the **Execution Plan** one time. This saves time and resources by preventing the need to recreate the execution plan with each query.
- **Best Practice**: It's a best practice to create stored objects for frequently used queries to improve **performance** and optimize **resource usage**.
- **Indexing**: Indexing is crucial for **performance** but should be used carefully. Indexes improve query speed but can cause overhead on **INSERT**, **UPDATE**, and **DELETE** operations. A balance is needed.

### Security Enhancement 🔒:
Stored objects also enhance the **security** of the database by:
- **Encapsulating logic**: Prevents direct access to sensitive tables and controls the data that can be accessed or modified.
- **User permissions**: Allows you to grant permissions to execute stored procedures, functions, and views without exposing underlying tables.
- **Reduced SQL injection risk**: Using parameterized queries inside stored procedures mitigates the risk of SQL injection attacks.
- **Centralized control**: Security policies can be centralized in stored procedures, ensuring consistent enforcement across the database.

### Stored Objects That Don't Require Indexes:
These stored objects perform well without the need for indexes:
- **CalculateOverdueDays** (Function): Calculates overdue days for checkouts.
- **GetReaderFullName** (Function): Returns the full name of the reader.
- **AddNewBook** (Stored Procedure): Adds a new book to the library.
- **DeleteBook** (Stored Procedure): Deletes a book from the library.
- **UpdateBookDetails** (Stored Procedure): Updates book details.
- **BooksWithAuthorsAndPublishers** (View): Retrieves book names along with authors and publishers.

### Stored Objects That Require Indexes:
These stored objects perform better with proper indexing:
- **GetBooksByCategory** (Stored Procedure): Retrieves books by category.
- **GetBookByAuthor** (Stored Procedure): Retrieves books by a specific author.
- **GetBookByPublisher** (Stored Procedure): Retrieves books by publisher.
- **GetBooksCheckedOutByReader** (Stored Procedure): Retrieves books checked out by a specific reader.

---


## 📊 Sample Data

Sample data has been provided for all the tables in the database to help with testing and development. The sample data includes:

- Books
- Authors
- Publishers
- Readers
- Checkouts
- CheckedBooks
- Categories

You can use this data to test the database functionality.

## 🚀 How to Use

1. Clone the repository.
2. Open the solution in Visual Studio and publish the database.
3. Use the sample data script to populate the tables with data.
4. Query the tables to test the data and perform CRUD operations.


