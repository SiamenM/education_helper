-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema education_helper
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema education_helper
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `education_helper` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `education_helper` ;

-- -----------------------------------------------------
-- Table `education_helper`.`disciple`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `education_helper`.`disciple` (
  `disciple_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `disciple_name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`disciple_id`),
  UNIQUE INDEX `disciple_id` (`disciple_id` ASC) VISIBLE,
  UNIQUE INDEX `disciple_name` (`disciple_name` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `education_helper`.`type_of_paper`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `education_helper`.`type_of_paper` (
  `type_of_paper_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `type_of_paper_name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`type_of_paper_id`),
  UNIQUE INDEX `type_of_paper_id` (`type_of_paper_id` ASC) VISIBLE,
  UNIQUE INDEX `type_of_paper_name` (`type_of_paper_name` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `education_helper`.`file`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `education_helper`.`file` (
  `id_file` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `file_name` VARCHAR(100) NOT NULL,
  `archive` MEDIUMBLOB NOT NULL,
  `file_price` DECIMAL(10,2) NOT NULL,
  `description` VARCHAR(5000) NOT NULL,
  `add_date` TIMESTAMP(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `file_is_available` TINYINT NOT NULL DEFAULT 0,
  `disciple_id` BIGINT UNSIGNED NOT NULL,
  `type_of_paper_id` BIGINT UNSIGNED NOT NULL,
  `user_author_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_file`, `disciple_id`, `type_of_paper_id`),
  UNIQUE INDEX `id_file` (`id_file` ASC) VISIBLE,
  INDEX `id_file_index` (`id_file` ASC) VISIBLE,
  INDEX `file_name_index` (`file_name` ASC) VISIBLE,
  INDEX `fk_file_disciple` (`disciple_id` ASC) VISIBLE,
  INDEX `fk_file_type_of_paper` (`type_of_paper_id` ASC) VISIBLE,
  CONSTRAINT `fk_file_disciple`
    FOREIGN KEY (`disciple_id`)
    REFERENCES `education_helper`.`disciple` (`disciple_id`),
  CONSTRAINT `fk_file_type_of_paper`
    FOREIGN KEY (`type_of_paper_id`)
    REFERENCES `education_helper`.`type_of_paper` (`type_of_paper_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `education_helper`.`comment_for_file`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `education_helper`.`comment_for_file` (
  `comment_for_file_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `comment` VARCHAR(5000) NULL DEFAULT NULL,
  `grade` TINYINT UNSIGNED NOT NULL,
  `file_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`comment_for_file_id`, `file_id`),
  UNIQUE INDEX `comment_for_file_id` (`comment_for_file_id` ASC) VISIBLE,
  INDEX `comment_for_file_id_index` (`comment_for_file_id` ASC) VISIBLE,
  INDEX `file_id_index` (`file_id` ASC) VISIBLE,
  CONSTRAINT `fk_comment_for_file`
    FOREIGN KEY (`file_id`)
    REFERENCES `education_helper`.`file` (`id_file`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `education_helper`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `education_helper`.`role` (
  `role_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE INDEX `role_id` (`role_id` ASC) VISIBLE,
  UNIQUE INDEX `role_name` (`role_name` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `education_helper`.`wallet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `education_helper`.`wallet` (
  `wallet_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `wallet_amount` DECIMAL(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`wallet_id`),
  UNIQUE INDEX `wallet_id` (`wallet_id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `education_helper`.`user_account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `education_helper`.`user_account` (
  `user_account_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_account_name` VARCHAR(100) NOT NULL,
  `user_account_email` VARCHAR(100) NOT NULL,
  `user_account_phone` VARCHAR(20) NOT NULL,
  `user_account_password` VARCHAR(100) NOT NULL,
  `user_account_registration_date` TIMESTAMP(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `user_account_is_available` TINYINT NOT NULL DEFAULT 0,
  `wallet_wallet_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`user_account_id`, `wallet_wallet_id`),
  UNIQUE INDEX `user_account_id` (`user_account_id` ASC) VISIBLE,
  UNIQUE INDEX `user_account_email` (`user_account_email` ASC) VISIBLE,
  UNIQUE INDEX `user_account_phone` (`user_account_phone` ASC) VISIBLE,
  INDEX `user_account_id_index` (`user_account_id` ASC) VISIBLE,
  INDEX `user_account_phone_index` (`user_account_phone` ASC) VISIBLE,
  INDEX `fk_user_account_wallet1_idx` (`wallet_wallet_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_account_wallet1`
    FOREIGN KEY (`wallet_wallet_id`)
    REFERENCES `education_helper`.`wallet` (`wallet_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `education_helper`.`user_account_has_file`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `education_helper`.`user_account_has_file` (
  `user_account_id` BIGINT UNSIGNED NOT NULL,
  `file_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`user_account_id`, `file_id`),
  INDEX `file_id` (`file_id` ASC) VISIBLE,
  CONSTRAINT `user_account_has_file_ibfk_1`
    FOREIGN KEY (`user_account_id`)
    REFERENCES `education_helper`.`user_account` (`user_account_id`),
  CONSTRAINT `user_account_has_file_ibfk_2`
    FOREIGN KEY (`file_id`)
    REFERENCES `education_helper`.`file` (`id_file`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `education_helper`.`user_account_has_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `education_helper`.`user_account_has_role` (
  `user_account_id` BIGINT UNSIGNED NOT NULL,
  `role_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`user_account_id`, `role_id`),
  INDEX `role_id` (`role_id` ASC) VISIBLE,
  CONSTRAINT `user_account_has_role_ibfk_1`
    FOREIGN KEY (`user_account_id`)
    REFERENCES `education_helper`.`user_account` (`user_account_id`),
  CONSTRAINT `user_account_has_role_ibfk_2`
    FOREIGN KEY (`role_id`)
    REFERENCES `education_helper`.`role` (`role_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
