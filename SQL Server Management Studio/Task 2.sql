CREATE TABLE employee (
    employee_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name NVARCHAR(50) NOT NULL,
    last_name NVARCHAR(50) NOT NULL,
    salary DECIMAL(18, 2) NOT NULL
);

INSERT INTO employee (first_name, last_name, salary)
VALUES ('John', 'Doe', 50000.00),
       ('Jane', 'Smith', 60000.00),
       ('Emily', 'Jones', 70000.00),
       ('Michael', 'Brown', 80000.00),
       ('Sarah', 'Davis', 90000.00);

SELECT MAX(salary) AS second_highest_salary
FROM employee
WHERE salary < (SELECT MAX(salary) FROM employee);

SELECT MAX(salary) AS third_highest_salary
FROM employee
WHERE salary < (SELECT MAX(salary) FROM employee
WHERE salary < (SELECT MAX(salary) FROM employee
WHERE salary < (SELECT MAX(salary) FROM employee))
);

