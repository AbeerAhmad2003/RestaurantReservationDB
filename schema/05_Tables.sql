CREATE TABLE Tables (
    TableId INT PRIMARY KEY,
    RestaurantId INT REFERENCES Restaurants(RestaurantId),
    Capacity INT,
);