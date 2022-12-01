DROP SCHEMA IF EXISTS Cinema;
CREATE SCHEMA Cinema;
USE Cinema;
    
CREATE TABLE `Films`(
    `Film_ID` INT UNSIGNED PRIMARY KEY,
    `Title` VARCHAR(255) NOT NULL,
    `Genres` VARCHAR(30), 
    `Description` VARCHAR(255) NOT NULL,
    `Trailer_Link` VARCHAR(255),
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

CREATE TABLE `Suppliers`(
	`Sup_ID` INT UNSIGNED PRIMARY KEY,
    `Name` VARCHAR(30) NOT NULL,
    `City` VARCHAR(30) NOT NULL
);

CREATE TABLE `Meal_Inventory`(
	`Meal_ID` INT UNSIGNED PRIMARY KEY,
    `Name` VARCHAR(45) NOT NULL,
    `Cost` FLOAT NOT NULL,
    `Sale_Price` FLOAT NOT NULL,
    `Sup_ID` INT UNSIGNED,
    FOREIGN KEY (Sup_ID) REFERENCES Suppliers(Sup_ID)
);

CREATE TABLE `Reservations`(
	`Res_ID` INT UNSIGNED PRIMARY KEY,
    `Res_Time` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `Show_ID` INT UNSIGNED,
    `Glasses` INT UNSIGNED DEFAULT 0,
    FOREIGN KEY (Show_ID) REFERENCES ShowTimes(Show_ID) 
);

CREATE TABLE `Orders`(
	`Order_ID` INT UNSIGNED PRIMARY KEY,
	`Res_ID` INT UNSIGNED,
    FOREIGN KEY (Res_ID) REFERENCES Reservations(Res_ID)
);

CREATE TABLE `Order_Details`(
	`Order_ID` INT UNSIGNED,
    `Meal_ID` INT UNSIGNED,
    `Quantity` INT UNSIGNED,
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Meal_ID) REFERENCES Meal_Inventory(Meal_ID)
);

CREATE TABLE `Res_Seats`(
	`Res_ID` INT UNSIGNED,
    `SeatNum` VARCHAR(3),
    FOREIGN KEY (Res_ID) REFERENCES Reservations(Res_ID)
);

CREATE TABLE `Members`(
	`Member_ID` INT UNSIGNED PRIMARY KEY,
    `fName` VARCHAR(30) NOT NULL,
    `lName` VARCHAR(30),
    `CNIC` INT(13) UNSIGNED NOT NULL,
    `Email` VARCHAR(40) NOT NULL,
    `Phone` INT(11) UNSIGNED NOT NULL,
    `Password` VARCHAR(40) NOT NULL,
    `Joining_Date` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `isAuthenticated` BOOL DEFAULT FALSE
    -- `Card_Number` INT UNSIGNED,
    -- `Card_Expiry` DATE
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
    `CNIC` INT(13) UNSIGNED NOT NULL,
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
    `HireDate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE VIEW `VU_Reserved_Seats` AS
SELECT f.Title, st.Show_Date, st.Start_Time, st.Show_Type, sc.Screen_Name, rs.SeatNum 
FROM Films f
JOIN ShowTimes st USING (Film_ID)
JOIN Screens sc USING (Screen_ID)
JOIN Reservations res USING (Show_ID) 
JOIN Res_Seats rs USING (Res_ID);
