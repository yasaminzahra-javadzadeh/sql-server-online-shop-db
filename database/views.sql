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

SELECT * FROM OrderDetails;