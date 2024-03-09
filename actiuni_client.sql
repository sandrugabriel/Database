
/*Client*/
/*My orders products*/
SELECT name,products.price
FROM products
JOIN online_shop.order_details _order_Details ON products.id = _order_Details.product_id
JOIN  online_shop.orders _order ON _order_Details.order_id = _order.id
WHERE _order.customer_id = 100;

/*All products Low price - Hight price*/
SELECT products.name,products.price,products.stock
FROM products
ORDER BY price;

/*All products Hight price - Low price*/
SELECT products.name,products.price,products.stock
FROM products
ORDER BY price DESC;

/*Options for product*/
SELECT options.option_name
FROM options
JOIN online_shop.product_options _product_options on options.id = _product_options.option_id
JOIN online_shop.products _options on _options.id = _product_options.product_id
WHERE product_id = 4;

/*All category A-Z*/
SELECT categories.name
FROM categories
ORDER BY name;

/*All category Z-A*/
SELECT categories.name
FROM categories
ORDER BY name DESC;

/*All category*/
SELECT * FROM categories;

DELETE FROM categories
WHERE id = 1;

/*My orders A-Z*/
SELECT products.name AS 'Product name',_order_Details.price AS 'Price',_order_Details.quantity AS 'Quantity',_order.order_date AS 'Date order'
FROM products
JOIN online_shop.order_details _order_Details ON products.id = _order_Details.product_id
JOIN  online_shop.orders _order ON _order_Details.order_id = _order.id
WHERE _order.customer_id = 100
ORDER BY name;

/*My orders Z-A*/
SELECT products.name AS 'Product name',_order_Details.price AS 'Price',_order_Details.quantity AS 'Quantity',_order.order_date AS 'Date order'
FROM products
JOIN online_shop.order_details _order_Details ON products.id = _order_Details.product_id
JOIN  online_shop.orders _order ON _order_Details.order_id = _order.id
WHERE _order.customer_id = 100
ORDER BY name DESC;

/*My orders*/
SELECT products.name AS 'Product name',_order_Details.price AS 'Price',_order_Details.quantity AS 'Quantity',_order.order_date AS 'Date order'
FROM products
JOIN online_shop.order_details _order_Details ON products.id = _order_Details.product_id
JOIN  online_shop.orders _order ON _order_Details.order_id = _order.id
WHERE _order.customer_id = 100;

