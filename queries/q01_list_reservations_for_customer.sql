
use RestaurantReservation ;
-- List all reservations for a specific customer

DECLARE @CustomerId INT = 1;
SELECT *
FROM Reservations
WHERE CustomerId=@CustomerId;
