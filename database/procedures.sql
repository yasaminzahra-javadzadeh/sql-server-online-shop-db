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

EXEC AddNewOrder
1, 1, 1, 'TRK100', 5000000;