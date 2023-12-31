USE master;
GO

IF EXISTS(SELECT *
          FROM sys.databases
          WHERE name = 'MenuEasePay')
    BEGIN
        ALTER DATABASE MenuEasePay SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
        DROP DATABASE MenuEasePay;
    END;
GO

CREATE DATABASE MenuEasePay;
GO

USE MenuEasePay;
GO

CREATE TABLE DishCategory
(
    CategoryID   INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(50) NOT NULL
);

CREATE TABLE Dish
(
    DishID      INT            NOT NULL IDENTITY (1,1) PRIMARY KEY,
    Name        NVARCHAR(255)  NOT NULL,
    Description NVARCHAR(MAX),
    Price       DECIMAL(10, 2) NOT NULL,
    CategoryID  INT FOREIGN KEY REFERENCES DishCategory(CategoryID)
);

CREATE TABLE [User]
(
    UserID       INT           NOT NULL PRIMARY KEY IDENTITY (1,1),
    Username     NVARCHAR(50)  NOT NULL,
    PasswordHash NVARCHAR(255) NOT NULL
);

CREATE TABLE [Order]
(
    OrderID   INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
    UserID    INT FOREIGN KEY REFERENCES [User] (UserID),
    OrderDate DATETIME DEFAULT GETDATE(),
    IsPaid    BIT      DEFAULT 0
);

CREATE TABLE OrderDetails
(
    OrderDetailID INT PRIMARY KEY IDENTITY (1,1),
    OrderID       INT FOREIGN KEY REFERENCES [Order] (OrderID),
    DishID        INT FOREIGN KEY REFERENCES Dish (DishID),
    Quantity      INT DEFAULT 1,
    Price         DECIMAL(10, 2),
    IsPaid        BIT DEFAULT 0
);


/* ROLLBACK

USE master;
GO

DROP DATABASE IF EXISTS  MenuEasePay;
GO

 */