
 -- **Database Function - Calculate Restaurant Revenue**: 
 --   - **Function Name**: **`fn_CalculateRevenue`**
 --   - **Purpose**: Compute revenue made by a specific restaurant.
 --   - **Parameter**: `RestaurantId`
 --   - **Return**: total revenue amount for the `RestaurantId` .

create function fn_CalculateRevenue(@RestaurantId INT)
RETURNS DECIMAL(18,2) as
begin 
return(
select ISNULL(SUM(O.TotalAmount),0)
      from Orders O
	  JOIN Reservations r ON o.ReservationId = r.ReservationId
        WHERE r.RestaurantId = @RestaurantId
    );
end;

SELECT dbo.fn_CalculateRevenue(3) AS RevenueForRestaurant1;
