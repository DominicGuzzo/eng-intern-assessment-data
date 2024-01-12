-- Problem 1: Retrieve all products in the Sports category
-- Write an SQL query to retrieve all products in a specific category.

SELECT prod.*
FROM Products prod
JOIN Categories cat ON prod.category_id = cat.category_id
WHERE cat.category_name = 'Sports';

-- Problem 2: Retrieve the total number of orders for each user
-- Write an SQL query to retrieve the total number of orders for each user.
-- The result should include the user ID, username, and the total number of orders.

SELECT
    usr.user_id,
    usr.username,
    COUNT(ord.order_id) AS total_orders
FROM
    Users usr
LEFT JOIN
    Orders ord ON u.user_id = ord.user_id
GROUP BY
    usr.user_id, usr.username;

-- Problem 3: Retrieve the average rating for each product
-- Write an SQL query to retrieve the average rating for each product.
-- The result should include the product ID, product name, and the average rating.

SELECT
    prod.product_id,
    prod.product_name,
    AVG(rev.rating) AS average_rating
FROM
    Products prod
LEFT JOIN
    Reviews rev ON prod.product_id = rev.product_id
GROUP BY
    prod.product_id, prod.product_name;


-- Problem 4: Retrieve the top 5 users with the highest total amount spent on orders
-- Write an SQL query to retrieve the top 5 users with the highest total amount spent on orders.
-- The result should include the user ID, username, and the total amount spent.

SELECT
    usr.user_id,
    usr.username,
    SUM(o.total_amount) AS total_amount_spent
FROM
    Users usr
JOIN
    Orders ord ON u.user_id = ord.user_id
GROUP BY
    usr.user_id, usr.username
ORDER BY
    total_amount_spent DESC
LIMIT 5;
