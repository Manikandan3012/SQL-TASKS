-- Create db
CREATE DATABASE user_db;
USE user_db;

-- Create signup table
CREATE TABLE signup (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    username NVARCHAR(50) NOT NULL UNIQUE,
    email NVARCHAR(100) NOT NULL UNIQUE,
    password_hash NVARCHAR(255) NOT NULL,  -- Store hashed passwords for security
    created_at DATETIME DEFAULT GETDATE()
);

-- Create login table
CREATE TABLE login (
    login_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT,
    login_time DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES signup(user_id)
);

-- Insert data into the signup table
INSERT INTO signup (username, email, password_hash) 
VALUES ('johndoe', 'john.doe@example.com', '1234'),
       ('mani', 'manimca@example.com', '5678'),
       ('raja', 'rajacly@example.com', '9012');

-- Update data in the signup table
UPDATE signup
SET email = 'john.newemail@example.com'
WHERE username = 'johndoe';

-- Select data from the signup table
SELECT * FROM signup WHERE username = 'johndoe';

-- Delete data from the signup table
DELETE FROM signup WHERE username = 'johndoe';

-- Select all data from the signup table
SELECT * FROM signup;
