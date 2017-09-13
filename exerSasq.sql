-- Project Sasquatch
-- Created by: Donovan Miller
-- Date Created: August 15, 2017
-- Date Edited:

-- This First section inserts the id, name, type, difficulty 
-- into the exercise table

-- Plate-warmup 
insert into Exercise
values
("00001", "Plate-Warmup", "Warmup", "Easy");

-- Push-ups
insert into Exercise
values
("00002", "Push-Ups", "Push", "Easy");

-- Pull-ups
insert into Exercise
values
("00003", "Pull-Ups", "Pull","Easy");

-- back squats
insert into Exercise
values
("00004", "Squats", "Leg", "Intermediate");

-- Planks
insert into Exercise
values
("00005", "Planks", "Core", "Easy");


-- This Section inserts the Set_id, Exrcise_id, 
-- and number of sets in integers
-- into the The_set table 
-- plate warmups (set id, exrcise id, # of sets)
--insert into The_set
--values
--("10001", "00001", 1);

-- push-ups
--insert into The_set
--values
--("10002", "00002", 5);

-- pull-ups
--insert into The_set
--values
--("10003", "00003", 5);

-- back squates
--insert into The_set
--values
--("10004", "00004", 5);

-- planks
--insert into The_set
--values
--("10005", "00005", 3);


-- This Section inserts the
-- 

-- plate warmups
--insert into Rep_in_set
--values
--("20001", "10001", 5, 10, 15);

-- push-ups
--insert into Rep_in_set
--values
--("20002", "10002", 5, 0, 50);

-- pull-ups
--insert into Rep_in_set
--values
--("20003", "10003", 5, 10, 60);

-- back squates
--insert into Rep_in_set
--values
--("20004", "10004", 5, 140, 80);

-- planks
--insert into Rep_in_set
--values
--("20005", "10005", 3, 45, 75);


--
--
-- plate warmups
insert into Part_of_body
values
("30001", "00001", );
-- push-ups
insert into Part_of_body
values
("30002", "00002", );

-- pull-ups
insert into Part_of_body
values
("30003", "00003", );

-- back squates
insert into Part_of_body
values
("30004", "00004", );

-- planks
insert into Part_of_body
values
("30005", "00005", );