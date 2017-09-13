-- Project Sasquatch
-- Donovan Miller, 8/11/2017
-- Edited by: Donovan Miller 9/6/17

-- Drops/removes the tables.
Drop Table Rep_in_set cascade constraints;

DROP TABLE Part_of_body cascade constraints;

DROP TABLE The_set cascade constraints;

DROP TABLE Exercise cascade constraints;

DROP TABLE User cascade constraints;

-- Exercise table contains the name, type
-- and difficulty level of the exercise.
-- Exercise types: warmups, push, pull, legs, core
-- Difficulty level:  Easy, Intermediate , Hard

CREATE TABLE Exercise
(exrcise_id     INT  NOT NULL,
 exrcise_name   VARCHAR(20),
 exrcise_type   VARCHAR(20),
 exrcise_lvl    VARCHAR(10), 
 PRIMARY KEY    (exrcise_id)
);

-- The_set table contains the number of sets
-- and is meant to connect to the Rep_in_set table
-- easier. 
CREATE TABLE The_set
(set_id       INT NOT NULL,
 exrcise_id   INT NOT NULL,
 num_of_set   INT,
 PRIMARY KEY  (set_id),
 FOREIGN KEY  (exrcise_id) references Exercise
);

-- Rep_in_set keeps track of the reps and weight w/in the set
-- using the num_of_set to reference the The_set table
-- reps, weight, and perceived_exertion are multivalued attributes
-- the The_set table
CREATE TABLE Rep_in_set
(rep_id             INT,
 set_id             INT,
 reps               INT,
 weight             INT,
 perceived_exertion INT,
 PRIMARY KEY        (rep_id),
 FOREIGN KEY        (set_id) references The_set
);

-- Part_of_body keeps track of the parts of the body
-- The part_name is a multivalued attribute for 
-- the Exercise table
CREATE TABLE Part_of_body
(part_id        INT,
 exrcise_id     INT,
 part_name      VARCHAR(30),
 PRIMARY KEY    (part_id),
 FOREIGN KEY    (exrcise_id) references Exercise
);


CREATE TABLE User
(user_id     INT NOT NULL,
 username    VARCHAR(45) NOT NULL,
 password    VARCHAR(45) NOT NULL,
 PRIMARY KEY (user_id)
);