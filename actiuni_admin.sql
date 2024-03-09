

/*Admin*/
/*All client A-Z*/
SELECT * FROM customers
ORDER BY full_name;

/*All client order by id*/
SELECT * FROM customers
ORDER BY id;

/*All orders*/
SELECT * FROM orders
ORDER BY id;

/*All orders by customer_id*/
SELECT products.name AS 'Product name',_order_Details.price AS 'Price',_order_Details.quantity AS 'Quantity',_order.order_date AS 'Date order'
FROM products
JOIN online_shop.order_details _order_Details ON products.id = _order_Details.product_id
JOIN  online_shop.orders _order ON _order_Details.order_id = _order.id
WHERE _order.customer_id = 101
ORDER BY name;

/*All options*/
SELECT * FROM options;

/*Delete a client*/
DELETE FROM customers
WHERE id = 104;

/*Delete a order*/
DELETE FROM orders
WHERE id = 204;
DELETE FROM order_details
WHERE order_id = 204;

/*Delete a product*/
DELETE FROM products
WHERE id = 6;

/*Update a product*/
UPDATE products SET stock = stock+1
WHERE id = 1;

/*Update date on order*/
UPDATE orders SET shipping_address = 'sadu'
WHERE customer_id = 103;


/*The most expensive order*/
SELECT * FROM orders
ORDER BY ammount DESC
LIMIT 1;

/*The most purchased product*/
SELECT _product.name,_product.price,COUNT(product_id) AS 'Count purchased' FROM order_details
JOIN online_shop.products _product on order_details.product_id = _product.id
GROUP BY _product.name, _product.price
LIMIT 1;



