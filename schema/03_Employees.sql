CREATE TABLE Employees (
    EmployeeId INT PRIMARY KEY,
    RestaurantId INT REFERENCES Restaurants(RestaurantId),
    FirstName NVARCHAR(50) ,
    LastName NVARCHAR(50),
    Position NVARCHAR(50),
);