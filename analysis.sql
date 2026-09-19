-- Northwind Traders Sales Analysis
-- PostgreSQL / pgAdmin 4

-- 1. DATA QUALITY
SELECT COUNT(orderid) AS total_orders FROM orders;

SELECT COUNT(*) AS num_shippeddate_is_null
FROM orders
WHERE shippeddate IS NULL;

SELECT COUNT(*) AS invalid_quantity
FROM order_details
WHERE quantity <= 0;

SELECT COUNT(*) AS invalid_unitprice
FROM order_details
WHERE unitprice <= 0;

SELECT COUNT(*) AS invalid_discount
FROM order_details
WHERE discount < 0 OR discount > 1;


-- 2. SALES OVERVIEW
SELECT SUM(od.quantity * od.unitprice * (1 - od.discount)) AS revenue
FROM orders o
INNER JOIN order_details od ON o.orderid = od.orderid;

SELECT SUM(quantity) AS total_products_sold
FROM order_details;

WITH total_orders_revenue AS (
    SELECT
        COUNT(DISTINCT o.orderid) AS total_orders,
        SUM(od.quantity * od.unitprice * (1 - od.discount)) AS total_revenue
    FROM order_details od
    INNER JOIN orders o ON od.orderid = o.orderid
)
SELECT ROUND(total_revenue / total_orders, 2) AS average_order_value
FROM total_orders_revenue;


-- 3. SALES TREND
WITH year_total AS (
    SELECT
        EXTRACT(YEAR FROM o.orderdate) AS year_revenue,
        SUM(od.quantity * od.unitprice * (1 - od.discount)) AS total_revenue
    FROM orders o
    INNER JOIN order_details od ON o.orderid = od.orderid
    GROUP BY 1
)
SELECT year_revenue, total_revenue
FROM year_total
ORDER BY year_revenue;

WITH month_total AS (
    SELECT
        DATE_TRUNC('month', o.orderdate) AS month_revenue,
        SUM(od.quantity * od.unitprice * (1 - od.discount)) AS total_revenue
    FROM orders o
    INNER JOIN order_details od ON o.orderid = od.orderid
    GROUP BY DATE_TRUNC('month', o.orderdate)
)
SELECT month_revenue, total_revenue
FROM month_total
ORDER BY month_revenue;


-- 4. PRODUCT ANALYSIS
WITH product_total AS (
    SELECT
        p.productname,
        SUM(od.quantity) AS total_product_sold,
        ROUND(SUM(od.quantity * od.unitprice * (1 - od.discount)), 2) AS revenue
    FROM products p
    INNER JOIN order_details od ON p.productid = od.productid
    GROUP BY p.productname
)
SELECT productname, total_product_sold, revenue
FROM product_total
ORDER BY revenue DESC;

WITH product_total AS (
    SELECT
        p.productname,
        SUM(od.quantity) AS total_product_sold,
        ROUND(SUM(od.quantity * od.unitprice * (1 - od.discount)), 2) AS revenue
    FROM products p
    INNER JOIN order_details od ON p.productid = od.productid
    GROUP BY p.productname
)
SELECT productname, total_product_sold, revenue
FROM product_total
ORDER BY revenue DESC
LIMIT 10;

WITH product_total AS (
    SELECT
        p.productname,
        SUM(od.quantity) AS total_product_sold,
        ROUND(SUM(od.quantity * od.unitprice * (1 - od.discount)), 2) AS revenue
    FROM products p
    INNER JOIN order_details od ON p.productid = od.productid
    GROUP BY p.productname
)
SELECT productname, total_product_sold, revenue
FROM product_total
ORDER BY total_product_sold DESC
LIMIT 10;


-- 5. CUSTOMER ANALYSIS
WITH total_orders_revenue AS (
    SELECT
        c.contactname AS customer_name,
        ROUND(SUM(od.quantity * od.unitprice * (1 - od.discount)), 2) AS total_revenue,
        COUNT(DISTINCT o.orderid) AS total_orders
    FROM orders o
    INNER JOIN customers c ON o.customerid = c.customerid
    INNER JOIN order_details od ON o.orderid = od.orderid
    GROUP BY c.contactname
)
SELECT
    customer_name,
    total_revenue,
    total_orders,
    ROUND(total_revenue / total_orders, 2) AS aov
FROM total_orders_revenue
ORDER BY total_revenue DESC;

WITH total_orders_revenue AS (
    SELECT
        c.contactname AS customer_name,
        ROUND(SUM(od.quantity * od.unitprice * (1 - od.discount)), 2) AS total_revenue,
        COUNT(DISTINCT o.orderid) AS total_orders
    FROM orders o
    INNER JOIN customers c ON o.customerid = c.customerid
    INNER JOIN order_details od ON o.orderid = od.orderid
    GROUP BY c.contactname
)
SELECT customer_name, total_revenue, total_orders,
       ROUND(total_revenue / total_orders, 2) AS aov
FROM total_orders_revenue
ORDER BY total_revenue DESC
LIMIT 10;

WITH total_orders_revenue AS (
    SELECT
        c.contactname AS customer_name,
        ROUND(SUM(od.quantity * od.unitprice * (1 - od.discount)), 2) AS total_revenue,
        COUNT(DISTINCT o.orderid) AS total_orders
    FROM orders o
    INNER JOIN customers c ON o.customerid = c.customerid
    INNER JOIN order_details od ON o.orderid = od.orderid
    GROUP BY c.contactname
)
SELECT customer_name, total_revenue, total_orders,
       ROUND(total_revenue / total_orders, 2) AS aov
FROM total_orders_revenue
ORDER BY total_orders DESC
LIMIT 10;

WITH total_orders_revenue AS (
    SELECT
        c.contactname AS customer_name,
        ROUND(SUM(od.quantity * od.unitprice * (1 - od.discount)), 2) AS total_revenue,
        COUNT(DISTINCT o.orderid) AS total_orders
    FROM orders o
    INNER JOIN customers c ON o.customerid = c.customerid
    INNER JOIN order_details od ON o.orderid = od.orderid
    GROUP BY c.contactname
)
SELECT customer_name, total_revenue, total_orders,
       ROUND(total_revenue / total_orders, 2) AS aov
FROM total_orders_revenue
ORDER BY aov ASC
LIMIT 10;


-- 6. DELIVERY ANALYSIS
SELECT orderid, orderdate, shippeddate,
       shippeddate - orderdate AS delivery_days
FROM orders
WHERE shippeddate IS NOT NULL;

SELECT ROUND(AVG(shippeddate - orderdate), 2) AS average_delivery_days
FROM orders
WHERE shippeddate IS NOT NULL;

SELECT
    sh.companyname,
    ROUND(AVG(o.shippeddate - o.orderdate), 2) AS avg_day_diff,
    COUNT(o.orderid) AS total_orders
FROM orders o
INNER JOIN shippers sh ON o.shipvia = sh.shipperid
WHERE o.shippeddate IS NOT NULL
GROUP BY sh.companyname
ORDER BY avg_day_diff DESC;

SELECT orderid, orderdate, shippeddate,
       shippeddate - orderdate AS delivery_days
FROM orders
WHERE shippeddate IS NOT NULL
  AND (shippeddate - orderdate) > 8.49
ORDER BY delivery_days DESC;
