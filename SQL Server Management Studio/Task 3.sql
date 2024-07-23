CREATE TABLE department (
    department_id INT IDENTITY(1,1) PRIMARY KEY,
    department_name NVARCHAR(50) NOT NULL
);

CREATE TABLE employeee (
    employee_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name NVARCHAR(50) NOT NULL,
    last_name NVARCHAR(50) NOT NULL,
    salary DECIMAL(18, 2) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES department(department_id)
);

INSERT INTO department (department_name)
VALUES ('HR'),
       ('Finance'),
       ('Engineering'),
       ('Marketing');

INSERT INTO employeee (first_name, last_name, salary, department_id)
VALUES ('John', 'Doe', 50000.00, 1),
       ('Jane', 'Smith', 60000.00, 1),
       ('Emily', 'Jones', 70000.00, 2),
       ('Michael', 'Brown', 80000.00, 3),
       ('Sarah', 'Davis', 90000.00, 3),
       ('Robert', 'Wilson', 65000.00, 2),
       ('Alice', 'White', 72000.00, 4);


SELECT d.department_name,
COUNT(e.employee_id) AS number_of_employees
FROM department d
LEFT JOIN employeee e ON d.department_id = e.department_id
GROUP BY d.department_name;
