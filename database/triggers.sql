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
        RAISERROR(N'موجودی نمی‌تواند منفی باشد',16,1);
        ROLLBACK TRANSACTION;
    END
END;