
--Popular Menu Item Analysis using Joins and Window Functions: Identify the most popular menu item for each restaurant for a given month.
DECLARE @Year INT = 2025;
DECLARE @Month INT = 5;


;WITH ItemsInMonth AS (
    SELECT mi.RestaurantId, mi.ItemId, mi.Name,
           SUM(oi.Quantity) AS QtySold
    FROM OrderItems oi
    JOIN Orders o ON oi.OrderId = o.OrderId
    JOIN MenuItems mi ON oi.ItemId = mi.ItemId
    WHERE YEAR(o.OrderDate) = @Year AND MONTH(o.OrderDate) = @Month
    GROUP BY mi.RestaurantId, mi.ItemId, mi.Name
),Ranked AS (
    SELECT RestaurantId, ItemId, Name, QtySold,
           ROW_NUMBER() OVER (PARTITION BY RestaurantId ORDER BY QtySold DESC) AS rn
    FROM ItemsInMonth
)SELECT RestaurantId, ItemId, Name, QtySold
FROM Ranked
WHERE rn = 1
ORDER BY RestaurantId;