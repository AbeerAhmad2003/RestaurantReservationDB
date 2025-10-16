
--Reservation’s Order with CTEs: Identify reservations which have 2 or more orders using CTEs.


WITH OrdersPerReservation AS (
    SELECT ReservationId, COUNT(*) AS OrdersCount
    FROM Orders
    WHERE ReservationId IS NOT NULL
    GROUP BY ReservationId
)
SELECT *
FROM Reservations R
JOIN OrdersPerReservation OPR
ON R.ReservationId=OPR.ReservationId
WHERE OPR.OrdersCount>=2;