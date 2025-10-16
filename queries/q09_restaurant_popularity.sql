
--Restaurant Popularity using Aggregation: Rank restaurants by the reservation frequency.



SELECT r.RestaurantId, r.Name,
       COUNT(res.ReservationId) AS ReservationCount
FROM Restaurants r
LEFT JOIN Reservations res ON r.RestaurantId = res.RestaurantId
GROUP BY r.RestaurantId, r.Name
ORDER BY ReservationCount DESC;