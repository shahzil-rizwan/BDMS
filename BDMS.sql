CREATE DATABASE IF NOT EXISTS BDMS;

USE BDMS;

CREATE TABLE IF NOT EXISTS BDMS.LOGIN_CREDENTIALS(
login_id int NOT NULL,
login_username varchar(255) NOT NULL,
login_password varchar(255) NOT NULL,
user_role varchar(255) NOT NULL,
PRIMARY KEY (login_id)
);

INSERT INTO LOGIN_CREDENTIALS(login_id,login_username,login_password,user_role) VALUES ( 0,
    "admin",
    "admin",
    "admin");

CREATE TABLE IF NOT EXISTS BDMS.EMPLOYEES(
employee_id int NOT NULL,
mobile numeric,
email varchar(255),
age numeric,
gender varchar (255),
cnic varchar(255) NOT NULL,
roles varchar(255),
login_id int NOT NULL,
PRIMARY KEY (employee_id, cnic),
FOREIGN KEY (login_id) references LOGIN_CREDENTIALS (login_id)
);

CREATE TABLE IF NOT EXISTS BDMS.PRODUCTS(
prod_id int NOT NULL,
prod_category varchar(255) NOT NULL,
prod_name varchar(255) NOT NULL,
total_qty int NOT NULL,
cost_price int NOT NULL,
sale_price int NOT NULL,
discount_offer varchar(255),
discount_price int NOT NULL,
PRIMARY KEY (prod_id, prod_name),
CHECK (prod_category in ('Food', 'Dairy', 'Items')),
CHECK (sale_price > cost_price),
CHECK ((discount_offer = "Y" and discount_price > 0) or (discount_offer = "N" and discount_price = 0))
);

INSERT INTO PRODUCTS(prod_id, prod_category, prod_name, total_qty, cost_price, sale_price, discount_offer, discount_price) VALUES ( 1,
    "Dairy",
    "Milo",
    "150",
    "40",
    "50",
    "y",
    "45");

INSERT INTO PRODUCTS(prod_id, prod_category, prod_name, total_qty, cost_price, sale_price, discount_offer, discount_price) VALUES ( 2,
    "Dairy",
    "Cheese",
    "350",
    "15",
    "25",
    "n",
    "0");

INSERT INTO PRODUCTS(prod_id, prod_category, prod_name, total_qty, cost_price, sale_price, discount_offer, discount_price) VALUES ( 3,
    "Items",
    "Masks",
    "1200",
    "200",
    "225",
    "n",
    "0");

INSERT INTO PRODUCTS(prod_id, prod_category, prod_name, total_qty, cost_price, sale_price, discount_offer, discount_price) VALUES ( 4,
    "Items",
    "Pens",
    "2500",
    "30",
    "50",
    "n",
    "0");

CREATE TABLE IF NOT EXISTS BDMS.bill(
prod_id int NOT NULL,
prod_category varchar(255) NOT NULL,
prod_name varchar(255) NOT NULL,
total_qty int NOT NULL,
sale_price int NOT NULL,
PRIMARY KEY (prod_name, prod_category, total_qty)
);
