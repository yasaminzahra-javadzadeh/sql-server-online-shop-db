-- نمایش تمام سفارش‌ها به همراه نام کاربر و فروشگاه
SELECT 
    u.نام AS UserName,
    s.نام AS StoreName,
    o.شماره_پیگیری,
    o.مبلغ,
    o.تاریخ_ثبت
FROM Orders o
JOIN Users u
ON o.شناسه_کاربر = u.شناسه_کاربر
JOIN Stores s
ON o.شناسه_فروشگاه = s.شناسه_فروشگاه;

-- میانگین امتیاز هر محصول
SELECT 
    p.نام AS ProductName,
    AVG(r.امتیاز) AS AverageRating
FROM Products p
JOIN Ratings r
ON p.شناسه_محصول = r.شناسه_محصول
GROUP BY p.نام;

-- تعداد محصولات هر فروشگاه
SELECT 
    s.نام AS StoreName,
    COUNT(p.شناسه_محصول) AS ProductCount
FROM Stores s
LEFT JOIN Products p
ON s.شناسه_فروشگاه = p.شناسه_فروشگاه
GROUP BY s.نام;

-- رتبه‌بندی محصولات بر اساس قیمت
SELECT 
    نام,
    برند,
    قیمت,
    RANK() OVER (ORDER BY قیمت DESC) AS PriceRank
FROM Products;

-- پرفروش‌ترین فروشگاه
SELECT TOP 1
    s.نام,
    COUNT(o.شناسه_سفارش) AS TotalOrders
FROM Stores s
JOIN Orders o
ON s.شناسه_فروشگاه = o.شناسه_فروشگاه
GROUP BY s.نام
ORDER BY TotalOrders DESC;