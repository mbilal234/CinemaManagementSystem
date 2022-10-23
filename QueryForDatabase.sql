DROP SCHEMA IF EXISTS Cinema;
CREATE SCHEMA Cinema;
USE Cinema;

CREATE TABLE `Theatre`(
    `Theatre_ID` INT UNSIGNED NOT NULL,
    `Name` VARCHAR(255) NOT NULL,
    `Capacity` INT NOT NULL
);
ALTER TABLE
    `Theatre` ADD PRIMARY KEY `Theatre`(`Theatre_ID`);
    
CREATE TABLE `Film`(
    `Film_Name` VARCHAR(255) NOT NULL,
    `Film_ID` INT NOT NULL,
    `Theatre_ID` INT UNSIGNED NOT NULL,
    FOREIGN KEY (Theatre_ID) REFERENCES `Theatre`(`Theatre_ID`));
    
ALTER TABLE
    `Film` ADD PRIMARY KEY `Film`(`Film_ID`);
CREATE TABLE `Film_Time`(
    `Time` DATETIME NOT NULL,
    `Film_ID` INT NOT NULL,
	FOREIGN KEY (Film_ID) REFERENCES Film(Film_ID));
    
CREATE TABLE `Employee`(
    `EmpID` INT UNSIGNED NOT NULL,
    `Name` VARCHAR(255) NOT NULL,
    `Job` VARCHAR(255) NOT NULL,
    `HireDate` DATE NOT NULL
);
ALTER TABLE
    `Employee` ADD PRIMARY KEY `employee_empid_primary`(`EmpID`);
CREATE TABLE `Seats`(
    `SeatNumber` INT UNSIGNED NOT NULL,
    `Available` TINYINT(1) NOT NULL,
    `Theatre_ID` INT UNSIGNED NOT NULL,
	FOREIGN KEY (Theatre_ID) REFERENCES Theatre(Theatre_ID));

CREATE TABLE `Customer`(
    `CustomerID` INT UNSIGNED NOT NULL,
    `Name` VARCHAR(255) NOT NULL,
    `NumSeats` INT NOT NULL,
    `Film_ID` INT NOT NULL,
    `SeatNumber` INT UNSIGNED NOT NULL,
    `Member` TINYINT(1) NOT NULL);

ALTER TABLE
    `Customer` ADD PRIMARY KEY `customer_customerid_primary`(`CustomerID`);