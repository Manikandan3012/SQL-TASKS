-- Create Table
CREATE TABLE Users (
    UserId INT PRIMARY KEY IDENTITY(1,1),
    Username NVARCHAR(50) NOT NULL,
    Password NVARCHAR(255) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE()
);

-- Create Stored Procedure
CREATE PROCEDURE sp_CreateUser
    @Username NVARCHAR(50),
    @Password NVARCHAR(255),
    @Email NVARCHAR(100)
AS
BEGIN
    INSERT INTO Users (Username, Password, Email)
    VALUES (@Username, @Password, @Email);
END;

-- Read Stored Procedure
CREATE PROCEDURE sp_ReadUser
    @UserId INT = NULL
AS
BEGIN
    IF @UserId IS NULL
    BEGIN
        SELECT * FROM Users;
    END
    ELSE
    BEGIN
        SELECT * FROM Users WHERE UserId = @UserId;
    END
END;

-- Update Stored Procedure
CREATE PROCEDURE sp_UpdateUser
    @UserId INT,
    @Username NVARCHAR(50),
    @Password NVARCHAR(255),
    @Email NVARCHAR(100)
AS
BEGIN
    UPDATE Users
    SET Username = @Username,
        Password = @Password,
        Email = @Email
    WHERE UserId = @UserId;
END;

-- Delete Stored Procedure
CREATE PROCEDURE sp_DeleteUser
    @UserId INT
AS
BEGIN
    DELETE FROM Users
    WHERE UserId = @UserId;
END;

EXEC sp_CreateUser @Username = 'Manikandan', @Password = '123456789', @Email = 'mani@example.com';
EXEC sp_ReadUser;
EXEC sp_ReadUser @UserId = 4;
EXEC sp_UpdateUser @UserId = 4, @Username = 'Manikandan_updated', @Password = '987654321', @Email = 'mani_updated@example.com';
EXEC sp_DeleteUser @UserId = 3;

