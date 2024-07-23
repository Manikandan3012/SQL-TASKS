CREATE TABLE departments (
    department_id INT IDENTITY(1,1) PRIMARY KEY,
    department_name NVARCHAR(50) NOT NULL
);


CREATE TABLE employees (
    employee_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name NVARCHAR(50) NOT NULL,
    last_name NVARCHAR(50) NOT NULL,
    salary DECIMAL(18, 2) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

INSERT INTO departments (department_name)
VALUES ('HR'),
       ('Finance'),
       ('Engineering'),
       ('Marketing');

INSERT INTO employees (first_name, last_name, salary, department_id)
VALUES ('John', 'Doe', 50000.00, 1),
       ('Jane', 'Smith', 60000.00, 1),
       ('Emily', 'Jones', 70000.00, 2),
       ('Michael', 'Brown', 80000.00, 3),
       ('Sarah', 'Davis', 90000.00, 3),
       ('Alice', 'White', 72000.00, 4),
       ('Bob', 'Black', 65000.00, NULL); 


SELECT e.first_name, e.last_name, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id;

SELECT e.first_name, e.last_name, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id;

SELECT e.first_name, e.last_name, d.department_name
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.department_id;

SELECT e.first_name, e.last_name, d.department_name
FROM employees e
FULL JOIN departments d ON e.department_id = d.department_id;

