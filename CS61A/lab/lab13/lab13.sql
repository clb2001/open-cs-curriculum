.read data.sql

-- 注意命名
-- 这些SQL都很简单(除了第三题)
CREATE TABLE average_prices AS
  SELECT category, avg(MSRP) as average_price FROM products GROUP BY category;


CREATE TABLE lowest_prices AS
  SELECT store, item, MIN(price) FROM inventory GROUP BY item;


-- 这一题栽了大跟头
CREATE TABLE shopping_list AS
  SELECT name, store FROM
  (SELECT decision.name as name, inventory.store as store, MIN(inventory.price) FROM 
  (select name, MIN(products.MSRP / products.rating) AS T
  FROM products GROUP BY products.category) AS decision, inventory
  WHERE decision.name = inventory.item 
  GROUP BY inventory.item);


CREATE TABLE total_bandwidth AS
  SELECT sum(stores.Mbs) FROM shopping_list, stores
  WHERE shopping_list.store = stores.store;

