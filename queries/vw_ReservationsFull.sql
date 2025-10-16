
--Retrieve Reservations Report with Views: Use a view to list all reservations information including restaurants and customers information.


CREATE VIEW ReservationsReport AS
   SELECT r.ReservationId, r.ReservationDate, r.PartySize, r.TableId,
       c.CustomerId, c.FirstName AS CustomerFirstName, c.LastName AS CustomerLastName, c.Email, c.PhoneNumber AS CustomerPhone,
       res.RestaurantId, res.Name AS RestaurantName, res.Address AS RestaurantAddress, res.PhoneNumber AS RestaurantPhone
       
FROM Reservations r
JOIN Customers c ON r.CustomerId = c.CustomerId
JOIN Restaurants res ON r.RestaurantId = res.RestaurantId;

SELECT * FROM ReservationsReport;
