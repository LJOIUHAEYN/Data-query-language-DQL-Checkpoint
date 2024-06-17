SELECT
    *
FROM
    Customer;

SELECT
    product_Name,
    category
FROM
    Product
WHERE
    price BETWEEN 5000
    AND 10000;

SELECT
    *
FROM
    Product
ORDER BY
    price DESC;

SELECT
    COUNT(*) AS total_orders,
    AVG(Total_amount) AS average_amount,
    MAX(Total_amount) AS highest_total_amount,
    MIN(Total_amount) AS lowest_total_amount
FROM
    Orders;

SELECT
    product_id,
    COUNT(*) AS number_of_orders
FROM
    Orders
GROUP BY
    product_id;

SELECT
    customer_id
FROM
    Orders
GROUP BY
    customer_id
HAVING
    COUNT(*) > 2;

SELECT
    EXTRACT(
        MONTH
        FROM
            OrderDate
    ) AS month,
    COUNT(*) AS number_of_orders
FROM
    Orders
WHERE
    EXTRACT(
        YEAR
        FROM
            OrderDate
    ) = 2020
GROUP BY
    EXTRACT(
        MONTH
        FROM
            OrderDate
    )
ORDER BY
    month;

SELECT
    p.product_name,
    c.customer_Name,
    o.OrderDate
FROM
    Orders o
    JOIN Product p ON o.product_id = p.product_id
    JOIN Customer c ON o.customer_id = c.customer_id;

SELECT
    *
FROM
    Orders
WHERE
    OrderDate BETWEEN DATEADD(MONTH, -3, CURRENT_DATE)
    AND LAST_DAY(DATEADD(MONTH, -3, CURRENT_DATE));

SELECT
    customer_id
FROM
    Customer
WHERE
    customer_id NOT IN (
        SELECT
            customer_id
        FROM
            Orders
    );