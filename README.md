# SQL103

##  FOREIGN KEY 
#### FOREIGN KEY: A foreign key is a column or a set of columns in a database table that refers to the primary key or a unique key of another table.
 
 ```
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);
`CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
```
