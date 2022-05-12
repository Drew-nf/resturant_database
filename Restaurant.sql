create schema IF NOT EXISTS Restaurant;
use Restaurant;
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS users;
SET FOREIGN_KEY_CHECKS=1;
CREATE TABLE IF NOT EXISTS Users (user_id INT NOT NULL AUTO_INCREMENT,user_name VARCHAR(50) NOT NULL,PRIMARY KEY (user_id));

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS Drivers;
SET FOREIGN_KEY_CHECKS=1;
CREATE TABLE IF NOT EXISTS Drivers (
    Driver_id INT NOT NULL AUTO_INCREMENT,
    driver_name VARCHAR(50) NOT NULL,
    driver_phone_number VARCHAR(13) NOT NULL,
    PRIMARY KEY (driver_id)
);

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS Items;
SET FOREIGN_KEY_CHECKS=1;
CREATE TABLE IF NOT EXISTS Items (
    item_id INT NOT NULL AUTO_INCREMENT,
    item_desc VARCHAR(100),
    item_price DECIMAL(8 , 2 ) NOT NULL,
    PRIMARY KEY (item_id)
);


CREATE TABLE IF NOT EXISTS customer (
    customer_id INT NOT NULL AUTO_INCREMENT,
    customer_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (customer_id)
);

CREATE TABLE IF NOT EXISTS Orders (
    order_id INT NOT NULL AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_total DECIMAL(8 , 2 ) NOT NULL,
    type_order VARCHAR(20),
    order_datetime DATETIME NOT NULL,
    user_id INT NOT NULL,

    PRIMARY KEY (order_id),
    FOREIGN KEY (user_id)
        REFERENCES Users (user_id),
    FOREIGN KEY (customer_id)
        REFERENCES Customer (customer_id)
);
CREATE TABLE IF NOT EXISTS Deliveries (
    delivery_id INT NOT NULL AUTO_INCREMENT,
    driver_id INT NOT NULL,
    delivery_datetime DATETIME NOT NULL,
    delivery_status BOOLEAN NOT NULL,
     order_id INT NOT NULL,
    PRIMARY KEY (delivery_id),
    FOREIGN KEY (driver_id)
        REFERENCES Drivers (driver_id),
        FOREIGN KEY (order_id)
        REFERENCES Orders (order_id)
);

CREATE TABLE IF NOT EXISTS orderDetail (
    detail_id INT NOT NULL AUTO_INCREMENT,
    item_id INT NOT NULL,
    item_qty INT NOT NULL,
    top_qty INT,
    order_id INT NOT NULL,
    PRIMARY KEY (detail_id),
    FOREIGN KEY (order_id)
        REFERENCES Orders (order_id),
    FOREIGN KEY (item_id)
        REFERENCES Items (item_id)
);



CREATE TABLE IF NOT EXISTS phoneNumbers (
    phone_id INT NOT NULL AUTO_INCREMENT,
    customer_id INT NOT NULL,
    type_phone VARCHAR(10),
    phone_number VARCHAR(13),
    PRIMARY KEY (phone_id),
    FOREIGN KEY (customer_id)
        REFERENCES Customer (customer_id)
);

CREATE TABLE IF NOT EXISTS Zipcodes (
    zipcode INT NOT NULL,
    city VARCHAR(50),
    state VARCHAR(15),
    PRIMARY KEY (zipcode)
);
CREATE TABLE IF NOT EXISTS Address (
    address_id INT NOT NULL AUTO_INCREMENT,
    customer_id INT NOT NULL,
    type_address VARCHAR(10),
    address VARCHAR(30),
    state VARCHAR(15),
    zipcode INT NOT NULL,
    PRIMARY KEY (address_id),
    FOREIGN KEY (customer_id)
        REFERENCES Customer (customer_id),
    FOREIGN KEY (zipcode)
        REFERENCES Zipcodes (zipcode)
);


CREATE TABLE IF NOT EXISTS deliveryArea (
    delivery_area_id INT NOT NULL AUTO_INCREMENT,
    driver_id INT NOT NULL,
    zipcode INT NOT NULL,
    PRIMARY KEY (delivery_area_id),
    FOREIGN KEY (driver_id)
        REFERENCES Drivers (driver_id),
    FOREIGN KEY (zipcode)
        REFERENCES Zipcodes (zipcode)
);
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 0', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 0', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 0', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 0', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 0', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 0', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 0', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 0', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 0', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 1', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 1', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 1', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 1', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 1', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 1', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 1', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 1', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 1', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 10', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 10', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 10', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 10', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 10', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 10', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 10', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 10', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 10', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 11', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 11', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 11', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 11', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 11', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 11', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 11', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 11', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 11', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 100', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 100', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 100', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 100', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 100', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 100', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 100', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 100', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 100', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 101', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 101', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 101', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 101', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 101', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 101', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 101', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 101', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 101', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 110', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 110', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 110', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 110', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 110', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 110', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 110', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 110', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 110', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 111', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 111', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 111', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 111', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 111', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 111', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 111', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 111', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 111', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 1000', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 1000', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 1000', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 1000', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 1000', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 1000', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 1000', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 1000', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 1000', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 1001', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 1001', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 1001', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 1001', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 1001', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 1001', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 1001', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 1001', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 1001', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 1010', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 1010', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 1010', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 1010', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 1010', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 1010', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 1010', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 1010', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 1010', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 1011', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 1011', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 1011', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 1011', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 1011', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 1011', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 1011', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 1011', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 1011', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 1100', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 1100', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 1100', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 1100', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 1100', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 1100', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 1100', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 1100', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 1100', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 1101', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 1101', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 1101', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 1101', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 1101', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 1101', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 1101', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 1101', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 1101', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 1110', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 1110', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 1110', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 1110', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 1110', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 1110', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 1110', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 1110', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 1110', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 1111', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 1111', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 1111', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 1111', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 1111', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 1111', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 1111', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 1111', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 1111', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 10000', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 10000', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 10000', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 10000', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 10000', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 10000', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 10000', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 10000', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 10000', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 10001', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 10001', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 10001', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 10001', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 10001', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 10001', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 10001', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 10001', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 10001', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 10010', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 10010', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 10010', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 10010', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 10010', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 10010', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 10010', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 10010', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 10010', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 10011', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 10011', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 10011', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 10011', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 10011', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 10011', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 10011', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 10011', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 10011', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 10100', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 10100', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 10100', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 10100', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 10100', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 10100', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 10100', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 10100', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 10100', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 10101', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 10101', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 10101', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 10101', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 10101', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 10101', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 10101', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 10101', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 10101', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 10110', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 10110', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 10110', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 10110', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 10110', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 10110', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 10110', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 10110', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 10110', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 10111', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 10111', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 10111', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 10111', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 10111', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 10111', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 10111', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 10111', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 10111', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 11000', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 11000', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 11000', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 11000', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 11000', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 11000', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 11000', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 11000', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 11000', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 11001', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 11001', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 11001', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 11001', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 11001', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 11001', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 11001', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 11001', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 11001', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 11010', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 11010', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 11010', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 11010', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 11010', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 11010', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 11010', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 11010', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 11010', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 11011', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 11011', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 11011', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 11011', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 11011', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 11011', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 11011', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 11011', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 11011', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 11100', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 11100', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 11100', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 11100', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 11100', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 11100', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 11100', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 11100', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 11100', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 11101', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 11101', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 11101', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 11101', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 11101', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 11101', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 11101', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 11101', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 11101', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 11110', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 11110', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 11110', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 11110', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 11110', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 11110', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 11110', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 11110', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 11110', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 11111', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 11111', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 11111', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 11111', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 11111', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 11111', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 11111', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 11111', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 11111', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 100000', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 100000', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 100000', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 100000', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 100000', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 100000', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 100000', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 100000', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 100000', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 100001', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 100001', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 100001', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 100001', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 100001', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 100001', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 100001', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 100001', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 100001', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 100010', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 100010', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 100010', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 100010', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 100010', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 100010', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 100010', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 100010', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 100010', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 100011', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 100011', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 100011', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 100011', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 100011', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 100011', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 100011', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 100011', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 100011', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 100100', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 100100', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 100100', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 100100', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 100100', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 100100', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 100100', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 100100', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 100100', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 100101', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 100101', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 100101', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 100101', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 100101', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 100101', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 100101', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 100101', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 100101', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 100110', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 100110', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 100110', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 100110', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 100110', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 100110', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 100110', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 100110', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 100110', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 100111', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 100111', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 100111', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 100111', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 100111', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 100111', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 100111', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 100111', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 100111', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 101000', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 101000', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 101000', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 101000', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 101000', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 101000', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 101000', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 101000', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 101000', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 101001', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 101001', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 101001', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 101001', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 101001', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 101001', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 101001', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 101001', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 101001', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 101010', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 101010', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 101010', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 101010', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 101010', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 101010', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 101010', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 101010', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 101010', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 101011', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 101011', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 101011', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 101011', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 101011', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 101011', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 101011', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 101011', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 101011', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 101100', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 101100', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 101100', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 101100', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 101100', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 101100', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 101100', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 101100', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 101100', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 101101', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 101101', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 101101', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 101101', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 101101', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 101101', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 101101', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 101101', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 101101', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 101110', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 101110', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 101110', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 101110', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 101110', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 101110', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 101110', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 101110', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 101110', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 101111', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 101111', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 101111', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 101111', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 101111', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 101111', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 101111', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 101111', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 101111', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 110000', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 110000', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 110000', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 110000', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 110000', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 110000', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 110000', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 110000', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 110000', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 110001', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 110001', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 110001', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 110001', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 110001', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 110001', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 110001', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 110001', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 110001', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 110010', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 110010', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 110010', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 110010', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 110010', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 110010', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 110010', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 110010', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 110010', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 110011', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 110011', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 110011', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 110011', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 110011', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 110011', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 110011', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 110011', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 110011', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 110100', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 110100', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 110100', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 110100', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 110100', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 110100', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 110100', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 110100', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 110100', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 110101', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 110101', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 110101', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 110101', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 110101', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 110101', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 110101', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 110101', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 110101', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 110110', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 110110', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 110110', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 110110', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 110110', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 110110', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 110110', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 110110', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 110110', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 110111', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 110111', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 110111', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 110111', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 110111', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 110111', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 110111', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 110111', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 110111', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 111000', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 111000', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 111000', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 111000', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 111000', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 111000', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 111000', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 111000', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 111000', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 111001', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 111001', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 111001', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 111001', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 111001', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 111001', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 111001', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 111001', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 111001', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 111010', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 111010', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 111010', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 111010', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 111010', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 111010', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 111010', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 111010', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 111010', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 111011', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 111011', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 111011', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 111011', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 111011', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 111011', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 111011', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 111011', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 111011', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 111100', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 111100', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 111100', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 111100', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 111100', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 111100', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 111100', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 111100', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 111100', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 111101', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 111101', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 111101', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 111101', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 111101', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 111101', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 111101', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 111101', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 111101', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 111110', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 111110', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 111110', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 111110', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 111110', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 111110', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 111110', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 111110', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 111110', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Standard 111111', '10.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Thin 111111', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('medium Deep Dish 111111', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Standard 111111', '7.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Thin 111111', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('small Deep Dish 111111', '9.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Standard 111111', '11.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Thin 111111', '12.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('large Deep Dish 111111', '13.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('Bread Sticks', '4.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('chicken wings', '8.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('Salad', '3.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('Cookie', '2.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('Cake', '5.99' );
INSERT INTO `restaurant`.`items` ( `item_desc`, `item_price`) VALUES ('Bottle Water', '4.99' );
INSERT INTO `restaurant`.`items` (`item_desc`, `item_price`) VALUES ('2 Liter Bottle Coke', '4.99' );
INSERT INTO restaurant.users values (1, "Admin");
INSERT INTO restaurant.drivers (driver_name, driver_phone_number) VALUES ('tom', '(111)111-1111');
INSERT INTO restaurant.drivers (driver_name, driver_phone_number) VALUES ('rebbeca', '(111)111-1111');
INSERT INTO restaurant.drivers (driver_name, driver_phone_number) VALUES ('jeff', '(111)111-1111');
INSERT INTO restaurant.drivers (driver_name, driver_phone_number) VALUES ('joe', '(111)111-1111');
INSERT INTO restaurant.drivers (driver_name, driver_phone_number) VALUES ('jimmy', '(111)111-1111');
#INSERT INTO restaurant.zipcodes (zipcode, city, `state`) VALUES (11111, '11111', 'CA');
#INSERT INTO restaurant.customer (`customer_name`) VALUES ('jake');
#INSERT INTO restaurant.address (`customer_id`,`address`,`state`,`zipcode`) VALUES ('1','1','CA',11111);
#INSERT INTO restaurant.phonenumbers (`customer_id`,`type_phone`,`phone_number`) VALUES ('1','Home','(111)111-1111');

