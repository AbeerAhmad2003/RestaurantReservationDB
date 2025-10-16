
 --  13. **Stored Procedure - Borrowed Books Report**:
    -- **Procedure Name**: **`sp_ResrvedTablesReport`**
    -- **Purpose**: Generate a report of tables reserved within a specified date range.
    -- **Parameters**: **`StartDate`**, **`EndDate`**
    -- **Implementation**: Retrieve all tables reserved within the given range, with details like reservation date, party size and restaurant details.
    -- **Return**: Tabulated report of reserved tables

CREATE PROCEDURE sp_ResrvedTablesReport
    @StartDate DATETIME,
    @EndDate DATETIME
AS 
begin 
 SELECT r.ReservationId, r.ReservationDate, r.PartySize,
           rest.RestaurantId, rest.Name AS RestaurantName, rest.Address, rest.PhoneNumber,
           r.TableId,   
           r.CustomerId 
    FROM Reservations r
    JOIN Restaurants rest ON r.RestaurantId = rest.RestaurantId
    WHERE r.ReservationDate BETWEEN @StartDate AND @EndDate
   
end;
EXEC dbo.sp_ResrvedTablesReport '2025-01-01','2025-02-28';


