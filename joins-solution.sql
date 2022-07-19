-- Get all customers and their addresses.
SELECT * FROM "customers" 
JOIN "addresses" 
ON "customers"."id" = "addresses"."customer_id";

-- Get all orders and their line items (orders, quantity and product).
SELECT * FROM "line_items" 
JOIN "orders" ON "orders"."id" = "line_items"."order_id" 
JOIN "products" ON "products"."id" = "line_items"."product_id";

-- Which warehouses have cheetos?
SELECT * FROM "warehouse" 
JOIN "warehouse_product" ON "warehouse"."id" = "warehouse_product"."warehouse_id" 
JOIN "products" ON "products"."id" = "warehouse_product"."product_id" 
WHERE "products"."description" = 'cheetos';

-- Which warehouses have diet pepsi?
SELECT * FROM "warehouse" 
JOIN "warehouse_product" ON "warehouse"."id" = "warehouse_product"."warehouse_id" 
JOIN "products" ON "products"."id" = "warehouse_product"."product_id" 
WHERE "products"."description" = 'diet pepsi';

-- Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "orders"."address_id" , count("orders"."id") FROM "orders" 
JOIN "addresses" ON "addresses"."id" = "orders"."address_id" 
JOIN "customers" ON "customers"."id" = "addresses"."customer_id" 
GROUP BY "orders"."address_id";

-- How many customers do we have?
SELECT count(*) FROM "customers";

-- How many products do we carry?
SELECT count(*) FROM "products";

-- What is the total available on-hand quantity of diet pepsi?
SELECT sum("warehouse_product"."on_hand") FROM "warehouse_product" JOIN "products" ON "products"."id" = "warehouse_product"."product_id" WHERE "products"."description" = 'diet pepsi';

