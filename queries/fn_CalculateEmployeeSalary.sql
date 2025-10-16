
 --  **Database Function - Calculate Employees Salary**:
  -- **Function Name**: **`fn_CalculateEmployeeSalary`**
  -- **Purpose**: Compute the salary for a given employee.
  -- **Parameter**: `EmployeeId`
  -- **Implementation**: Salary is defined as: # number of orders made by specific employee * employee rank.
  -- Employee’s rank based on position: Position = `VIPOrdersWaiter` = 5, `StandardWaiter` = 4, `AssistantWaiter`  = 3.
  -- **Return**: salary for the `EmployeeId`.

CREATE FUNCTION fn_CalculateEmployeeSalary(@EmployeeId INT)
RETURNS INT as
begin 
DECLARE @cnt INT=(select count(*) from Orders where EmployeeId=@EmployeeId);
DECLARE @pos NVARCHAR(100) = (SELECT Position FROM Employees WHERE EmployeeId = @EmployeeId);
DECLARE @rank INT = CASE 
        WHEN @pos = 'VIPOrdersWaiter' THEN 5
        WHEN @pos = 'StandardWaiter' THEN 4
        WHEN @pos = 'AssistantWaiter' THEN 3
        ELSE 2 END;
    RETURN ISNULL(@cnt,0) * @rank;
end;
 SELECT dbo.fn_CalculateEmployeeSalary(2) AS SalaryForEmployee2;



