
--Retrieve Employees details with Views: Use a view to list all employees information including their restaurants details


CREATE VIEW EmployeesFull
AS
SELECT e.EmployeeId, e.FirstName, e.LastName, e.Position, e.RestaurantId,
       r.Name AS RestaurantName, r.Address AS RestaurantAddress, r.PhoneNumber AS RestaurantPhone
FROM Employees e
JOIN Restaurants r ON e.RestaurantId = r.RestaurantId;

SELECT * FROM EmployeesFull;