# 🛒 E-Commerce Database System

A relational database project designed for an online mobile shopping platform using **Microsoft SQL Server** and **T-SQL**.

This project demonstrates practical database engineering concepts including relational schema design, normalization, advanced SQL querying, views, stored procedures, triggers, and data integrity constraints.

---

# ✨ Features

- User Management System
- Product & Store Management
- Order Processing Workflow
- Shipping & Tracking System
- Product Rating System
- Address Management
- Advanced Analytical Queries
- SQL Views
- Stored Procedures
- SQL Triggers
- Relational Database Design

---

# 🏗 Database Architecture

## Main Tables

| Table       | Description                          |
| ----------- | ------------------------------------ |
| `Users`     | Stores customer information          |
| `Addresses` | Stores address information           |
| `Admins`    | Stores administrator information     |
| `Stores`    | Stores mobile shop information       |
| `Products`  | Stores product details               |
| `Orders`    | Stores customer orders               |
| `Shipping`  | Stores shipping and delivery details |
| `Ratings`   | Stores product ratings               |

---

## Junction Tables

| Table           | Description                                           |
| --------------- | ----------------------------------------------------- |
| `StoreProducts` | Many-to-many relationship between stores and products |
| `OrderProducts` | Many-to-many relationship between orders and products |

---

# 🛠 Technologies Used

- Microsoft SQL Server
- T-SQL
- SQL Server Management Studio (SSMS)
- Relational Database Modeling

---

# 📚 Database Concepts Implemented

- Primary Keys
- Foreign Keys
- Composite Keys
- One-to-Many Relationships
- Many-to-Many Relationships
- Data Integrity Constraints
- Aggregate Functions
- Window Functions
- SQL Views
- Stored Procedures
- Triggers

---

# 📂 Project Structure

```text
ecommerce-database-system/
│
├── README.md
│
├── database/
│   ├── schema.sql
│   ├── sample-data.sql
│   ├── advanced-queries.sql
│   ├── views.sql
│   ├── procedures.sql
│   └── triggers.sql
│
├── diagrams/
    ├── erd-diagram.png
    └── table.PNG
```

---

# 🚀 How to Run

1. Open **SQL Server Management Studio (SSMS)**
2. Run the SQL files in the following order:

```text
1. schema.sql
2. sample-data.sql
3. views.sql
4. procedures.sql
5. triggers.sql
6. advanced-queries.sql
```

3. The database schema, relationships, and sample data will be generated automatically.

---

# 📊 Sample Advanced Query

## Product Price Ranking

```sql
SELECT
    نام,
    برند,
    قیمت,
    RANK() OVER (ORDER BY قیمت DESC) AS PriceRank
FROM Products;
```

---

# 👁 SQL View Example

```sql
CREATE VIEW OrderDetails AS
SELECT
    o.شناسه_سفارش,
    u.نام AS UserName,
    s.نام AS StoreName,
    o.مبلغ,
    o.تاریخ_ثبت
FROM Orders o
JOIN Users u
ON o.شناسه_کاربر = u.شناسه_کاربر
JOIN Stores s
ON o.شناسه_فروشگاه = s.شناسه_فروشگاه;
```

---

# ⚙ Stored Procedure Example

```sql
CREATE PROCEDURE AddNewOrder
    @OrderID INT,
    @UserID INT,
    @StoreID INT,
    @TrackingCode NVARCHAR(100),
    @Amount DECIMAL(18,2)
AS
BEGIN
    INSERT INTO Orders
    VALUES (
        @OrderID,
        @UserID,
        @StoreID,
        @TrackingCode,
        GETDATE(),
        @Amount,
        N'پست',
        1
    );
END;
```

---

# 🚨 Trigger Example

```sql
CREATE TRIGGER PreventNegativeStock
ON Products
AFTER UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT *
        FROM inserted
        WHERE موجودی < 0
    )
    BEGIN
        RAISERROR(N'Inventory cannot be negative',16,1);
        ROLLBACK TRANSACTION;
    END
END;
```

---

# 📈 Future Improvements

- Add Authentication & Authorization
- Add Payment System
- Add Product Categories
- Add Inventory Automation
- Add Customer Review System
- Convert Persian column names to English
- Develop ASP.NET Core Backend API

---

# 🎯 Project Goals

This project was developed to strengthen practical SQL Server and database design skills through implementing a real-world e-commerce database system.

---

# 👩‍💻 Author

## YasaminZahra Javadzadeh

Computer Engineering Student  
Iran University of Science and Technology (IUST)

---

# ⭐ Notes

This project is intended for educational, portfolio, and learning purposes.
