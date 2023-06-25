CREATE TABLE customers (
	customer_id int PRIMARY KEY,
	customer_name VARCHAR (50) NOT NULL,
	address VARCHAR (250) NOT NULL,
	email VARCHAR (50) NOT NULL);
	
CREATE TABLE states (
	state_id int PRIMARY KEY,
	restaurant_state VARCHAR (50) NOT NULL,
	restaurant_zip_code VARCHAR (50) NOT NULL);
		
CREATE TABLE foods (
	food_id int PRIMARY KEY,
	food_name VARCHAR (50) NOT NULL,
	item_description VARCHAR (250) NOT NULL,
	unit_price int NOT NULL);
	/*
	FOREIGN KEY (product_id) REFERENCES products (product_id),
	FOREIGN KEY (customer_id) REFERENCES customers (customer_id));
	*/
	
CREATE TABLE restaurants (
	restaurant_id int PRIMARY KEY UNIQUE,
	restaurant_name VARCHAR (50) NOT NULL,
	restaurant_address_1 VARCHAR (250) DEFAULT NULL,
	restaurant_address_line2 VARCHAR (250) DEFAULT NULL,
	restaurant_city VARCHAR (50) DEFAULT NULL,
	state_id int NOT NULL,
	FOREIGN KEY (state_id) REFERENCES restaurants (state_id));
	
CREATE TABLE orders (
	order_id int PRIMARY KEY,
	order_date DATE NOT NULL,
	customer_id int NOT NULL,
	food_id int NOT NULL,
	quantity int NOT NULL,
	restaurant_id int NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
	FOREIGN KEY (food_id) REFERENCES foods (food_id),
	FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id));
		
CREATE TABLE menu (
	menu_id int PRIMARY KEY,
	restaurant_id int NOT NULL,
	food_id int NOT NULL,
	FOREIGN KEY (restaurant_id) REFERENCES restaurants (restaurant_id),
	FOREIGN KEY (food_id) REFERENCES foods (food_id));

	
	
