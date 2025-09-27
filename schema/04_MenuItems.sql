CREATE TABLE MenuItems (
    ItemId INT PRIMARY KEY,
    RestaurantId INT REFERENCES Restaurants(RestaurantId),
    Name NVARCHAR(100),
    Description NVARCHAR(200),
    Price DECIMAL(10,2),
);