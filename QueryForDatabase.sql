DROP SCHEMA IF EXISTS Cinema;
CREATE SCHEMA Cinema;
USE Cinema;
    
CREATE TABLE `Films`(
    `Film_ID` INT UNSIGNED PRIMARY KEY,
    `Title` VARCHAR(255) NOT NULL,
    `Genres` VARCHAR(30), 
    `Description` VARCHAR(255) NOT NULL,
    `Run_Time` INT UNSIGNED,
    `Rating` FLOAT UNSIGNED,
    `Cover_Img` BLOB,
    `Start_Date` DATE NOT NULL,
    `End_Date` DATE,
    CHECK (Rating <= 10)
);

CREATE TABLE `Screens`(
	`Screen_ID` INT UNSIGNED PRIMARY KEY,
	`Screen_Name` VARCHAR(15)
);

CREATE TABLE `ShowTimes`(
    `Show_ID` INT UNSIGNED PRIMARY KEY,
    `Film_ID` INT UNSIGNED,
    `Screen_ID` INT UNSIGNED,
    `Show_Date` DATE NOT NULL,
    `Start_Time` TIME NOT NULL,
    `Show_Type` VARCHAR(2) NOT NULL,
    FOREIGN KEY (Film_ID) REFERENCES Films(Film_ID),
    FOREIGN KEY (Screen_ID) REFERENCES Screens(Screen_ID)
);

CREATE TABLE `Reservations`(
	`Res_ID` INT UNSIGNED PRIMARY KEY,
    `Show_ID` INT UNSIGNED,
    `Seats` VARCHAR(25),
    FOREIGN KEY (Show_ID) REFERENCES ShowTimes(Show_ID) 
);

CREATE TABLE `Members`(
	`Member_ID` INT UNSIGNED PRIMARY KEY,
    `fName` VARCHAR(30) NOT NULL,
    `lName` VARCHAR(30),
    `Email` VARCHAR(40) NOT NULL,
    `Phone` INT(11) UNSIGNED NOT NULL,
    `CNIC` INT(13) UNSIGNED NOT NULL,
    `Password` VARCHAR(40) NOT NULL
    -- `Card_Number` INT UNSIGNED,
    -- `Card_Expiry` DATE
);

CREATE TABLE `Member_Reservation`(
	`Member_ID` INT UNSIGNED,
    `Res_ID` INT UNSIGNED,
    FOREIGN KEY (Member_ID) REFERENCES Members(Member_ID),
    FOREIGN KEY (Res_ID) REFERENCES Reservations(Res_ID)
);
    
CREATE TABLE `Employee`(
    `Emp_ID` INT UNSIGNED PRIMARY KEY,
    `fName` VARCHAR(30) NOT NULL,
    `lName` VARCHAR(30) NOT NULL,
    `Email` VARCHAR(40) NOT NULL,
    `Phone` INT(11) UNSIGNED NOT NULL,
    `CNIC` INT(13) UNSIGNED NOT NULL,
    `Password` VARCHAR(40) NOT NULL,
    `JobTitle` VARCHAR(30) NOT NULL,
    `HireDate` DATE NOT NULL
);

-- CREATE OR REPLACE VIEW `Reserved_Seats` 
-- AS (SELECT );

