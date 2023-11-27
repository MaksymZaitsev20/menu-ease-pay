USE MenuEasePay;
GO

-- Додавання даних до таблиці DishCategories
INSERT INTO DishCategories (CategoryName)
VALUES ('Appetizer'),
       ('Main Course'),
       ('Dessert'),
       ('Salad'),
       ('Pizza'),
       ('Seafood'),
       ('Pasta'),
       ('Burger'),
       ('Sushi'),
       ('Vegetarian'),
       ('Alcoholic Drink'),
       ('Non-Alcoholic Drink'),
       ('Coffee'),
       ('Tea');

-- Додавання даних до таблиці Dishes
INSERT INTO Dishes (Name, Description, Price, CategoryID)
VALUES ('Margherita Pizza', 'Classic tomato sauce, fresh mozzarella, basil', 12.99, 5),
       ('Chicken Alfredo', 'Grilled chicken, fettuccine pasta, creamy Alfredo sauce', 15.99, 6),
       ('Caesar Salad', 'Romaine lettuce, croutons, Parmesan cheese, Caesar dressing', 8.50, 4),
       ('Spaghetti Bolognese', 'Spaghetti pasta, beef Bolognese sauce', 11.99, 6),
       ('Pepperoni Pizza', 'Tomato sauce, mozzarella, pepperoni', 14.99, 5),
       ('Greek Salad', 'Mixed greens, feta cheese, olives, tomatoes, cucumbers', 9.50, 4),
       ('Lasagna', 'Layers of pasta, ricotta cheese, ground beef, marinara sauce', 16.99, 6),
       ('Vegetarian Sushi Roll', 'Avocado, cucumber, carrot, rice, seaweed', 10.50, 9),
       ('BBQ Chicken Wings', 'Crispy chicken wings, BBQ sauce, ranch dressing', 13.99, 1),
       ('Shrimp Scampi', 'Shrimp, linguine pasta, garlic, white wine sauce', 18.50, 6),
       ('Caprese Salad', 'Tomatoes, fresh mozzarella, basil, balsamic glaze', 11.50, 4),
       ('Beef Tacos', 'Seasoned beef, corn tortillas, lettuce, cheese, salsa', 9.99, 8),
       ('Pad Thai', 'Stir-fried rice noodles, tofu, peanuts, bean sprouts', 14.50, 7),
       ('Chicken Quesadilla', 'Grilled chicken, cheese, flour tortilla, sour cream', 12.99, 8),
       ('Mushroom Risotto', 'Arborio rice, mushrooms, Parmesan cheese', 16.50, 7),
       ('California Roll', 'Crab, avocado, cucumber, rice, seaweed', 13.50, 9),
       ('Steak Fajitas', 'Grilled steak, bell peppers, onions, flour tortillas', 17.99, 8),
       ('Tomato Basil Bruschetta', 'Toasted bread, tomatoes, basil, garlic, olive oil', 8.99, 1),
       ('Chicken Caesar Wrap', 'Grilled chicken, romaine lettuce, Caesar dressing', 9.99, 4),
       ('Seafood Paella', 'Saffron rice, mixed seafood, peas, bell peppers', 20.50, 6),
       ('Classic Mojito', 'White rum, mint, lime, soda water', 8.50,
        (SELECT CategoryID FROM DishCategories WHERE CategoryName = 'Alcoholic Drink')),
       ('Iced Tea', 'Refreshing black tea, served over ice', 2.50,
        (SELECT CategoryID FROM DishCategories WHERE CategoryName = 'Non-Alcoholic Drink')),
       ('Mango Smoothie', 'Blended mango, yogurt, and ice', 4.99,
        (SELECT CategoryID FROM DishCategories WHERE CategoryName = 'Non-Alcoholic Drink')),
       ('Strawberry Lemonade', 'Freshly squeezed lemonade with strawberry puree', 3.99,
        (SELECT CategoryID FROM DishCategories WHERE CategoryName = 'Non-Alcoholic Drink')),
       ('Cappuccino', 'Espresso with steamed milk and foam', 4.50,
        (SELECT CategoryID FROM DishCategories WHERE CategoryName = 'Coffee'));

INSERT INTO Users (Username, PasswordHash)
VALUES ('john_doe', 'hashed_password1'),
       ('jane_smith', 'hashed_password2'),
       ('user3', 'hashed_password3');

INSERT INTO Orders (UserID, OrderDate, IsPaid)
VALUES (1, GETDATE(), 1),
       (2, GETDATE(), 0),
       (3, GETDATE(), 1);

INSERT INTO OrderDetails (OrderID, DishID, Quantity, Price, IsPaid)
VALUES (1, 1, 2, 25.98, 1),
       (1, 2, 1, 15.99, 1),
       (2, 3, 3, 25.50, 0),
       (3, 1, 1, 12.99, 1),
       (3, 2, 2, 31.98, 1),
       (3, 4, 1, 11.99, 1);
