
use RestaurantReservation ;
--List of Orders and Menu Items: Lists the orders placed on a specific given reservation along with the associated menu items.

DECLARE @ReservationId INT = 1;
SELECT *
FROM Orders O
JOIN OrderItems OI
ON O.OrderId=OI.OrderId
JOIN MenuItems MI
ON MI.ItemId=OI.ItemId
WHERE O.ReservationId = @ReservationId;

