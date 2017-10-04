-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema projsasq
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema projsasq
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `projsasq` DEFAULT CHARACTER SET utf8 ;
USE `projsasq` ;

-- -----------------------------------------------------
-- Table `projsasq`.`exercise`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projsasq`.`exercise` (
  `exrcise_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `exrcise_name` VARCHAR(20) NOT NULL,
  `exrcise_type` ENUM('WARMUP', 'PUSH', 'PULL', 'LEGS', 'CORE') NOT NULL,
  `exrcise_lvl` ENUM('EASY', 'INTERMEDIATE', 'HARD') NOT NULL,
  PRIMARY KEY (`exrcise_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `projsasq`.`part_of_body`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projsasq`.`part_of_body` (
  `part_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `part_name` VARCHAR(45) NULL DEFAULT NULL,
  `exrcise_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`part_id`),
  INDEX `exrcise_id_idx` (`exrcise_id` ASC),
  CONSTRAINT `exrcise_id2`
    FOREIGN KEY (`exrcise_id`)
    REFERENCES `projsasq`.`exercise` (`exrcise_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `projsasq`.`the_set`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projsasq`.`the_set` (
  `set_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `num_of_set` INT(10) UNSIGNED NOT NULL,
  `exrcise_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`set_id`),
  INDEX `exrcise_id_idx` (`exrcise_id` ASC),
  CONSTRAINT `exrcise_id`
    FOREIGN KEY (`exrcise_id`)
    REFERENCES `projsasq`.`exercise` (`exrcise_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `projsasq`.`rep_in_set`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projsasq`.`rep_in_set` (
  `rep_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `reps` INT(10) UNSIGNED NOT NULL,
  `weight` INT(10) UNSIGNED NULL DEFAULT NULL,
  `perceived_exertion` INT(10) UNSIGNED NULL DEFAULT NULL,
  `set_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`rep_id`),
  INDEX `set_id_idx` (`set_id` ASC),
  CONSTRAINT `set_id`
    FOREIGN KEY (`set_id`)
    REFERENCES `projsasq`.`the_set` (`set_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `projsasq`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projsasq`.`user` (
  `user_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
