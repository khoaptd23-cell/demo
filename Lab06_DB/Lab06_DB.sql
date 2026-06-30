CREATE DATABASE lab06;
USE lab06;

CREATE TABLE Apartments (
    ApartmentID INT AUTO_INCREMENT PRIMARY KEY,
    ApartmentNumber VARCHAR(10) NOT NULL UNIQUE,
    Floor INT NOT NULL,
    Area DOUBLE NOT NULL,
    Status VARCHAR(50) NOT NULL
);

CREATE TABLE Households (
    HouseholdID INT AUTO_INCREMENT PRIMARY KEY,
    ApartmentID INT NOT NULL,
    HeadOfHousehold VARCHAR(100) NOT NULL,
    ContactNumber VARCHAR(15),
    Email VARCHAR(255),
    CONSTRAINT fk_households_apartments FOREIGN KEY (ApartmentID) 
        REFERENCES Apartments(ApartmentID)
);

CREATE TABLE Residents (
    ResidentID INT AUTO_INCREMENT PRIMARY KEY,
    HouseholdID INT NOT NULL,
    FullName VARCHAR(100) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    Relationship VARCHAR(50) NOT NULL,
    CONSTRAINT fk_residents_households FOREIGN KEY (HouseholdID) 
        REFERENCES Households(HouseholdID)
);

CREATE TABLE Parking (
    ParkingID INT AUTO_INCREMENT PRIMARY KEY,
    HouseholdID INT NULL,
    ParkingNumber VARCHAR(10) NOT NULL,
    VehicleType ENUM('Car', 'Motorbike') NOT NULL,
    Status ENUM('Occupied', 'Vacant') NOT NULL,
    CONSTRAINT fk_parking_households FOREIGN KEY (HouseholdID) 
        REFERENCES Households(HouseholdID)
);

CREATE TABLE Fees (
    FeeID INT AUTO_INCREMENT PRIMARY KEY,
    HouseholdID INT NOT NULL,
    FeeType VARCHAR(255) NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    DueDate DATE NOT NULL,
    Status ENUM('Paid', 'Unpaid') NOT NULL,
    CONSTRAINT fk_fees_households FOREIGN KEY (HouseholdID) 
        REFERENCES Households(HouseholdID)
);

CREATE TABLE Complaints (
    ComplaintID INT AUTO_INCREMENT PRIMARY KEY,
    HouseholdID INT NOT NULL,
    Description VARCHAR(1000) NOT NULL,
    SubmissionDate DATE NOT NULL,
    Status VARCHAR(255) NOT NULL,
    CONSTRAINT fk_complaints_households FOREIGN KEY (HouseholdID) 
        REFERENCES Households(HouseholdID)
);

INSERT INTO Apartments (ApartmentNumber, Floor, Area, Status) VALUES
('A-101', 1, 75.5, 'Occupied'),
('A-102', 1, 75.5, 'Vacant'),
('B-201', 2, 110.0, 'Occupied'),
('B-202', 2, 90.0, 'Occupied');

INSERT INTO Households (ApartmentID, HeadOfHousehold, ContactNumber, Email) VALUES
(1, 'John Doe', '0123456789', 'john.doe@email.com'),
(3, 'Alice Smith', '0987654321', 'alice.s@email.com'),
(4, 'Michael Brown', '0555123456', 'mbrown@email.com');

INSERT INTO Residents (HouseholdID, FullName, DateOfBirth, Gender, Relationship) VALUES
(1, 'John Doe', '1985-05-12', 'Male', 'Head'),
(1, 'Jane Doe', '1987-08-22', 'Female', 'Spouse'),
(1, 'Tommy Doe', '2015-01-30', 'Male', 'Child'),
(2, 'Alice Smith', '1990-11-04', 'Female', 'Head'),
(3, 'Michael Brown', '1978-03-15', 'Male', 'Head');

INSERT INTO Parking (HouseholdID, ParkingNumber, VehicleType, Status) VALUES
(1, 'P-01', 'Car', 'Occupied'),
(1, 'P-02', 'Motorbike', 'Occupied'),
(NULL, 'P-03', 'Car', 'Vacant'),
(2, 'P-04', 'Car', 'Occupied'),
(3, 'P-05', 'Motorbike', 'Occupied');

INSERT INTO Fees (HouseholdID, FeeType, Amount, DueDate, Status) VALUES
(1, 'Management Fee', 50.00, '2026-07-01', 'Paid'),
(1, 'Water Bill', 23.50, '2026-07-05', 'Unpaid'),
(2, 'Management Fee', 75.00, '2026-07-01', 'Paid'),
(3, 'Management Fee', 60.00, '2026-07-01', 'Unpaid'),
(3, 'Parking Fee', 15.00, '2026-07-01', 'Unpaid');

INSERT INTO Complaints (HouseholdID, Description, SubmissionDate, Status) VALUES
(1, 'Water leakage observed in the master bathroom ceiling.', '2026-06-10', 'In Progress'),
(3, 'The hallway light on the 2nd floor is flickering.', '2026-06-14', 'Pending');