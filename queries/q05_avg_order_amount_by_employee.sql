
use RestaurantReservation ;
--Calculate Average Order Amount: Calculate the average order amount made through a specific employee.

DECLARE @EmployeeId INT =7;

SELECT emp.EmployeeId,emp.FirstName,emp.LastName, AVG(TotalAmount) AS AvgAmount
FROM Orders o
join Employees emp
on o.EmployeeId=emp.EmployeeId
WHERE o.EmployeeId = @EmployeeId
group by emp.EmployeeId,emp.FirstName,emp.LastName;