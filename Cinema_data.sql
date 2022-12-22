USE cinema;
INSERT INTO Films (TMDB_ID, Title, Genres, Description, Trailer_Link, Run_Time, Rating, Poster, Backdrop, Start_Date, End_Date)
VALUES (123456, 'Jurassic Park', 'Adventure, Sci-Fi, Thriller', 'A group of scientists visit a remote island where they encounter genetically engineered dinosaurs.', 'https://www.youtube.com/watch?v=lc0UehYemQA', 127, 8.1, NULL, NULL, '1993-06-09', '1993-09-30');
INSERT INTO Films (TMDB_ID, Title, Genres, Description, Trailer_Link, Run_Time, Rating, Poster, Backdrop, Start_Date, End_Date)
VALUES (234567, 'The Shawshank Redemption', 'Drama', 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.', 'https://www.youtube.com/watch?v=6hB3S9bIaco', 142, 9.3, NULL, NULL, '1994-09-10', '1994-12-31');
INSERT INTO Films (TMDB_ID, Title, Genres, Description, Trailer_Link, Run_Time, Rating, Poster, Backdrop, Start_Date, End_Date)
VALUES (345678, 'The Godfather', 'Crime, Drama', 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.', 'https://www.youtube.com/watch?v=sY1S34973zA', 175, 9.2, NULL, NULL, '1972-03-24', '1972-06-30');
INSERT INTO Films (TMDB_ID, Title, Genres, Description, Trailer_Link, Run_Time, Rating, Poster, Backdrop, Start_Date, End_Date)
VALUES (456789, 'The Dark Knight', 'Action, Crime, Drama', 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.', 'https://www.youtube.com/watch?v=_PZpmTj1Q8Q', 152, 9.0, NULL, NULL, '2008-07-18', '2008-10-31');
INSERT INTO Films (TMDB_ID, Title, Genres, Description, Trailer_Link, Run_Time, Rating, Poster, Backdrop, Start_Date, End_Date)
VALUES (567890, 'Pulp Fiction', 'Crime, Drama', 'The lives of two mob hitmen, a boxer, a gangsters wife, and a pair of diner bandits intertwine in four tales of violence and redemption.', 'https://www.youtube.com/watch?v=s7EdQ4FqbhY', 154, 8.9, NULL, NULL, '1994-09-10', '1994-12-31');

INSERT INTO Screens (Screen_Name, Capacity) VALUES ('Screen 1', 100);
INSERT INTO Screens (Screen_Name, Capacity) VALUES ('Screen 2', 120);
INSERT INTO Screens (Screen_Name, Capacity) VALUES ('Screen 3', 150);
INSERT INTO Screens (Screen_Name, Capacity) VALUES ('Screen 4', 75);
INSERT INTO Screens (Screen_Name, Capacity) VALUES ('Screen 5', 200);
INSERT INTO Screens (Screen_Name, Capacity) VALUES ('Screen 6', 180);
INSERT INTO Screens (Screen_Name, Capacity) VALUES ('Screen 7', 130);
INSERT INTO Screens (Screen_Name, Capacity) VALUES ('Screen 8', 110);
INSERT INTO Screens (Screen_Name, Capacity) VALUES ('Screen 9', 90);
INSERT INTO Screens (Screen_Name, Capacity) VALUES ('Screen 10', 160);
INSERT INTO Screens (Screen_Name, Capacity) VALUES ('Screen 11', 140);

INSERT INTO Seat_Types (Type) VALUES ('Standard');
INSERT INTO Seat_Types (Type) VALUES ('Premium');
INSERT INTO Seat_Types (Type) VALUES ('VIP');
INSERT INTO Seat_Types (Type) VALUES ('Disabled');
INSERT INTO Seat_Types (Type) VALUES ('Recliner');
INSERT INTO Seat_Types (Type) VALUES ('Sofa');
INSERT INTO Seat_Types (Type) VALUES ('Lounge');
INSERT INTO Seat_Types (Type) VALUES ('Bean Bag');
INSERT INTO Seat_Types (Type) VALUES ('Ultra Premium');
INSERT INTO Seat_Types (Type) VALUES ('Platinum');
INSERT INTO Seat_Types (Type) VALUES ('Gold');
INSERT INTO Seat_Types (Type) VALUES ('Silver');
INSERT INTO Seat_Types (Type) VALUES ('Bronze');


INSERT INTO Seats (Screen_ID, Seat_Type_ID, Seat_Number, Pos_X, Pos_Y) VALUES (1, 1, 'A1', 1, 1);
INSERT INTO Seats (Screen_ID, Seat_Type_ID, Seat_Number, Pos_X, Pos_Y) VALUES (1, 1, 'A2', 2, 1);
INSERT INTO Seats (Screen_ID, Seat_Type_ID, Seat_Number, Pos_X, Pos_Y) VALUES (1, 2, 'B1', 1, 2);
INSERT INTO Seats (Screen_ID, Seat_Type_ID, Seat_Number, Pos_X, Pos_Y) VALUES (1, 2, 'B2', 2, 2);
INSERT INTO Seats (Screen_ID, Seat_Type_ID, Seat_Number, Pos_X, Pos_Y) VALUES (1, 3, 'C1', 1, 3);
INSERT INTO Seats (Screen_ID, Seat_Type_ID, Seat_Number, Pos_X, Pos_Y) VALUES (1, 3, 'C2', 2, 3);
INSERT INTO Seats (Screen_ID, Seat_Type_ID, Seat_Number, Pos_X, Pos_Y) VALUES (1, 4, 'D1', 1, 4);
INSERT INTO Seats (Screen_ID, Seat_Type_ID, Seat_Number, Pos_X, Pos_Y) VALUES (1, 4, 'D2', 2, 4);

INSERT INTO Genres (Film_ID, Genre) VALUES (1, 'Adventure');
INSERT INTO Genres (Film_ID, Genre) VALUES (1, 'Sci-Fi');
INSERT INTO Genres (Film_ID, Genre) VALUES (1, 'Thriller');
INSERT INTO Genres (Film_ID, Genre) VALUES (2, 'Drama');
INSERT INTO Genres (Film_ID, Genre) VALUES (3, 'Crime');
INSERT INTO Genres (Film_ID, Genre) VALUES (3, 'Drama');
INSERT INTO Genres (Film_ID, Genre) VALUES (4, 'Action');
INSERT INTO Genres (Film_ID, Genre) VALUES (4, 'Crime');
INSERT INTO Genres (Film_ID, Genre) VALUES (4, 'Drama');
INSERT INTO Genres (Film_ID, Genre) VALUES (5, 'Crime');
INSERT INTO Genres (Film_ID, Genre) VALUES (5, 'Drama');
INSERT INTO Genres (Film_ID, Genre) VALUES (6, 'Crime');
INSERT INTO Genres (Film_ID, Genre) VALUES (6, 'Drama');
INSERT INTO Genres (Film_ID, Genre) VALUES (7, 'Crime');
INSERT INTO Genres (Film_ID, Genre) VALUES (7, 'Drama');
INSERT INTO Genres (Film_ID, Genre) VALUES (8, 'Adventure');
INSERT INTO Genres (Film_ID, Genre) VALUES (8, 'Fantasy');
INSERT INTO Genres (Film_ID, Genre) VALUES (8, 'Drama');
INSERT INTO Genres (Film_ID, Genre) VALUES (9, 'Adventure');
INSERT INTO Genres (Film_ID, Genre) VALUES (9, 'Animation');
Screens:

INSERT INTO Screens (Screen_Name, Capacity) VALUES ('Screen 1', 100);
INSERT INTO Screens (Screen_Name, Capacity) VALUES ('Screen 2', 120);
INSERT INTO Screens (Screen_Name, Capacity) VALUES ('Screen 3', 150);
INSERT INTO Screens (Screen_Name, Capacity) VALUES ('Screen 4', 75);
INSERT INTO Screens (Screen_Name, Capacity) VALUES ('Screen 5', 200);
INSERT INTO Screens (Screen_Name, Capacity) VALUES ('Screen 6', 180);
INSERT INTO Screens (Screen_Name, Capacity) VALUES ('Screen 7', 130);
INSERT INTO Screens (Screen_Name, Capacity) VALUES ('Screen 8', 110);
INSERT INTO Screens (Screen_Name, Capacity) VALUES ('Screen 9', 90);
INSERT INTO Screens (Screen_Name, Capacity) VALUES ('Screen 10', 160);
INSERT INTO Screens (Screen_Name, Capacity) VALUES ('Screen 11', 140);
INSERT INTO Screens (Screen_



Muhammad Bilal
continue
Seat_Types:

INSERT INTO Seat_Types (Type) VALUES ('Standard');
INSERT INTO Seat_Types (Type) VALUES ('Premium');
INSERT INTO Seat_Types (Type) VALUES ('VIP');
INSERT INTO Seat_Types (Type) VALUES ('Disabled');
INSERT INTO Seat_Types (Type) VALUES ('Love Seat');
INSERT INTO Seat_Types (Type) VALUES ('Recliner');
INSERT INTO Seat_Types (Type) VALUES ('Sofa');
INSERT INTO Seat_Types (Type) VALUES ('Lounge');
INSERT INTO Seat_Types (Type) VALUES ('Bean Bag');

INSERT INTO Seat_Types (Type) VALUES ('Platinum');
INSERT INTO Seat_Types (Type) VALUES ('Gold');
INSERT INTO Seat_Types (Type) VALUES ('Silver');
INSERT INTO Seat_Types (Type) VALUES ('Bronze');
INSERT INTO Seat_Types (Type) VALUES ('Cozy');
INSERT INTO Seat_Types (Type) VALUES ('Leather');
INSERT INTO Seat_Types (Type) VALUES ('Fabric');
INSERT INTO Seat_Types (Type) VALUES ('Massage');
INSERT INTO Seat_Types (Type) VALUES ('Heated');

INSERT INTO Seats (Screen_ID, Seat_Type_ID, Seat_Number, Pos_X, Pos_Y) VALUES (1, 1, 'A1', 1, 1);
INSERT INTO Seats (Screen_ID, Seat_Type_ID, Seat_Number, Pos_X, Pos_Y) VALUES (1, 1, 'A2', 2, 1);
INSERT INTO Seats (Screen_ID, Seat_Type_ID, Seat_Number, Pos_X, Pos_Y) VALUES (1, 2, 'B1', 1, 2);
INSERT INTO Seats (Screen_ID, Seat_Type_ID, Seat_Number, Pos_X, Pos_Y) VALUES (1, 2, 'B2', 2, 2);
INSERT INTO Seats (Screen_ID, Seat_Type_ID, Seat_Number, Pos_X, Pos_Y) VALUES (1, 3, 'C1', 1, 3);
INSERT INTO Seats (Screen_ID, Seat_Type_ID, Seat_Number, Pos_X, Pos_Y) VALUES (1, 3, 'C2', 2, 3);
INSERT INTO Seats (Screen_ID, Seat_Type_ID, Seat_Number, Pos_X, Pos_Y) VALUES (1, 4, 'D1', 1, 4);
INSERT INTO Seats (Screen_ID, Seat_Type_ID, Seat_Number, Pos_X, Pos_Y) VALUES (1, 4, 'D2', 2, 4);





INSERT INTO Seats (Screen_ID, Seat_Type_ID, Seat_Number, Pos_X, Pos_Y) VALUES (2, 1, 'A1', 1, 1);
INSERT INTO Seats (Screen_ID, Seat_Type_ID, Seat_Number, Pos_X, Pos_Y) VALUES (2, 1, 'A2', 2, 1);
INSERT INTO Seats (Screen_ID, Seat_Type_ID, Seat_Number, Pos_X, Pos_Y) VALUES (2, 2, 'B1', 1, 2);
INSERT INTO Seats (Screen_ID, Seat_Type_ID, Seat_Number, Pos_X, Pos_Y) VALUES (2, 2, 'B2', 2, 2);
INSERT INTO Seats (Screen_ID, Seat_Type_ID, Seat_Number, Pos_X, Pos_Y) VALUES (2, 3, 'C1', 1, 3);
INSERT INTO Seats (Screen_ID, Seat_Type_ID, Seat_Number, Pos_X, Pos_Y) VALUES (2, 3, 'C2', 2, 3);
INSERT INTO Seats (Screen_ID, Seat_Type_ID, Seat_Number, Pos_X, Pos_Y) VALUES (2, 4, 'D1', 1, 4);
INSERT INTO Seats (Screen_ID, Seat_Type_ID, Seat_Number, Pos_X, Pos_Y) VALUES (2, 4, 'D2', 2, 4);
INSERT INTO Seats (Screen_ID, Seat_Type_ID, Seat_Number, Pos_X, Pos_Y) VALUES (3, 1, 'A1', 1, 1);

INSERT INTO Show_Types (Show_Type) VALUES ('2D');
INSERT INTO Show_Types (Show_Type) VALUES ('3D');
INSERT INTO Show_Types (Show_Type) VALUES ('4D');

INSERT INTO Ticket_Price (Seat_Type_ID, Show_Type_ID, Price) VALUES (1, 1, 500);
INSERT INTO Ticket_Price (Seat_Type_ID, Show_Type_ID, Price) VALUES (1, 2, 600);
INSERT INTO Ticket_Price (Seat_Type_ID, Show_Type_ID, Price) VALUES (1, 5, 750);
INSERT INTO Ticket_Price (Seat_Type_ID, Show_Type_ID, Price) VALUES (1, 6, 850);
INSERT INTO Ticket_Price (Seat_Type_ID, Show_Type_ID, Price) VALUES (2, 1, 800);
INSERT INTO Ticket_Price (Seat_Type_ID, Show_Type_ID, Price) VALUES (2, 2, 900);

INSERT INTO ShowTimes (Film_ID, Screen_ID, Show_Date, Start_Time, Show_Type_ID) VALUES (1, 1, '2022-01-02', '19:00:00', 1);
INSERT INTO ShowTimes (Film_ID, Screen_ID, Show_Date, Start_Time, Show_Type_ID) VALUES (2, 1, '2022-01-03', '19:00:00', 1);
INSERT INTO ShowTimes (Film_ID, Screen_ID, Show_Date, Start_Time, Show_Type_ID) VALUES (3, 2, '2022-01-04', '19:00:00', 1);
INSERT INTO ShowTimes (Film_ID, Screen_ID, Show_Date, Start_Time, Show_Type_ID) VALUES (4, 1, '2022-01-05', '19:00:00', 1);
INSERT INTO ShowTimes (Film_ID, Screen_ID, Show_Date, Start_Time, Show_Type_ID) VALUES (5, 1, '2022-01-06', '19:00:00', 1);
INSERT INTO ShowTimes (Film_ID, Screen_ID, Show_Date, Start_Time, Show_Type_ID) VALUES (1, 2, '2022-01-07', '19:00:00', 1);
INSERT INTO ShowTimes (Film_ID, Screen_ID, Show_Date, Start_Time, Show_Type_ID) VALUES (1, 1, '2022-01-08', '19:00:00', 1);
INSERT INTO ShowTimes (Film_ID, Screen_ID, Show_Date, Start_Time, Show_Type_ID) VALUES (1, 1, '2022-01-09', '19:00:00', 1);
INSERT INTO ShowTimes (Film_ID, Screen_ID, Show_Date, Start_Time, Show_Type_ID) VALUES (1, 1, '2022-01-10', '19:00:00', 1);
INSERT INTO ShowTimes (Film_ID, Screen_ID, Show_Date, Start_Time, Show_Type_ID) VALUES (1, 1, '2022-01-11', '19:00:00', 1);
INSERT INTO ShowTimes (Film_ID, Screen_ID, Show_Date, Start_Time, Show_Type_ID) VALUES (1, 1, '2022-01-12', '19:00:00', 1);
INSERT INTO ShowTimes (Film_ID, Screen_ID, Show_Date, Start_Time, Show_Type_ID) VALUES (1, 1, '2022-01-13', '19:00:00', 1);
INSERT INTO ShowTimes (Film_ID, Screen_ID, Show_Date, Start_Time, Show_Type_ID) VALUES (1, 1, '2022-01-14', '19:00:00', 1);

INSERT INTO Suppliers (Name, City) VALUES ('Acme Corporation', 'New York');
INSERT INTO Suppliers (Name, City) VALUES ('XYZ Inc.', 'Los Angeles');
INSERT INTO Suppliers (Name, City) VALUES ('ABC Limited', 'Chicago');
INSERT INTO Suppliers (Name, City) VALUES ('Def Enterprises', 'Houston');
INSERT INTO Suppliers (Name, City) VALUES ('Ghi Industries', 'Philadelphia');
INSERT INTO Suppliers (Name, City) VALUES ('Jkl Solutions', 'Phoenix');
INSERT INTO Suppliers (Name, City) VALUES ('Mno Services', 'San Antonio');


INSERT INTO Employee (fName, lName, Email, Phone, CNIC, Password, JobTitle) VALUES ('John', 'Doe', 'john.doe@example.com', '12345678900', '1234567890123', 'password123', 'Manager');
INSERT INTO Employee (fName, lName, Email, Phone, CNIC, Password, JobTitle) VALUES ('Jane', 'Doe', 'jane.doe@example.com', '12345678901', '1234567890124', 'password124', 'Assistant Manager');
INSERT INTO Employee (fName, lName, Email, Phone, CNIC, Password, JobTitle) VALUES ('Bob', 'Smith', 'bob.smith@example.com', '12345678902', '1234567890125', 'password125', 'Cashier');
INSERT INTO Employee (fName, lName, Email, Phone, CNIC, Password, JobTitle) VALUES ('Alice', 'Smith', 'alice.smith@example.com', '12345678903', '1234567890126', 'password126', 'Concessions');
INSERT INTO Employee (fName, lName, Email, Phone, CNIC, Password, JobTitle) VALUES ('Mike', 'Jones', 'mike.jones@example.com', '12345678904', '1234567890127', 'password127', 'Usher');
INSERT INTO Employee (fName, lName, Email, Phone, CNIC, Password, JobTitle) VALUES ('Sarah', 'Jones', 'sarah.jones@example.com', '12345678905', '1234567890128', 'password128', 'Usher');
INSERT INTO Employee (fName, lName, Email, Phone, CNIC, Password, JobTitle) VALUES ('Chris', 'Williams', 'chris.williams@example.com', '12345678906', '1234567890129', 'password129', 'Usher');
INSERT INTO Employee (fName, lName, Email, Phone, CNIC, Password, JobTitle) VALUES ('Emily', 'Williams', 'emily.williams@example.com', '12345678907', '1234567890130', 'password130', 'Usher');