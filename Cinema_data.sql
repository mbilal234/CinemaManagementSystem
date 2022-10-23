USE Cinema;

INSERT INTO theatre VALUES 
(1, 'Screen 1', 200),
(2, 'Screen 2', 230),
(3, 'Screen 3', 200),
(4, 'Screen 4', 210);

COMMIT;

INSERT INTO film VALUES 
('Black Adam', 1024, 1),
('The Legend of Maula Jutt', 3013, 1),
('Hellraiser', 1025, 1),
('Prey For The Devil', 1026, 1),
('Black Panther: Wakanda Forever', 1027, 2),
('Lyle, Lyle, Crocodile', 1028, 2),
('Spirited', 1029, 2),
('Paradise City', 1030, 2),
('The Friendship Game', 1031, 3),
('The Menu', 1032, 3),
('Strange World', 1033, 3),
('Devotion', 1034, 3),
("Dante's Hell", 1035, 4),
('Fable', 1036, 4),
('Call Jane', 1037, 4),
('The Lair', 1038, 4);

COMMIT;

INSERT INTO Film_Time VALUES
('2022-10-24 11:00:00', 1024),
('2022-10-24 14:30:00', 1025),
('2022-10-24 18:00:00', 1026),
('2022-10-24 22:30:00', 3013),
('2022-10-24 11:00:00', 1027),
('2022-10-24 14:30:00', 1028),
('2022-10-24 18:00:00', 1029),
('2022-10-24 22:30:00', 1030),
('2022-10-24 11:00:00', 1031),
('2022-10-24 14:30:00', 1032),
('2022-10-24 18:00:00', 1033),
('2022-10-24 22:30:00', 1034),
('2022-10-24 11:00:00', 1035),
('2022-10-24 14:30:00', 1036),
('2022-10-24 18:00:00', 1037),
('2022-10-24 22:30:00', 1038),
('2022-10-25 11:00:00', 1024),
('2022-10-25 14:30:00', 1025),
('2022-10-25 18:00:00', 1026),
('2022-10-25 22:30:00', 3013),
('2022-10-25 11:00:00', 1027),
('2022-10-25 14:30:00', 1028),
('2022-10-25 18:00:00', 1029),
('2022-10-25 22:30:00', 1030),
('2022-10-25 11:00:00', 1031),
('2022-10-25 14:30:00', 1032),
('2022-10-25 18:00:00', 1033),
('2022-10-25 22:30:00', 1034),
('2022-10-25 11:00:00', 1035),
('2022-10-25 14:30:00', 1036),
('2022-10-25 18:00:00', 1037),
('2022-10-25 22:30:00', 1038),
('2022-10-26 11:00:00', 1024),
('2022-10-26 14:30:00', 1025),
('2022-10-26 18:00:00', 1026),
('2022-10-26 22:30:00', 3013),
('2022-10-26 11:00:00', 1027),
('2022-10-26 14:30:00', 1028),
('2022-10-26 18:00:00', 1029),
('2022-10-26 22:30:00', 1030),
('2022-10-26 11:00:00', 1031),
('2022-10-26 14:30:00', 1032),
('2022-10-26 18:00:00', 1033),
('2022-10-26 22:30:00', 1034),
('2022-10-26 11:00:00', 1035),
('2022-10-26 14:30:00', 1036),
('2022-10-26 18:00:00', 1037),
('2022-10-26 22:30:00', 1038),
('2022-10-27 11:00:00', 1024),
('2022-10-27 14:30:00', 1025),
('2022-10-27 18:00:00', 1026),
('2022-10-27 22:30:00', 3013),
('2022-10-27 11:00:00', 1027),
('2022-10-27 14:30:00', 1028),
('2022-10-27 18:00:00', 1029),
('2022-10-27 22:30:00', 1030),
('2022-10-27 11:00:00', 1031),
('2022-10-27 14:30:00', 1032),
('2022-10-27 18:00:00', 1033),
('2022-10-27 22:30:00', 1034),
('2022-10-27 11:00:00', 1035),
('2022-10-27 14:30:00', 1036),
('2022-10-27 18:00:00', 1037),
('2022-10-27 22:30:00', 1038);

COMMIT;

INSERT INTO Employee VALUES
(101, "Muhammad Bilal", 'Manager', '2022-10-10 12:00:00'),
(102, "Abdul Arham", 'Supervisor', '2022-10-10 12:00:00'),
(103, "Muhammad Ashhub", 'Accountant', '2022-10-10 12:00:00');

COMMIT;


INSERT INTO seats VALUES 
(1, 0, 1), (2, 1, 1), (3, 1, 1), (4, 1, 1), (5, 1, 1), (6, 1, 1), (7, 1, 1), (8, 1, 1), (9, 1, 1), (10, 1, 1),
(11, 1, 1), (12, 1, 1), (13, 1, 1), (14, 1, 1), (15, 1, 1), (16, 1, 1), (17, 1, 1), (18, 1, 1), (19, 1, 1), (20, 1, 1),
(21, 1, 1), (22, 1, 1), (23, 1, 1), (24, 1, 1), (25, 1, 1), (26, 1, 1), (27, 1, 1), (28, 1, 1), (29, 1, 1), (30, 1, 1),
(31, 1, 1), (32, 1, 1), (33, 1, 1), (34, 1, 1), (35, 1, 1), (36, 1, 1), (37, 1, 1), (38, 1, 1), (39, 1, 1), (40, 1, 1),
(41, 1, 1),(42, 1, 1), (43, 1, 1), (44, 1, 1), (45, 1, 1), (46, 1, 1), (47, 1, 1), (48, 1, 1),(49, 1, 1), (50, 1, 1),
(51, 1, 1), (52, 1, 1), (53, 1, 1), (54, 1, 1), (55, 1, 1), (56, 1, 1), (57, 1, 1), (58, 1, 1), (59, 1, 1), (60, 1, 1),
(61, 1, 1), (62, 1, 1), (63, 1, 1), (64, 1, 1), (65, 1, 1), (66, 1, 1), (67, 1, 1), (68, 1, 1), (69, 1, 1), (70, 1, 1),
(71, 1, 1), (72, 1, 1), (73, 1, 1), (74, 1, 1), (75, 1, 1), (76, 1, 1), (77, 1, 1), (78, 1, 1), (79, 1, 1), (80, 1, 1),
(81, 1, 1), (82, 1, 1), (83, 1, 1), (84, 1, 1), (85, 1, 1), (86, 1, 1), (87, 1, 1), (88, 1, 1), (89, 1, 1), (90, 1, 1),
(91, 1, 1), (92, 1, 1), (93, 1, 1), (94, 1, 1), (95, 1, 1), (96, 1, 1), (97, 1, 1), (98, 1, 1), (99, 1, 1), (100, 1, 1),
(101, 1, 1), (102, 1, 1), (103, 1, 1), (104, 1, 1), (105, 1, 1), (106, 1, 1), (107, 1, 1), (108, 1, 1), (109, 1, 1), (110, 1, 1),
(111, 1, 1), (112, 1, 1), (113, 1, 1), (114, 1, 1), (115, 1, 1), (116, 1, 1), (117, 1, 1), (118, 1, 1), (119, 1, 1), (120, 1, 1),
(121, 1, 1), (122, 1, 1), (123, 1, 1), (124, 1, 1), (125, 1, 1), (126, 1, 1), (127, 1, 1), (128, 1, 1), (129, 1, 1), (130, 1, 1),
(131, 1, 1), (132, 1, 1), (133, 1, 1), (134, 1, 1), (135, 1, 1), (136, 1, 1), (137, 1, 1), (138, 1, 1), (139, 1, 1), (140, 1, 1),
(141, 1, 1), (142, 1, 1), (143, 1, 1), (144, 1, 1), (145, 1, 1), (146, 1, 1), (147, 1, 1), (148, 1, 1), (149, 1, 1), (150, 1, 1),
(151, 1, 1), (152, 1, 1), (153, 1, 1), (154, 1, 1), (155, 1, 1), (156, 1, 1), (157, 1, 1), (158, 1, 1), (159, 1, 1), (160, 1, 1),
(161, 1, 1), (162, 1, 1), (163, 1, 1), (164, 1, 1), (165, 1, 1), (166, 1, 1), (167, 1, 1), (168, 1, 1), (169, 1, 1), (170, 1, 1), 
(171, 1, 1), (172, 1, 1), (173, 1, 1), (174, 1, 1), (175, 1, 1), (176, 1, 1), (177, 1, 1), (178, 1, 1), (179, 1, 1), (180, 1, 1),
(181, 1, 1), (182, 1, 1), (183, 1, 1), (184, 1, 1), (185, 1, 1), (186, 1, 1), (187, 1, 1), (188, 1, 1), (189, 1, 1), (190, 1, 1),
(191, 1, 1), (192, 1, 1), (193, 1, 1), (194, 1, 1), (195, 1, 1), (196, 1, 1), (197, 1, 1), (198, 1, 1), (199, 1, 1), (200, 1, 1),
(1, 1, 2), (2, 1, 2), (3, 1, 2), (4, 1, 2), (5, 1, 2), (6, 1, 2), (7, 1, 2), (8, 1, 2), (9, 1, 2), (10, 1, 2),
(11, 1, 2), (12, 1, 2), (13, 1, 2), (14, 1, 2), (15, 1, 2), (16, 1, 2), (17, 1, 2), (18, 1, 2), (19, 1, 2), (20, 1, 2),
(21, 1, 2), (22, 1, 2), (23, 1, 2), (24, 1, 2), (25, 1, 2), (26, 1, 2), (27, 1, 2), (28, 1, 2), (29, 1, 2), (30, 1, 2),
(31, 1, 2), (32, 1, 2), (33, 1, 2), (34, 1, 2), (35, 1, 2), (36, 1, 2), (37, 1, 2), (38, 1, 2), (39, 1, 2), (40, 1, 2),
(41, 1, 2),(42, 1, 2), (43, 1, 2), (44, 1, 2), (45, 1, 2), (46, 1, 2), (47, 1, 2), (48, 1, 2),(49, 1, 2), (50, 1, 2),
(51, 1, 2), (52, 1, 2), (53, 1, 2), (54, 1, 2), (55, 1, 2), (56, 1, 2), (57, 1,2), (58, 1, 2), (59, 1, 2), (60, 1, 2),
(61, 1, 2), (62, 1, 2), (63, 1, 2), (64, 1, 2), (65, 1, 2), (66, 1, 2), (67, 1, 2), (68, 1, 2), (69, 1, 2), (70, 1, 2),
(71, 1, 2), (72, 1, 2), (73, 1, 2), (74, 1, 2), (75, 1, 2), (76, 1, 2), (77, 1, 2), (78, 1, 2), (79, 1, 2), (80, 1, 2),
(81, 1, 2), (82, 1, 2), (83, 1, 2), (84, 1, 2), (85, 1, 2), (86, 1, 2), (87, 1, 2), (88, 1, 2), (89, 1, 2), (90, 1, 2),
(91, 1, 2), (92, 1, 2), (93, 1, 2), (94, 1, 2), (95, 1, 2), (96, 1, 2), (97, 1, 2), (98, 1, 2), (99, 1, 2), (100, 1, 2),
(101, 1, 2), (102, 1, 2), (103, 1, 2), (104, 1, 2), (105, 1, 2), (106, 1, 2), (107, 1, 2), (108, 1, 2), (109, 1, 2), (110, 1, 2),
(111, 1, 2), (112, 1, 2), (113, 1, 2), (114, 1, 2), (115, 1, 2), (116, 1, 2), (117, 1, 2), (118, 1, 2), (119, 1, 2), (120, 1, 2),
(121, 1, 2), (122, 1, 2), (123, 1, 2), (124, 1, 2), (125, 1, 2), (126, 1, 2), (127, 1, 2), (128, 1, 2), (129, 1, 2), (130, 1, 2),
(131, 1, 2), (132, 1, 2), (133, 1, 2), (134, 1, 2), (135, 1, 2), (136, 1, 2), (137, 1, 2), (138, 1, 2), (139, 1, 2), (140, 1, 2),
(141, 1, 2), (142, 1, 2), (143, 1, 2), (144, 1, 2), (145, 1, 2), (146, 1, 2), (147, 1, 2), (148, 1, 2), (149, 1, 2), (150, 1, 2),
(151, 1, 2), (152, 1, 2), (153, 1, 2), (154, 1, 2), (155, 1, 2), (156, 1, 2), (157, 1, 2), (158, 1, 2), (159, 1, 2), (160, 1, 2),
(161, 1, 2), (162, 1, 2), (163, 1, 2), (164, 1, 2), (165, 1, 2), (166, 1, 2), (167, 1, 2), (168, 1, 2), (169, 1, 2), (170, 1, 2),
(171, 1, 2), (172, 1, 2), (173, 1, 2), (174, 1, 2), (175, 1, 2), (176, 1, 2), (177, 1, 2), (178, 1, 2), (179, 1, 2), (180, 1, 2),
(181, 1, 2), (182, 1, 2), (183, 1, 2), (184, 1, 2), (185, 1, 2), (186, 1, 2), (187, 1, 2), (188, 1, 2), (189, 1, 2), (190, 1, 2),
(191, 1, 2), (192, 1, 2), (193, 1, 2), (194, 1, 2), (195, 1, 2), (196, 1, 2), (197, 1, 2), (198, 1, 2), (199, 1, 2), (200, 1, 2),
(201, 1, 2), (202, 1, 2), (203, 1, 2), (204, 1, 2), (205, 1, 2), (206, 1, 2), (207, 1, 2), (208, 1, 2), (209, 1, 2), (210, 1, 2),
(211, 1, 2), (212, 1, 2), (213, 1, 2), (214, 1, 2), (215, 1, 2), (216, 1, 2), (217, 1, 2), (218, 1, 2), (219, 1, 2), (220, 1, 2),
(221, 1, 2), (222, 1, 2), (223, 1, 2), (224, 1, 2), (225, 1, 2), (226, 1, 2), (227, 1, 2), (228, 1, 2), (229, 1, 2), (230, 1, 2),
(1, 1, 3), (2, 1, 3), (3, 1, 3), (4, 1, 3), (5, 1, 3), (6, 1, 3), (7, 1, 3), (8, 1, 3), (9, 1, 3), (10, 1, 3),
(11, 1, 3), (12, 1, 3), (13, 1, 3), (14, 1, 3), (15, 1, 3), (16, 1, 3), (17, 1, 3), (18, 1, 3), (19, 1, 3), (20, 1, 3),
(21, 1, 3), (22, 1, 3), (23, 1, 3), (24, 1, 3), (25, 1, 3), (26, 1, 3), (27, 1, 3), (28, 1, 3), (29, 1, 3), (30, 1, 3),
(31, 1, 3), (32, 1, 3), (33, 1, 3), (34, 1, 3), (35, 1, 3), (36, 1, 3), (37, 1, 3), (38, 1, 3), (39, 1, 3), (40, 1, 3),
(41, 1, 3),(42, 1, 3), (43, 1, 3), (44, 1, 3), (45, 1, 3), (46, 1, 3), (47, 1, 3), (48, 1, 3),(49, 1, 3), (50, 1, 3),
(51, 1, 3), (52, 1, 3), (53, 1, 3), (54, 1, 3), (55, 1, 3), (56, 1, 3), (57, 1, 3), (58, 1, 3), (59, 1, 3), (60, 1, 3),
(61, 1, 3), (62, 1, 3), (63, 1, 3), (64, 1, 3), (65, 1, 3), (66, 1, 3), (67, 1, 3), (68, 1, 3), (69, 1, 3), (70, 1, 3),
(71, 1, 3), (72, 1, 3), (73, 1, 3), (74, 1, 3), (75, 1, 3), (76, 1, 3), (77, 1, 3), (78, 1, 3), (79, 1, 3), (80, 1, 3),
(81, 1, 3), (82, 1, 3), (83, 1, 3), (84, 1, 3), (85, 1, 3), (86, 1, 3), (87, 1, 3), (88, 1, 3), (89, 1, 3), (90, 1, 3),
(91, 1, 3), (92, 1, 3), (93, 1, 3), (94, 1, 3), (95, 1, 3), (96, 1, 3), (97, 1, 3), (98, 1, 3), (99, 1, 3), (100, 1, 3),
(101, 1, 3), (102, 1, 3), (103, 1, 3), (104, 1, 3), (105, 1, 3), (106, 1, 3), (107, 1, 3), (108, 1, 3), (109, 1, 3), (110, 1, 3),
(111, 1, 3), (112, 1, 3), (113, 1, 3), (114, 1, 3), (115, 1, 3), (116, 1, 3), (117, 1, 3), (118, 1, 3), (119, 1, 3), (120, 1, 3),
(121, 1, 3), (122, 1, 3), (123, 1, 3), (124, 1, 3), (125, 1, 3), (126, 1, 3), (127, 1, 3), (128, 1, 3), (129, 1, 3), (130, 1, 3),
(131, 1, 3), (132, 1, 3), (133, 1, 3), (134, 1, 3), (135, 1, 3), (136, 1, 3), (137, 1, 3), (138, 1, 3), (139, 1, 3), (140, 1, 3),
(141, 1, 3), (142, 1, 3), (143, 1, 3), (144, 1, 3), (145, 1, 3), (146, 1, 3), (147, 1, 3), (148, 1, 3), (149, 1, 3), (150, 1, 3),
(151, 1, 3), (152, 1, 3), (153, 1, 3), (154, 1, 3), (155, 1, 3), (156, 1, 3), (157, 1, 3), (158, 1, 3), (159, 1, 3), (160, 1, 3),
(161, 1, 3), (162, 1, 3), (163, 1, 3), (164, 1, 3), (165, 1, 3), (166, 1, 3), (167, 1, 3), (168, 1, 3), (169, 1, 3), (170, 1, 3),
(171, 1, 3), (172, 1, 3), (173, 1, 3), (174, 1, 3), (175, 1, 3), (176, 1, 3), (177, 1, 3), (178, 1, 3), (179, 1, 3), (180, 1, 3),
(181, 1, 3), (182, 1, 3), (183, 1, 3), (184, 1, 3), (185, 1, 3), (186, 1, 3), (187, 1, 3), (188, 1, 3), (189, 1, 3), (190, 1, 3),
(191, 1, 3), (192, 1, 3), (193, 1, 3), (194, 1, 3), (195, 1, 3), (196, 1, 3), (197, 1, 3), (198, 1, 3), (199, 1, 3), (200, 1, 3),
(1, 1, 4), (2, 1, 4), (3, 1, 4), (4, 1, 4), (5, 1, 4), (6, 1, 4), (7, 1, 4), (8, 1, 4), (9, 1, 4), (10, 1, 4),
(11, 1, 4), (12, 1, 4), (13, 1, 4), (14, 1, 4), (15, 1, 4), (16, 1, 4), (17, 1, 4), (18, 1, 4), (19, 1, 4), (20, 1, 4),
(21, 1, 4), (22, 1, 4), (23, 1, 4), (24, 1, 4), (25, 1, 4), (26, 1, 4), (27, 1, 4), (28, 1, 4), (29, 1, 4), (30, 1, 4),
(31, 1, 4), (32, 1, 4), (33, 1, 4), (34, 1, 4), (35, 1, 4), (36, 1, 4), (37, 1, 4), (38, 1, 4), (39, 1, 4), (40, 1, 4),
(41, 1, 4),(42, 1, 4), (43, 1, 4), (44, 1, 4), (45, 1, 4), (46, 1, 4), (47, 1, 4), (48, 1, 4),(49, 1, 4), (50, 1, 4),
(51, 1, 4), (52, 1, 4), (53, 1, 4), (54, 1, 4), (55, 1, 4), (56, 1, 4), (57, 1, 4), (58, 1, 4), (59, 1, 4), (60, 1, 4),
(61, 1, 4), (62, 1, 4), (63, 1, 4), (64, 1, 4), (65, 1, 4), (66, 1, 4), (67, 1, 4), (68, 1, 4), (69, 1, 4), (70, 1, 4),
(71, 1, 4), (72, 1, 4), (73, 1, 4), (74, 1, 4), (75, 1, 4), (76, 1, 4), (77, 1, 4), (78, 1, 4), (79, 1, 4), (80, 1, 4),
(81, 1, 4), (82, 1, 4), (83, 1, 4), (84, 1, 4), (85, 1, 4), (86, 1, 4), (87, 1, 4), (88, 1, 4), (89, 1, 4), (90, 1, 4),
(91, 1, 4), (92, 1, 4), (93, 1, 4), (94, 1, 4), (95, 1, 4), (96, 1, 4), (97, 1, 4), (98, 1, 4), (99, 1, 4), (100, 1, 4),
(101, 1, 4), (102, 1, 4), (103, 1, 4), (104, 1, 4), (105, 1, 4), (106, 1, 4), (107, 1, 4), (108, 1, 4), (109, 1, 4), (110, 1, 4),
(111, 1, 4), (112, 1, 4), (113, 1, 4), (114, 1, 4), (115, 1, 4), (116, 1, 4), (117, 1, 4), (118, 1, 4), (119, 1, 4), (120, 1, 4),
(121, 1, 4), (122, 1, 4), (123, 1, 4), (124, 1, 4), (125, 1, 4), (126, 1, 4), (127, 1, 4), (128, 1, 4), (129, 1, 4), (130, 1, 4),
(131, 1, 4), (132, 1, 4), (133, 1, 4), (134, 1, 4), (135, 1, 4), (136, 1, 4), (137, 1, 4), (138, 1, 4), (139, 1, 4), (140, 1, 4),
(141, 1, 4), (142, 1, 4), (143, 1, 4), (144, 1, 4), (145, 1, 4), (146, 1, 4), (147, 1, 4), (148, 1, 4), (149, 1, 4), (150, 1, 4),
(151, 1, 4), (152, 1, 4), (153, 1, 4), (154, 1, 4), (155, 1, 4), (156, 1, 4), (157, 1, 4), (158, 1, 4), (159, 1, 4), (160, 1, 4),
(161, 1, 4), (162, 1, 4), (163, 1, 4), (164, 1, 4), (165, 1, 4), (166, 1, 4), (167, 1, 4), (168, 1, 4), (169, 1, 4), (170, 1, 4),
(171, 1, 4), (172, 1, 4), (173, 1, 4), (174, 1, 4), (175, 1, 4), (176, 1, 4), (177, 1, 4), (178, 1, 4), (179, 1, 4), (180, 1, 4),
(181, 1, 4), (182, 1, 4), (183, 1, 4), (184, 1, 4), (185, 1, 4), (186, 1, 4), (187, 1, 4), (188, 1, 4), (189, 1, 4), (190, 1, 4),
(191, 1, 4), (192, 1, 4), (193, 1, 4), (194, 1, 4), (195, 1, 4), (196, 1, 4), (197, 1, 4), (198, 1, 4), (199, 1, 4), (200, 1, 4),
(201, 1, 4), (202, 1, 4), (203, 1, 4), (204, 1, 4), (205, 1, 4), (206, 1, 4), (207, 1, 4), (208, 1, 4), (209, 1, 4), (210, 1, 4);

COMMIT;

INSERT INTO Customer VALUES
(1230, 'Wasif Mehmood', 2, 1024, 1, 1);

COMMIT;