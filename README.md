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

---

### 📌 **Stored Objects That Benefit from Indexing**
Indexes significantly improve the performance of specific stored objects by optimizing query execution. Here are the stored objects that see noticeable benefits:

- **`GetBooksByCategory`** (Stored Procedure): Retrieves books by category.  
- **`GetBookByAuthor`** (Stored Procedure): Retrieves books by a specific author.  
- **`BooksWithCategoriesAndAuthors`** (View): Displays books along with their categories and authors.  

---

### 🔍 **Analyzing the Impact of Indexing: `GetBookByAuthor` Stored Procedure**
Let's compare the performance of the `GetBookByAuthor` stored procedure **before** and **after** applying an index.

---

#### 🚫 **Without Index**
- The execution plan for the `GetBookByAuthor` stored procedure shows the following results:
  - **Physical Operation**: `Clustered Index Scan` (This indicates a row-by-row search, relying on the default primary key index).
  - **Actual Number of Rows Read**: **534** rows.  
  - This operation is less efficient because a full table scan is performed.  

![Screenshot](https://github.com/Nourhan123Essam/Library_System_DataBase_SQL_Server/blob/master/Demo%20Images%20of%20the%20project/without%20using%20index.png)  
*Figure 1: Execution Plan Without Index for `GetBookByAuthor` Stored Procedure*

---

#### ✅ **With Index**
- After creating a **non-clustered index** on the `AuthorId` column in the `BookAuthors` table, the execution plan shows significant improvements:
  - **Physical Operation**: `Index Seek` (This uses the newly created index, allowing subtree-based searching for faster lookups).
  - **Actual Number of Rows Read**: **4** rows (a drastic reduction compared to 534 rows).  
  - This operation is much more efficient as the query directly navigates to the relevant rows.

![Screenshot](https://github.com/Nourhan123Essam/Library_System_DataBase_SQL_Server/blob/master/Demo%20Images%20of%20the%20project/using%20index.png)  
*Figure 2: Execution Plan With Index for `GetBookByAuthor` Stored Procedure*

---

### 🎯 **Key Takeaways**
- **Without Index**: The query performs a `Clustered Index Scan`, leading to higher read operations and slower performance.  
- **With Index**: The query performs an `Index Seek`, drastically reducing the number of rows read and improving performance.  
- Proper indexing optimizes query execution, reduces table scans, and enhances overall system performance.  

---
### Stored Objects That Don't Require Indexes:
These stored objects perform well without the need for indexes:
- **CalculateOverdueDays** (Function): Calculates overdue days for checkouts.
- **GetReaderFullName** (Function): Returns the full name of the reader.
- **AddNewBook** (Stored Procedure): Adds a new book to the library.
- **DeleteBook** (Stored Procedure): Deletes a book from the library.
- **UpdateBookDetails** (Stored Procedure): Updates book details.
- **BooksWithAuthorsAndPublishers** (View): Retrieves book names along with authors and publishers.


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


