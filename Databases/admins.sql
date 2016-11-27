-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Ecommerce
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ecommerce
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ecommerce` ;
USE `Ecommerce` ;

-- -----------------------------------------------------
-- Table `Ecommerce`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce`.`User` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `UserName` VARCHAR(45) NOT NULL,
  `userEmail` VARCHAR(45) NULL,
  `userpassword` VARCHAR(45) NULL,
  PRIMARY KEY (`idUser`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ecommerce`.`Admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ecommerce`.`Admin` (
  `idAdmin` INT NOT NULL AUTO_INCREMENT,
  `idUser` INT NOT NULL,
  `AdminRole` VARCHAR(45) NULL,
  PRIMARY KEY (`idAdmin`),
  INDEX `AdminUser_idx` (`idUser` ASC),
  CONSTRAINT `AdminUser`
    FOREIGN KEY (`idUser`)
    REFERENCES `Ecommerce`.`User` (`idUser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
