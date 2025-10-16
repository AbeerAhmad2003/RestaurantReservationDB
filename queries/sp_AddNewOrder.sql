
 

	-- **Stored Procedure - Add New Order**:
    -- **Procedure Name**: **`sp_AddNewOrder`**
    -- **Purpose**: Streamline the process of adding a new order.
    -- **Parameters**: **`ReservationId`**, **`EmployeeId`**, **`OrderDate`**, and **`TotalAmount`**.
    -- **Implementation**: Check if the specified reservation and employee exist, if not, return an error message, if existing, add new order.
    -- **Return**: The new **`OrderId`** or an error message.

IF OBJECT_ID('dbo.sp_AddNewOrder','P') IS NOT NULL
    DROP PROCEDURE dbo.sp_AddNewOrder;
GO

CREATE PROCEDURE dbo.sp_AddNewOrder
    @ReservationId INT,
    @EmployeeId INT,
    @OrderDate DATETIME,
    @TotalAmount DECIMAL(12,2)
AS
BEGIN
    SET NOCOUNT ON;

 
    IF NOT EXISTS (SELECT 1 FROM Reservations WHERE ReservationId = @ReservationId)
    BEGIN
        RAISERROR('Reservation not found (ReservationId=%d).',16,1,@ReservationId);
        RETURN -1;
    END

 
    IF NOT EXISTS (SELECT 1 FROM Employees WHERE EmployeeId = @EmployeeId)
    BEGIN
        RAISERROR('Employee not found (EmployeeId=%d).',16,1,@EmployeeId);
        RETURN -2;
    END

 
    DELETE FROM Orders
    WHERE ReservationId = @ReservationId;

  
    INSERT INTO Orders (OrderId, ReservationId, EmployeeId, OrderDate, TotalAmount)
    VALUES (dbo.fn_GetNextOrderId(), @ReservationId, @EmployeeId, @OrderDate, @TotalAmount);

 
    SELECT MAX(OrderId) AS NewOrderId FROM Orders;
END;
GO


EXEC dbo.sp_AddNewOrder 
    @ReservationId = 1, 
    @EmployeeId = 2000, 
    @OrderDate = '2025-09-29 14:35',  
    @TotalAmount = 50.00;

SELECT MAX(OrderId) AS NewOrderId FROM Orders;
select * from Orders;