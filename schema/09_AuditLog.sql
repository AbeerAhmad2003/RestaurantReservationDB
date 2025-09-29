CREATE TABLE AuditLog (
    AuditId INT IDENTITY(1,1) PRIMARY KEY,
    RestaurantId INT REFERENCES Restaurants(RestaurantId),
    TableId INT REFERENCES Tables(TableId),
    ReservationDate DATETIME,
    ChangeDate DATETIME DEFAULT GETDATE()
);