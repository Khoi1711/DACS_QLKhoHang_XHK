Create database QL_XNK
Use QL_XNK
CREATE TABLE products (
id_products  INT PRIMARY KEY,
name VARCHAR(255),
description TEXT,
price FLOAT,
quantity INT,
category VARCHAR(255)
);

Create table NhanVien(
id int IDENTITY (1,1) primary key,
name nvarchar(255),
phone varchar(20),
address varchar(255),
)

Create table Vitri(
	id varchar(10) primary key,
	id_products int ,
	input_day datetime,
	quantity int 
)

CREATE TABLE warehouses (
id INT PRIMARY KEY,
name VARCHAR(255),
address VARCHAR(255),
type VARCHAR(255)
);

CREATE TABLE imports (
id INT PRIMARY KEY,
date DATE,
product_id INT,
quantity INT,
warehouse_id INT,
FOREIGN KEY (product_id) REFERENCES products(id),
FOREIGN KEY (warehouse_id) REFERENCES warehouses(id)
);

CREATE TABLE exports (
id INT PRIMARY KEY,
date DATE,
product_id INT,
quantity INT,
warehouse_id INT,
FOREIGN KEY (product_id) REFERENCES products(id),
FOREIGN KEY (warehouse_id) REFERENCES warehouses(id)
);