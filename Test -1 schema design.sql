Drop database if exists Shopping_Management ;
create database Shopping_Management;
use Shopping_Management;
create table customers (
    Customer_Id INT AUTO_INCREMENT PRIMARY KEY,
    Customer_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(255) UNIQUE,
    Phone_Number CHAR(10) NOT NULL UNIQUE,
    Age INT CHECK (Age > 0),
    Gender ENUM('Male', 'Female', 'Other'),
    Country VARCHAR(50) DEFAULT 'India',
    City VARCHAR(50) NOT NULL,
    Pincode CHAR(6) DEFAULT '201301',
    Registration_Date DATE DEFAULT (CURRENT_DATE),
    Registration_Time TIME DEFAULT (CURRENT_TIME),
    Created_At DATETIME DEFAULT CURRENT_TIMESTAMP,
    Address VARCHAR(250),
    Customer_Status ENUM('Active', 'Inactive', 'Blocked') DEFAULT 'Active',
    Customer_Notes VARCHAR(1000)
);

select * from customers;

insert into customers
(Customer_Name, Email, Phone_Number, Age, Gender, Country, City, Pincode, Address, Customer_Status, Customer_Notes)
values
('Rahul Sharma', 'rahul@gmail.com', '9876543210', 25, 'Male', 'India', 'Noida', '201301', 'Sector 15, Noida', 'Active', 'Regular customer'),

('Priya Verma', 'priya@gmail.com', '9876543211', 22, 'Female', 'India', 'Delhi', '110001', 'Connaught Place, Delhi', 'Active', 'Interested in new products'),

('Amit Kumar', 'amit@gmail.com', '9876543212', 30, 'Male', 'India', 'Lucknow', '226001', 'Hazratganj, Lucknow', 'Inactive', 'Inactive customer'),

('Neha Singh', 'neha@gmail.com', '9876543213', 27, 'Female', 'India', 'Jaipur', '302001', 'Malviya Nagar, Jaipur', 'Active', 'Frequent shopper');


create table orders (
    Order_Id INT AUTO_INCREMENT PRIMARY KEY,
    Customer_Id INT,
    Order_Date DATE DEFAULT (CURRENT_DATE),
    Order_Amount DECIMAL(10,2) NOT NULL,
    Order_Status ENUM('Pending','Processing','Shipped','Delivered','Cancelled')
        DEFAULT 'Pending',
    Payment_Method ENUM('Cash','Card','UPI','Net Banking'),
    Payment_Status ENUM('Pending','Paid','Failed') DEFAULT 'Pending',
    Shipping_Address VARCHAR(250) NOT NULL,
    Delivery_Pincode CHAR(6),
    Quantity INT NOT NULL CHECK (Quantity > 0),
    Discount_Amount DECIMAL(10,2) DEFAULT 0.00,
    Delivery_Date DATE NULL,
    Created_At DATETIME DEFAULT CURRENT_TIMESTAMP,
    Tracking_Number VARCHAR(30) UNIQUE,
    Delivery_Status ENUM('Not Dispatched','In Transit','Delivered','Returned') DEFAULT 'Not Dispatched',
    Order_Notes VARCHAR(1000),

    foreign key(Customer_Id) references customers(Customer_Id) on delete cascade,
    foreign key (Customer_Id) references customers(Customer_Id) on update cascade
);
select * from orders;

insert into orders
(Customer_Id, Order_Amount, Order_Status, Payment_Method, Payment_Status, Shipping_Address, Delivery_Pincode, Quantity, Discount_Amount, Delivery_Date, Tracking_Number, Delivery_Status, Order_Notes)
values
(1, 1500.00, 'Pending', 'UPI', 'Paid', 'Sector 15 Noida', '201301', 2, 100.00, NULL, 'TRK1001', 'Not Dispatched', 'First order'),

(2, 2500.00, 'Processing', 'Card', 'Paid', 'Connaught Place Delhi', '110001', 3, 200.00, NULL, 'TRK1002', 'Not Dispatched', 'Gift order'),

(3, 800.00, 'Shipped', 'Cash', 'Pending', 'Hazratganj Lucknow', '226001', 1, 0.00, NULL, 'TRK1003', 'In Transit', 'Urgent delivery');
 
select * from customers;
select * from orders;