
 
 --15. **SQL Stored Procedure with Temp Table**:
     -- Design a stored procedure that retrieves all tables which have future reservations.
	--  Store these tables in a temporary table, then join this temp table with the **`Restaurants`**
	-- table to list out the specific information about the associated restaurants.
	use RestaurantReservation ;

CREATE PROCEDURE dbo.sp_FutureReservedTables
AS
BEGIN
    SET NOCOUNT ON;

   
    IF OBJECT_ID('tempdb..#FutureTables') IS NOT NULL
        DROP TABLE #FutureTables;

    
    SELECT DISTINCT
        t.TableId,
        t.RestaurantId,
        t.Capacity
    INTO #FutureTables
    FROM Tables t
    JOIN Reservations r ON t.TableId = r.TableId
    WHERE r.ReservationDate > GETDATE();

    
    SELECT
        ft.TableId,
        ft.RestaurantId,
        ft.Capacity,
        res.Name      AS RestaurantName,
        res.Address   AS RestaurantAddress,
        res.PhoneNumber AS RestaurantPhone
    FROM #FutureTables ft
    LEFT JOIN Restaurants res ON ft.RestaurantId = res.RestaurantId
    ORDER BY res.Name, ft.TableId;

END;

EXEC dbo.sp_FutureReservedTables;
