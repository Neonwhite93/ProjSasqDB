--Comment block at top of each page
--Project Name, Date created
--Note within top block for each edit (who, when, what)
--e.g. -Nathan 8/19/17 (added to conventions)
--Comment for each create table statement and insert group

-- Project Sasquatch
-- Created: Donovan Miller 8/11/2017
-- Edited by: 

-- Drops and removes the tables.
Drop Table Rep_in_set cascade constraints;

Drop Table Part_of_body cascade constraints;

Drop Table The_set cascade constraints;

Drop Table Exercise cascade constraints;

-- Exercise table contains the name, type
-- and difficulty level of the exercise.
-- Exercise types: warmups, push, pull, legs, core
-- Difficulty level:  Easy, Intermediate , Hard

Create Table Exercise
(exrcise_id     char(5),
 exrcise_name   varchar2(20),
 exrcise_type   varchar2(20),
 exrcise_lvl    varchar2(10), 
 PRIMARY KEY    (exrcise_id)
);

-- The_set table contains the number of sets
-- and is meant to connect to the Rep_in_set table
-- easier. 
Create Table The_set
(set_id       char(5),
 exrcise_id   char(5),
 num_of_set   int,
 PRIMARY KEY  (set_id),
 FOREIGN KEY  (exrcise_id) references Exercise
);

-- Rep_in_set keeps track of the reps and weight w/in the set
-- using the num_of_set to reference the The_set table
-- reps, weight, and perceived_exertion are multivalued attributes
-- the The_set table
Create Table Rep_in_set
(rep_id             char(5),
 set_id             char(5),
 reps               int,
 weight             int,
 perceived_exertion int,
 PRIMARY KEY        (rep_id),
 FOREIGN KEY        (set_id) references The_set
);

-- Part_of_body keeps track of the parts of the body
-- The part_name is a multivalued attribute for 
-- the Exercise table
Create Table Part_of_body
(part_id        char(5),
 exrcise_id     char(5),
 part_name      varchar2(30),
 PRIMARY KEY    (part_id),
 FOREIGN KEY    (exrcise_id) references Exercise
);


