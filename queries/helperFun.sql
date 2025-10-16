
 --  13. **Stored Procedure - Borrowed Books Report**:
    -- **Procedure Name**: **`sp_ResrvedTablesReport`**
    -- **Purpose**: Generate a report of tables reserved within a specified date range.
    -- **Parameters**: **`StartDate`**, **`EndDate`**
    -- **Implementation**: Retrieve all tables reserved within the given range, with details like reservation date, party size and restaurant details.
    -- **Return**: Tabulated report of reserved tables

	-- GET NEW ID FOR INSERT NEW ORDER
CREATE FUNCTION dbo.fn_GetNextOrderId()
RETURNS INT
AS
BEGIN
    DECLARE @NextId INT;

    SELECT @NextId = ISNULL(MAX(OrderId), 0) + 1
    FROM Orders;

    RETURN @NextId;
END;