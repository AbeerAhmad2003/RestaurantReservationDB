
 
 --16. **Trigger Implementation**
   --  Design a trigger to log an entry into a separate **`AuditLog`** table whenever a table get reserved.
	--The **`AuditLog`** should capture `ResturantId`, `TableId`, `ReservationDate` and **`ChangeDate`**.

	use RestaurantReservation ;

CREATE TABLE dbo.AuditLog (
    AuditId INT IDENTITY(1,1) PRIMARY KEY,
    RestaurantId INT,
    TableId INT,
    ReservationDate DATETIME,
    ChangeDate DATETIME DEFAULT GETDATE() 
);

CREATE TRIGGER dbo.trg_LogReservation
ON dbo.Reservations
AFTER INSERT
AS
BEGIN
    INSERT INTO dbo.AuditLog (RestaurantId, TableId, ReservationDate)
    SELECT RestaurantId, TableId, ReservationDate
    FROM inserted;
END;