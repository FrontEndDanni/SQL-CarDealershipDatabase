--INSERTING DATA INTO TABLES--
--NOTE TO SELF FOR NEXT TIME: use incrementing value type for all IDs
--1.) CITY TABLE:
INSERT INTO city (city_id, city_name)
VALUES (12, 'Anaheim');

INSERT INTO city (city_id, city_name)
VALUES (13, 'Tulsa');

INSERT INTO city (city_id, city_name)
VALUES (14, 'Orange');

--2.) ADDRESS TABLE:

INSERT INTO address (address_id, postal_code, address_name, city_id)
VALUES (10, '92876', 'Green St. 1276', 12);

INSERT INTO address(address_id, postal_code, address_name, city_id)
VALUES (11, '12454', 'Runners Ave., 1756', 12);

INSERT INTO address (address_id, postal_code, address_name, city_id)
VALUES (12, '94865', 'Wisteria Ln. 5365', 12);

--3.) CUSTOMER TABLE: 

INSERT INTO customer (customer_id, first_name, last_name, email, phone, address_id)
VALUES (1, 'Ralph', 'Johnson', 'rjohnson101@gmail.com', '(719)657-3121', 10);

INSERT INTO customer (customer_id, first_name, last_name, email, phone, address_id)
VALUES (2, 'Hannah', 'Montana', 'hmontana@hotmail.com', '(123)967-1536', 10);

INSERT INTO customer (customer_id, first_name, last_name, email, phone, address_id)
VALUES (3, 'Gina', 'Wilson', 'msginaw@aol.com', '(945)296-1952', 10);

-- 4.) CAR TABLE (forgot to call year column year_, so it doesnt confuse it with the SQL value type!): 

INSERT INTO car (car_id, serial_number, make, model, year, used_or_new)
VALUES (1, 19847593, 'Ford', 'Escape', '2015', True);

INSERT INTO car (car_id, serial_number, make, model, year, used_or_new)
VALUES (2, 198574, 'Tesla', 'Model 3', '2019', True);

INSERT INTO car(car_id, serial_number, make, model, year, used_or_new)
VALUES (3, 983942, 'Toyota', 'Camry', '2012', True);

SELECT *
FROM car;

-- 5.) SERVICE TABLE:
INSERT INTO service(service_id, service_type, amount)
VALUES (15, 'oil change', 30.99);

INSERT INTO service(service_id, service_type, amount)
VALUES(16, 'tire rotation', 100.99);

INSERT INTO service(service_id, service_type, amount)
VALUES(17, 'windshield repair', 350.00);

-- 6.) STAFF TABLE, make it password_ next time: 
INSERT INTO staff(staff_id, first_name, last_name, email, password)
VALUES(89, 'George', 'Mayhew', 'gmayhew@bestdealership.com', 'georgerocks101');

INSERT INTO staff(staff_id, first_name, last_name, email, password)
VALUES(90, 'Tom', 'Rhodes', 'trhodes@bestdealership.com', 'tomrocks102');

--7.) INVOICE TABLE:
INSERT INTO invoice(invoice_id, amount, date, car_id, customer_id, staff_id)
VALUES(12345, 55.99, '2011-10-10', 1, 1, 89);

INSERT INTO invoice(invoice_id, amount, date, car_id, customer_id, staff_id)
VALUES (67890, 100.99, '2011-11-10', 2, 2, 90);

INSERT INTO invoice(invoice_id, amount, date, car_id, customer_id, staff_id)
VALUES(90328, 25.99, '2011-12-10', 3, 3, 89);


-- INSERTING DATA INTO TABLES USING STORED FUNCTION -- 
-- 8.) PARTS INVENTORY TABLE:
CREATE OR REPLACE FUNCTION add_part(_part_id INT, _part_name VARCHAR, _amount NUMERIC)
RETURNS void 
AS $MAIN$
BEGIN
	INSERT INTO parts_inventory(part_id, part_name, amount)
	VALUES(_part_id, _part_name, _amount);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_part(106,'Tailpipe', 50.99);
SELECT *
FROM parts_inventory

-- 9.) PARTS LOG TABLE:
CREATE OR REPLACE FUNCTION add_parts_log(_parts_log_id INT, _part_id INT, _mechanic_id INT, _invoice_id INT)
RETURNS void 
AS $MAIN$
BEGIN
	INSERT INTO parts_log(parts_log_id, part_id, mechanic_id, invoice_id)
	VALUES(_parts_log_id, _part_id, _mechanic_id, _invoice_id);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_parts_log(1057, 106, 54321, 12345);
SELECT *
FROM parts_log

-- 10.) SERVICE_LOG TABLE
CREATE OR REPLACE FUNCTION add_service_log(_service_log_id INT, _service_id INT, _mechanic_id INT, _invoice_id INT)
RETURNS void 
AS $MAIN$
BEGIN
	INSERT INTO service_log(service_log_id, service_id, mechanic_id, invoice_id)
	VALUES(_service_log_id, _service_id, _mechanic_id, _invoice_id);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_service_log(1828, 15, 54321, 12345);
SELECT *
FROM parts_log;

--
