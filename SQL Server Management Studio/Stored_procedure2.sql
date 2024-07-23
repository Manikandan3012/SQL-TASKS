CREATE TABLE StudentAdmissions (
    StudentId INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15),
    Address VARCHAR(255),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME
);

CREATE PROCEDURE sp_StudentAdmissionCRUD
    @Action VARCHAR(10),
    @StudentId INT = NULL,
    @FirstName VARCHAR(50) = NULL,
    @LastName VARCHAR(50) = NULL,
    @DateOfBirth DATE = NULL,
    @Email VARCHAR(100) = NULL,
    @PhoneNumber VARCHAR(15) = NULL,
    @Address VARCHAR(255) = NULL
AS
BEGIN


    IF @Action = 'CREATE'
    BEGIN
        INSERT INTO StudentAdmissions (FirstName, LastName, DateOfBirth, Email, PhoneNumber, Address)
        VALUES (@FirstName, @LastName, @DateOfBirth, @Email, @PhoneNumber, @Address);
    END
    ELSE IF @Action = 'READ'
    BEGIN
        IF @StudentId IS NULL
        BEGIN
            SELECT * FROM StudentAdmissions;
        END
        ELSE
        BEGIN
            SELECT * FROM StudentAdmissions WHERE StudentId = @StudentId;
        END
    END
    ELSE IF @Action = 'UPDATE'
    BEGIN
        UPDATE StudentAdmissions
        SET FirstName = @FirstName,
            LastName = @LastName,
            DateOfBirth = @DateOfBirth,
            Email = @Email,
            PhoneNumber = @PhoneNumber,
            Address = @Address,
            UpdatedAt = GETDATE()
        WHERE StudentId = @StudentId;
    END
    ELSE IF @Action = 'DELETE'
    BEGIN
        DELETE FROM StudentAdmissions WHERE StudentId = @StudentId;
    END
    ELSE
    BEGIN
        RAISERROR('Invalid action specified. Use CREATE, READ, UPDATE, or DELETE.', 16, 1);
    END
END;

EXEC sp_StudentAdmissionCRUD 
    @Action = 'CREATE', 
    @FirstName = 'John', 
    @LastName = 'Doe', 
    @DateOfBirth = '2000-01-01', 
    @Email = 'john.doe@example.com', 
    @PhoneNumber = '1234567890', 
    @Address = '123 Main St';

EXEC sp_StudentAdmissionCRUD 
    @Action = 'READ';

EXEC sp_StudentAdmissionCRUD 
    @Action = 'READ', 
    @StudentId = 1;

EXEC sp_StudentAdmissionCRUD 
    @Action = 'UPDATE', 
    @StudentId = 1, 
    @FirstName = 'Mani', 
    @LastName = 'kandan', 
    @DateOfBirth = '2001-12-30', 
    @Email = 'mani@example.com', 
    @PhoneNumber = '0987654321', 
    @Address = '456 Elm St';

EXEC sp_StudentAdmissionCRUD 
    @Action = 'DELETE', 
    @StudentId = 1;
