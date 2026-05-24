CREATE DATABASE shop;
GO

USE shop;
GO

CREATE TABLE Users (
    شناسه_کاربر INT PRIMARY KEY,
    کد_ملی CHAR(10) UNIQUE,
    شماره_تماس NVARCHAR(20) UNIQUE,
    نام NVARCHAR(100),
    تعداد_سفارشات INT,
    تاریخ_عضویت DATE,
    تاریخ_آخرین_ورود DATETIME,
	شناسه_آدرس INT
);

CREATE TABLE Addresses (
    شناسه_آدرس INT PRIMARY KEY,
    شناسه_کاربر INT FOREIGN KEY REFERENCES Users(شناسه_کاربر),
    متن_آدرس NVARCHAR(255),
	استان NVARCHAR(20),
	شهر NVARCHAR(20),
	پلاک INT,
	واحد INT,
	کدپستی INT
);

CREATE TABLE Admins (
    شناسه_مدیر INT PRIMARY KEY,
    نام NVARCHAR(100),
    آدرس_ایمیل NVARCHAR(100),
    تاریخ_آخرین_ورود DATETIME
);

CREATE TABLE Stores (
    شناسه_فروشگاه INT PRIMARY KEY,
    نام NVARCHAR(100),
    نوع_فروش NVARCHAR(50),
    شماره_تماس NVARCHAR(20) UNIQUE,
    شناسه_آدرس INT FOREIGN KEY REFERENCES Addresses(شناسه_آدرس)

);

CREATE TABLE Products (
    شناسه_محصول INT PRIMARY KEY,
    نام NVARCHAR(100),
    برند NVARCHAR(100),
    قیمت DECIMAL(18,2),
    موجودی INT,
    شناسه_فروشگاه INT FOREIGN KEY REFERENCES Stores(شناسه_فروشگاه)
);

CREATE TABLE StoreProducts (
    شناسه_محصول INT,
    شناسه_فروشگاه INT,
    PRIMARY KEY (شناسه_محصول, شناسه_فروشگاه),
    FOREIGN KEY (شناسه_محصول) REFERENCES Products(شناسه_محصول),
    FOREIGN KEY (شناسه_فروشگاه) REFERENCES Stores(شناسه_فروشگاه)
);

CREATE TABLE Ratings (
    شناسه_امتیاز INT PRIMARY KEY,
    شناسه_محصول INT FOREIGN KEY REFERENCES Products(شناسه_محصول),
    شناسه_فروشگاه INT FOREIGN KEY REFERENCES Stores(شناسه_فروشگاه),
    شناسه_کاربر INT FOREIGN KEY REFERENCES Users(شناسه_کاربر),
    امتیاز INT,
    تاریخ_ثبت DATE
);

CREATE TABLE Orders (
    شناسه_سفارش INT PRIMARY KEY,
    شناسه_کاربر INT FOREIGN KEY REFERENCES Users(شناسه_کاربر),
    شناسه_فروشگاه INT FOREIGN KEY REFERENCES Stores(شناسه_فروشگاه),
    شماره_پیگیری NVARCHAR(100) UNIQUE,
    تاریخ_ثبت DATE,
    مبلغ DECIMAL(18,2),
    روش_ارسال NVARCHAR(50),
    شناسه_آدرس INT FOREIGN KEY REFERENCES Addresses(شناسه_آدرس)
);

CREATE TABLE OrderProducts (
    شناسه_سفارش INT,
    شناسه_محصول INT,
    PRIMARY KEY (شناسه_سفارش, شناسه_محصول),
    FOREIGN KEY (شناسه_سفارش) REFERENCES Orders(شناسه_سفارش),
    FOREIGN KEY (شناسه_محصول) REFERENCES Products(شناسه_محصول)
);

CREATE TABLE Shipping (
    شماره_پیگیری NVARCHAR(100) PRIMARY KEY,
    شناسه_سفارش INT FOREIGN KEY REFERENCES Orders(شناسه_سفارش),
    روش_ارسال NVARCHAR(50),
    تاریخ_ارسال DATE,
    وضعیت_ارسال NVARCHAR(50),
    شناسه_آدرس INT FOREIGN KEY REFERENCES Addresses(شناسه_آدرس)
);