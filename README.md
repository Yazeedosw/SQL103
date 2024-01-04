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
## Relation Concept
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
## Joins Concept
### Inner Join
Format:
```
SELECT column_name(s)
FROM table1
INNER JOIN table2
ON table1.column_name=table2.column_name;
```

### LEFT OUTER JOINS
Format: 
```
SELECT column_name(s)
FROM table1
LEFT OUTER JOIN table2
ON table1.column_name=table2.column_name;
```

###  RIGHT OUTER JOINS
Format: 
```
SELECT column_name(s)
FROM table1
RIGHT OUTER JOIN table2
ON table1.column_name=table2.column_name;
```
### CROSS JOINS 
Format : 
```
SELECT column1, column2,..
FROM table1 CROSS JOIN table2;
```

### NATURAL JOINS
Format: 
```
SELECT [column_names | *]
FROM table_name1
NATURAL JOIN table_name2;
```

## View Concept 
**View** : is a virtual table based on the result of a SELECT query. It does not store the data itself but provides a way to represent the result of a query as if it were a table. 

**Format View** : 
```
Create view ( name of view table Ex: high_grade )
As
Select ( columns you want in view Ex: student_name , score , level )
from (table name )
where (criteria you want EX: score>= 4.23) ;
```
view act as table if you want to display it either in the scheme or query 
Format of Query : 
```
Select * from ihgh_grade ; 
```
## index Concept 
**index** : index is a data structure that improves the speed of data retrieval operations on a database table at the cost of additional writes and storage space.

**Format index** 
```
CREATE INDEX IndexName
ON TableName (ColumnName);
```
To Display index : 
```
SHOW INDEX FROM TableName;
```
## PROCEDURE Concept 
**Procedure** : Stored procedures are stored in the database and can be invoked or called by name.

**Format** 
```
delimiter |/
CREATE PROCEDURE procedure_name (parameter _list)
BEGIN
statements;
END
```
To call the procedure :
```
CALL stored_procedure_name(argument_list);
```
