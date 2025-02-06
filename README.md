# Bookstore Management System

## Overview
The **Bookstore Management System** is a database management system designed to handle the operations of an online bookstore efficiently. It allows for book tracking, customer management, order processing, supplier interactions, and delivery handling.

## Features
- **Book Management**: Track books by ISBN, author, publisher, and genre.
- **Customer Management**: Maintain customer records, including order history.
- **Order Processing**: Manage book orders, calculate total costs, and apply delivery fees.
- **Supplier and Inventory Management**: Ensure stock availability and manage supplier relationships.
- **Delivery Management**: Assign delivery personnel and calculate predefined delivery fees.

## Database Schema & Assumptions
- **Books**: Each book is uniquely identified by an ISBN.
- **Authors**: Each author has a unique Author_ID and can write multiple books.
- **Publishers**: Each publisher is uniquely identified and can have multiple contact numbers.
- **Orders**: Orders contain multiple books, with price calculation including book prices and delivery fees.
- **Customers**: Each customer is uniquely identified and linked to multiple orders.
- **Suppliers**: Suppliers are dependent on publishers (weak entity).
- **Inventory**: Tracks stock updates, including date and supplier details.
- **Delivery**: Each delivery person has a unique SSN and fixed delivery fees.

## Entity Relationships
1. **Writes (Author - Book)**: One-to-many (1:N) - A single author can write multiple books.
2. **Publishes (Publisher - Book)**: One-to-many (1:N) - A single publisher can publish multiple books.
3. **Deals_With (Publisher - Supplier)**: One-to-many (1:N) - Publishers can have multiple suppliers.
4. **Supplies (Supplier - Inventory)**: One-to-many (1:N) - A supplier can update inventory records.
5. **Stored (Book - Inventory)**: One-to-many (1:N) - Each book has multiple inventory records over time.
6. **Order_Details (Order - Book)**: Many-to-many (M:N) - An order can include multiple books.
7. **Orders (Customer - Order)**: One-to-many (1:N) - A customer can place multiple orders.
8. **Delivers (Delivery - Order - Customer)**: Ensures each order is linked to a customer and a delivery person.

Contributors

-Abdelrahman Ali Ahmed Mohamed El-Khayyat

-Ahmed Ashraf Ahmed Labib

-Mohamed Sadiq Youssef Ali

-Mohamed Ashraf Gaber Abdel Fattah

-Omar Ali Othman Kamel

-Mazen Mahmoud Mahmoud Sowira