# SQL103

##  FOREIGN KEY 
#### FOREIGN KEY: A foreign key is a column or a set of columns in a database table that refers to the primary key or a unique key of another table.

 #### Example:
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
IF the table is already created and you want ti add foreign key for it EX:
```
ALTER TABLE table_name
ADD FOREIGN KEY (col_name) REFERENCES table_name(col_name);
```
## Relation 
#### Types of Relationships:
1- One-to-One (1:1): Each row in one table is related to only one row in another table.
```
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50)
);

CREATE TABLE employee_details (
    employee_id INT PRIMARY KEY,
    birth_date DATE,
    address VARCHAR(100),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
```
2- One-to-Many (1:N): Each row in one table can be related to multiple rows in 
```
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

```
3-Many-to-One (N:1): Multiple rows in one table can be related to a single row in 
```
CREATE TABLE countries (
    country_id INT PRIMARY KEY,
    country_name VARCHAR(50)
);

CREATE TABLE cities (
    city_id INT PRIMARY KEY,
    city_name VARCHAR(50),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES countries(country_id)
);

```
4-Many-to-Many (N:N): Multiple rows in one table can be related to multiple rows in another table.
```
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);

CREATE TABLE student_courses (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
```

