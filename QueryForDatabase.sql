CREATE TABLE `Theatre`(
    `Theatre_ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `Name` VARCHAR(255) NOT NULL,
    `Capacity` INT NOT NULL
);
ALTER TABLE
    `Theatre` ADD PRIMARY KEY `theatre_theatre_id_primary`(`Theatre_ID`);
CREATE TABLE `Film`(
    `Film_Name` VARCHAR(255) NOT NULL,
    `Film_ID` INT NOT NULL,
    `Theatre_ID` INT NOT NULL
);
ALTER TABLE
    `Film` ADD PRIMARY KEY `film_film_name_primary`(`Film_Name`);
CREATE TABLE `Film Time`(
    `Time` DATETIME NOT NULL,
    `Film_ID` INT NOT NULL
);
ALTER TABLE
    `Film Time` ADD PRIMARY KEY `film time_time_primary`(`Time`);
CREATE TABLE `Employee`(
    `EmpID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `Name` VARCHAR(255) NOT NULL,
    `Job` VARCHAR(255) NOT NULL,
    `HireDate` DATE NOT NULL
);
ALTER TABLE
    `Employee` ADD PRIMARY KEY `employee_empid_primary`(`EmpID`);
CREATE TABLE `Seats`(
    `SeatNumber` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `Available` TINYINT(1) NOT NULL,
    `Theatre_ID` INT NOT NULL
);
ALTER TABLE
    `Seats` ADD PRIMARY KEY `seats_seatnumber_primary`(`SeatNumber`);
CREATE TABLE `Customer`(
    `CustomerID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `Name` VARCHAR(255) NOT NULL,
    `NumSeats` INT NOT NULL,
    `Film_ID` INT NOT NULL,
    `SeatNumber` INT NOT NULL,
    `Member` TINYINT(1) NOT NULL
);
ALTER TABLE
    `Customer` ADD PRIMARY KEY `customer_customerid_primary`(`CustomerID`);