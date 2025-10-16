
use RestaurantReservation ;
--List of Ordered Menu Items: Lists the menu items ordered by a specific reservation.

DECLARE @ReservationId INT = 1;
SELECT MI.*
FROM Orders O
JOIN OrderItems OI
ON O.OrderId = OI.OrderId
JOIN MenuItems MI
ON OI.ItemId = MI.ItemId
WHERE o.ReservationId = @ReservationId;

