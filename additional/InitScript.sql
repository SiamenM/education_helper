-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema education_helper
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema education_helper
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `education_helper` DEFAULT CHARACTER SET utf8 ;
USE `education_helper` ;

-- -----------------------------------------------------
-- Table `education_helper`.`disciple`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `education_helper`.`disciple` ;

CREATE TABLE IF NOT EXISTS `education_helper`.`disciple` (
  `disciple_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `disciple_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`disciple_id`),
  UNIQUE INDEX `disciple_name_UNIQUE` (`disciple_name` ASC) VISIBLE,
  UNIQUE INDEX `disiciple_id_UNIQUE` (`disciple_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `education_helper`.`type_of_paper`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `education_helper`.`type_of_paper` ;

CREATE TABLE IF NOT EXISTS `education_helper`.`type_of_paper` (
  `type_of_paper_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `type_of_paper_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`type_of_paper_id`),
  UNIQUE INDEX `id_type_of_paper_UNIQUE` (`type_of_paper_id` ASC) VISIBLE,
  UNIQUE INDEX `type_of_paper_name_UNIQUE` (`type_of_paper_name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `education_helper`.`file`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `education_helper`.`file` ;

CREATE TABLE IF NOT EXISTS `education_helper`.`file` (
  `id_file` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `file_name` VARCHAR(100) NOT NULL,
  `archive` MEDIUMBLOB NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  `description` VARCHAR(5000) NULL DEFAULT NULL,
  `add_date` TIMESTAMP(6) NOT NULL,
  `download_count` INT UNSIGNED NULL DEFAULT 0,
  `disciple_id` INT NOT NULL,
  `type_of_paper_id` INT NOT NULL,
  PRIMARY KEY (`id_file`, `disciple_id`, `type_of_paper_id`),
  UNIQUE INDEX `id_file_UNIQUE` (`id_file` ASC) VISIBLE,
  UNIQUE INDEX `file_name_UNIQUE` (`file_name` ASC) VISIBLE,
  INDEX `fk_file_disiciple1_idx` (`disciple_id` ASC) VISIBLE,
  INDEX `fk_file_type_of_paper1_idx` (`type_of_paper_id` ASC) VISIBLE,
  CONSTRAINT `fk_file_disiciple1`
    FOREIGN KEY (`disciple_id`)
    REFERENCES `education_helper`.`disciple` (`disciple_id`),
  CONSTRAINT `fk_file_type_of_paper1`
    FOREIGN KEY (`type_of_paper_id`)
    REFERENCES `education_helper`.`type_of_paper` (`type_of_paper_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `education_helper`.`comment_for_file`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `education_helper`.`comment_for_file` ;

CREATE TABLE IF NOT EXISTS `education_helper`.`comment_for_file` (
  `comment_for_file_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment` VARCHAR(5000) NULL DEFAULT NULL,
  `grade` TINYINT(1) UNSIGNED NOT NULL,
  `file_id` INT NOT NULL,
  PRIMARY KEY (`comment_for_file_id`, `file_id`),
  UNIQUE INDEX `id_comment_for_file_UNIQUE` (`comment_for_file_id` ASC) VISIBLE,
  INDEX `fk_comment_for_file_file1_idx` (`file_id` ASC) VISIBLE,
  CONSTRAINT `fk_comment_for_file_file1`
    FOREIGN KEY (`file_id`)
    REFERENCES `education_helper`.`file` (`id_file`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `education_helper`.`role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `education_helper`.`role` ;

CREATE TABLE IF NOT EXISTS `education_helper`.`role` (
  `role_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE INDEX `id_role_UNIQUE` (`role_id` ASC) VISIBLE,
  UNIQUE INDEX `role_name_UNIQUE` (`role_name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `education_helper`.`wallet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `education_helper`.`wallet` ;

CREATE TABLE IF NOT EXISTS `education_helper`.`wallet` (
  `wallet_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `wallet_amount` DECIMAL(10,2) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`wallet_id`),
  UNIQUE INDEX `id_wallet_UNIQUE` (`wallet_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `education_helper`.`user_account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `education_helper`.`user_account` ;

CREATE TABLE IF NOT EXISTS `education_helper`.`user_account` (
  `user_account_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_account_name` VARCHAR(100) NOT NULL,
  `user_account_email` VARCHAR(100) NOT NULL,
  `user_account_phone` VARCHAR(20) NOT NULL,
  `user_account_password` VARCHAR(100) NOT NULL,
  `user_account_registration_date` TIMESTAMP(6) NOT NULL,
  `id_wallet` INT NOT NULL,
  PRIMARY KEY (`user_account_id`, `id_wallet`),
  UNIQUE INDEX `id_user_account_UNIQUE` (`user_account_id` ASC) VISIBLE,
  UNIQUE INDEX `user_account_email_UNIQUE` (`user_account_email` ASC) VISIBLE,
  UNIQUE INDEX `user_account_phone_UNIQUE` (`user_account_phone` ASC) VISIBLE,
  INDEX `fk_user_account_wallet_idx` (`id_wallet` ASC) VISIBLE,
  UNIQUE INDEX `user_account_name_UNIQUE` (`user_account_name` ASC) VISIBLE,
  CONSTRAINT `fk_user_account_wallet`
    FOREIGN KEY (`id_wallet`)
    REFERENCES `education_helper`.`wallet` (`wallet_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `education_helper`.`user_account_has_file`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `education_helper`.`user_account_has_file` ;

CREATE TABLE IF NOT EXISTS `education_helper`.`user_account_has_file` (
  `user_account_id` INT NOT NULL,
  `file_id` INT NOT NULL,
  PRIMARY KEY (`user_account_id`, `file_id`),
  INDEX `fk_user_account_has_file_file1_idx` (`file_id` ASC) VISIBLE,
  INDEX `fk_user_account_has_file_user_account1_idx` (`user_account_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_account_has_file_file1`
    FOREIGN KEY (`file_id`)
    REFERENCES `education_helper`.`file` (`id_file`),
  CONSTRAINT `fk_user_account_has_file_user_account1`
    FOREIGN KEY (`user_account_id`)
    REFERENCES `education_helper`.`user_account` (`user_account_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `education_helper`.`user_account_has_role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `education_helper`.`user_account_has_role` ;

CREATE TABLE IF NOT EXISTS `education_helper`.`user_account_has_role` (
  `user_account_id` INT NOT NULL,
  `role_id` INT NOT NULL,
  PRIMARY KEY (`user_account_id`, `role_id`),
  INDEX `fk_user_account_has_role_role1_idx` (`role_id` ASC) VISIBLE,
  INDEX `fk_user_account_has_role_user_account1_idx` (`user_account_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_account_has_role_role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `education_helper`.`role` (`role_id`),
  CONSTRAINT `fk_user_account_has_role_user_account1`
    FOREIGN KEY (`user_account_id`)
    REFERENCES `education_helper`.`user_account` (`user_account_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
