CREATE DATABASE IF NOT EXISTS hw2;

USE hw2;

CREATE TABLE IF NOT EXISTS sales (
  id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  order_date DATE NOT NULL,
  count_product INT UNSIGNED
);

INSERT INTO sales (order_date, count_product) 
VALUES 
  ('2023-01-11', 202), 
  ('2023-12-22', 50), 
  ('2023-07-05', 101), 
  ('2023-11-17', 12), 
  ('2023-08-24', 705);
  
  SELECT * FROM sales;
  
  SELECT id AS 'номер заказа',
CASE
	WHEN count_product < 100 THEN "Маленький"
    WHEN count_product >= 100 AND count_product <= 300 THEN "Средний"
	WHEN count_product > 300 THEN "Большой"
    ELSE "Пусто"
END AS 'тип'
FROM sales;


CREATE TABLE IF NOT EXISTS orders (
  id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  employee_id VARCHAR(5),
  amount FLOAT,
  order_status VARCHAR(25) NOT NULL
);

INSERT INTO orders (employee_id, amount, order_status)
VALUES 
	('раб1', 1050, 'OPEN'),
	('раб5', 999.9, 'OPEN'),
	('раб3', 3.50, 'CLOSED'),
	('раб3', 11.22, 'OPEN'),
	('раб2', 1481.9, 'CANCELLED');
    
SELECT *,
CASE
	WHEN order_status = 'OPEN' THEN "заказ открыт"
    WHEN order_status = 'CLOSED' THEN "заказ закрыт"
	WHEN order_status = 'CANCELLED' THEN "заказ отменен"
    ELSE "Нет данных"
END AS статус_заказа_по_русски
FROM orders;