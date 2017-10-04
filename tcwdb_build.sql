-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema tcwdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tcwdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tcwdb` DEFAULT CHARACTER SET utf8 ;
USE `tcwdb` ;


-- -----------------------------------------------------
-- Table `tcwdb`.`Exercise`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcwdb`.`Exercise` (
  `exrcise_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `exrcise_name` VARCHAR(30) NOT NULL,
  `exrcise_type` ENUM('WARMUP', 'PUSH', 'PULL', 'LEGS', 'CORE') NOT NULL,
  `exrcise_lvl` ENUM('EASY', 'INTERMEDIATE', 'HARD') NOT NULL,
  PRIMARY KEY (`exrcise_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;



-- -----------------------------------------------------
-- Table `tcwdb`.`Set_Group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcwdb`.`Set_Group` (
  `set_group_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `num_of_sets` INT(3) UNSIGNED,
  `exercise_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`set_group_id`),
  INDEX `exercise_id_idx` (`exercise_id` ASC),
CONSTRAINT 'exercise_id'
  FOREIGN KEY (`exercise_id`)
  REFERENCES `twcdb`.`Exercise` (`exercise_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;



-- -----------------------------------------------------
-- Table `tcwdb`.`Set`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcwdb`.`Set` (
  `set_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `reps` INT(4) UNSIGNED,
  `weight` INT(5) UNSIGNED,
  `perceived_exertion` DECIMAL(4,2),
  `set_group_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`set_id`),
  INDEX `set_group_id_idx` (`set_group_id` ASC),
  CONSTRAINT `set_group_id`
    FOREIGN KEY (`set_group_id`)
    REFERENCES `twcdb`.`Set_Group` (`set_group_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;



-- -----------------------------------------------------
-- Table `tcwdb`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcwdb`.`User` (
  `username` VARCHAR(8) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `type` ENUM('STANDARD', 'ADMIN') NOT NULL,
  `class` ENUM('PE 157', 'PE 158', 'NONE') NOT NULL,
  `team` ENUM('FOOTBALL', 'SOFTBALL', 'BASKETBALL', 'CROSS COUNTRY', 'TRACK AND FIELD', 'SOCCER', 'ROWING', 'VOLLEYBALL', 'NONE') NOT NULL,
  `f_name` VARCHAR(30) NOT NULL,
  `l_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`username`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tcwdb`.`Workout`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcwdb`.`Workout` (
  `workout_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `workout_name` VARCHAR(45) NOT NULL,
  `assigned_bool` BOOLEAN NOT NULL,
  `username` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`workout_id`),
  INDEX `username_idx` (`username` ASC),
  CONSTRAINT `username`
    FOREIGN KEY (`username`)
    REFERENCES `tcwdb`.`User` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;



-- -----------------------------------------------------
-- Table `tcwdb`.`Completed_Workout`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcwdb`.`Completed_Workout` (
  `workout_id` INT(10) UNSIGNED NOT NULL,
  `username` VARCHAR(8) NOT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`workout_id`),
  INDEX `workout_id_idx` (`workout_id` ASC),
  CONSTRAINT `workout_id`
    FOREIGN KEY (`workout_id`)
    REFERENCES `tcwdb`.`Workout` (`workout_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
  INDEX `username_idx` (`username` ASC),
  CONSTRAINT `username`
    FOREIGN KEY (`username`)
    REFERENCES `tcwdb`.`Users` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tcwdb`.`Set_Group_In_Workout`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tcwdb`.`Set_Group_In_Workout` (
  `set_group_id` INT(10) UNSIGNED NOT NULL,
  `workout_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`set_group_id`, `workout_id`),
  INDEX `set_group_id_idx` (`set_group_id` ASC),
  CONSTRAINT `set_group_id`
    FOREIGN KEY (`set_group_id`)
    REFERENCES `tcwdb`.`Set_Group` (`set_group_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
  INDEX `workout_id_idx` (`workout_id` ASC),
  CONSTRAINT `workout_id`
    FOREIGN KEY (`workout_id`)
    REFERENCES `tcwdb`.`Workout` (`workout_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
