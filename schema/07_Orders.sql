CREATE TABLE Orders (
    OrderId INT PRIMARY KEY,
    ReservationId INT  REFERENCES Reservations(ReservationId),
    EmployeeId INT REFERENCES Employees(EmployeeId),
    OrderDate DATETIME,
    TotalAmount DECIMAL(10,2),
);