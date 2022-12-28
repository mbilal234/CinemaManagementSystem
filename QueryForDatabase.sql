-- Active: 1669611118298@@localhost@3306@company
DROP SCHEMA IF EXISTS Cinema;
CREATE SCHEMA Cinema;
USE Cinema;
    
CREATE TABLE `Films`(
    `Film_ID` INT UNSIGNED PRIMARY KEY,
    `Title` VARCHAR(255) NOT NULL, 
    `Description` VARCHAR(512) NOT NULL,
    `Trailer_Link` VARCHAR(255),
    `Run_Time` INT UNSIGNED,
    `Rating` FLOAT UNSIGNED,
    `Poster` VARCHAR(255),
    `Backdrop` VARCHAR(255),
    `Start_Date` DATE NOT NULL,
    `End_Date` DATE,
    CHECK (Rating <= 10)
);

CREATE TABLE `Genres` (
	`Film_ID` INT UNSIGNED NOT NULL,
    `Genre` VARCHAR(30) NOT NULL,
    FOREIGN KEY (Film_ID) REFERENCES Films(Film_ID)
);
CREATE TABLE `Screens`(
	`Screen_ID` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	`Screen_Name` VARCHAR(15) NOT NULL,
    `Capacity` INT UNSIGNED NOT NULL
);

CREATE TABLE `Seat_Types`(
	`Seat_Type_ID` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `Type` VARCHAR(10) NOT NULL
);

CREATE TABLE `Seats`(
	`Seat_ID` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	`Screen_ID` INT UNSIGNED NOT NULL,
	`Seat_Type_ID` INT UNSIGNED NOT NULL,
    `Seat_Number` VARCHAR(3) NOT NULL,
    `Pos_X` INT UNSIGNED NOT NULL,
    `Pos_Y` INT UNSIGNED NOT NULL,
    FOREIGN KEY (Screen_ID) REFERENCES Screens(Screen_ID),
    FOREIGN KEY (Seat_Type_ID) REFERENCES Seat_Types(Seat_Type_ID)
);

CREATE TABLE `Show_Types`(
	`Show_Type_ID` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `Show_Type` VARCHAR(2)
);

CREATE TABLE `Ticket_Price`(
	`Seat_Type_ID` INT UNSIGNED NOT NULL,
	`Show_Type_ID` INT UNSIGNED NOT NULL,
    `Price` INT UNSIGNED NOT NULL,
    PRIMARY KEY (Seat_Type_ID, Show_Type_ID),
    FOREIGN KEY (Seat_Type_ID) REFERENCES Seat_Types(Seat_Type_ID),
    FOREIGN KEY (Show_Type_ID) REFERENCES Show_Types(Show_Type_ID)
);

CREATE TABLE `ShowTimes`(
    `Show_ID` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `Film_ID` INT UNSIGNED NOT NULL,
    `Screen_ID` INT UNSIGNED,
    `Show_Date` DATE NOT NULL,
    `Start_Time` TIME NOT NULL,
    `Show_Type_ID` INT UNSIGNED NOT NULL,
    FOREIGN KEY (Film_ID) REFERENCES Films(Film_ID),
    FOREIGN KEY (Screen_ID) REFERENCES Screens(Screen_ID),
    FOREIGN KEY (Show_Type_ID) REFERENCES Show_Types(Show_Type_ID)
);

CREATE TABLE `Suppliers`(
	`Sup_ID` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `Name` VARCHAR(30) NOT NULL,
    `City` VARCHAR(30) NOT NULL
);

CREATE TABLE `Meal_Inventory`(
	`Meal_ID` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `Name` VARCHAR(45) NOT NULL,
    `Cost` FLOAT NOT NULL,
    `Sale_Price` FLOAT NOT NULL,
    `Sup_ID` INT UNSIGNED,
    FOREIGN KEY (Sup_ID) REFERENCES Suppliers(Sup_ID)
);

CREATE TABLE `Reservations`(
	`Res_ID` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `Res_Time` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `Show_ID` INT UNSIGNED,
    `Glasses` INT UNSIGNED DEFAULT 0,
    FOREIGN KEY (Show_ID) REFERENCES ShowTimes(Show_ID) 
);

CREATE TABLE `Orders`(
	`Order_ID` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	`Res_ID` INT UNSIGNED,
    FOREIGN KEY (Res_ID) REFERENCES Reservations(Res_ID)
);

CREATE TABLE `Order_Details`(
	`Order_ID` INT UNSIGNED AUTO_INCREMENT,
    `Meal_ID` INT UNSIGNED,
    `Quantity` INT UNSIGNED,
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Meal_ID) REFERENCES Meal_Inventory(Meal_ID)
);

CREATE TABLE `Res_Seats`(
	`Res_ID` INT UNSIGNED AUTO_INCREMENT,
    `Seat_ID` INT UNSIGNED NOT NULL,
    FOREIGN KEY (Res_ID) REFERENCES Reservations(Res_ID),
    FOREIGN KEY (Seat_ID) REFERENCES Seats(Seat_ID)
);

CREATE TABLE `Members`(
	`Member_ID` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `fName` VARCHAR(30) NOT NULL,
    `lName` VARCHAR(30),
    `CNIC` DECIMAL(13, 0) UNSIGNED NOT NULL,
    `Email` VARCHAR(40) NOT NULL,
    `Phone` DECIMAL(11, 0) UNSIGNED NOT NULL,
    `Password` VARCHAR(1000) NOT NULL,
    `Joining_Date` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `isAuthenticated` BOOL DEFAULT FALSE
);

CREATE TABLE `Member_Reservation`(
	`Member_ID` INT UNSIGNED,
    `Res_ID` INT UNSIGNED,
    FOREIGN KEY (Member_ID) REFERENCES Members(Member_ID),
    FOREIGN KEY (Res_ID) REFERENCES Reservations(Res_ID)
);

CREATE TABLE `Member_Payment`(
	`Member_ID` INT UNSIGNED,
    `Due_Date` DATE NOT NULL,
    `isPayed` BOOL DEFAULT FALSE,
    FOREIGN KEY (Member_ID) REFERENCES Members(Member_ID)
);

CREATE TABLE `NonMember_Reservation`(
	`Res_ID` INT UNSIGNED,
    `fname` VARCHAR(30) NOT NULL,
    `lname` VARCHAR(30),
    FOREIGN KEY (Res_ID) REFERENCES Reservations(Res_ID)
);
    
CREATE TABLE `Employee`(
    `Emp_ID` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `fName` VARCHAR(30) NOT NULL,
    `lName` VARCHAR(30) NOT NULL,
    `Email` VARCHAR(40) NOT NULL,
    `Phone` DECIMAL(11, 0) UNSIGNED NOT NULL,
    `CNIC` DECIMAL(13, 0) UNSIGNED NOT NULL,
    `Password` VARCHAR(1000) NOT NULL,
    `JobTitle` VARCHAR(30) NOT NULL,
    `HireDate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE VIEW `VU_Now_Showing` AS
SELECT * FROM Films f WHERE CURRENT_DATE() BETWEEN f.Start_Date AND f.End_Date;

CREATE OR REPLACE VIEW `VU_Coming_Soon` AS
SELECT * FROM Films f WHERE CURRENT_DATE() < f.Start_Date;

CREATE OR REPLACE VIEW `VU_Ticket_Sales` AS
SELECT * 
FROM Reservations JOIN Res_Seats USING (Res_ID) 
JOIN Seats USING (Seat_ID) JOIN Seat_Types USING (Seat_Type_ID)
JOIN Screens USING (Screen_ID) JOIN Showtimes USING (Show_ID, Screen_ID) 
JOIN Show_Types USING (Show_Type_ID) 
JOIN Ticket_Price USING (Seat_Type_ID, Show_Type_ID);

CREATE OR REPLACE VIEW `VU_Shows` AS
SELECT * FROM showtimes JOIN Show_Types USING (Show_Type_ID);

CREATE OR REPLACE VIEW `VU_Show_Seats` AS
SELECT Showtimes.Show_ID, seats.Seat_ID, seats.Pos_X, seats.Pos_Y, seats.Seat_Number, seat_types.Seat_Type_ID, res_seats.Res_ID
FROM Showtimes 
JOIN Screens USING (Screen_ID) 
JOIN Show_Types USING (Show_Type_ID) 
JOIN Seats USING (Screen_ID)
JOIN Seat_Types USING (Seat_Type_ID) 
LEFT JOIN Res_Seats USING (Seat_ID);

CREATE OR REPLACE VIEW `VU_ShowSeats` AS
SELECT * FROM Showtimes JOIN Screens USING (Screen_ID) JOIN Seats USING (Screen_ID);

CREATE OR REPLACE VIEW `VU_ReservedSeats` AS 
SELECT * FROM Showtimes JOIN Reservations USING (Show_ID) JOIN Res_Seats USING (Res_ID) JOIN Seats USING (Seat_ID, Screen_ID);