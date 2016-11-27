-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema e_commerce
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema e_commerce
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `e_commerce` DEFAULT CHARACTER SET utf8 ;
USE `e_commerce` ;

-- -----------------------------------------------------
-- Table `e_commerce`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e_commerce`.`User` (
  `idUser` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `MailUser` VARCHAR(45) NOT NULL,
  `Role` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idUser`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e_commerce`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e_commerce`.`Customer` (
  `idCustomer` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `User_idUser` INT UNSIGNED NOT NULL,
  `UserName` VARCHAR(100) NULL,
  `postNumber` INT NULL,
  `mobileNumber` VARCHAR(20) NULL,
  `PaymentMethod` VARCHAR(20) NULL,
  PRIMARY KEY (`idCustomer`),
  INDEX `fk_Customer_User1_idx` (`User_idUser` ASC),
  CONSTRAINT `fk_Customer_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `e_commerce`.`User` (`idUser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e_commerce`.`Admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e_commerce`.`Admin` (
  `idAdmin` INT UNSIGNED NOT NULL,
  `idUser` INT UNSIGNED NOT NULL,
  `AdminName` VARCHAR(100) NULL,
  `AdminRole` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idAdmin`),
  INDEX `fk_Admin_User1_idx` (`idUser` ASC),
  CONSTRAINT `fk_Admin_User1`
    FOREIGN KEY (`idUser`)
    REFERENCES `e_commerce`.`User` (`idUser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e_commerce`.`Category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e_commerce`.`Category` (
  `idCategory` INT UNSIGNED NOT NULL,
  `CategoryName` VARCHAR(100) NULL,
  `Description` VARCHAR(100) NULL,
  PRIMARY KEY (`idCategory`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e_commerce`.`Cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e_commerce`.`Cart` (
  `idCart` BIGINT(20) UNSIGNED NOT NULL,
  `idCustomer` INT UNSIGNED NOT NULL,
  `idProduct` INT UNSIGNED NOT NULL,
  `AddingDate` DATE NULL,
  `CartState` VARCHAR(45) NULL,
  PRIMARY KEY (`idCart`),
  INDEX `fk_Cart_Customer1_idx` (`idCustomer` ASC),
  CONSTRAINT `fk_Cart_Customer1`
    FOREIGN KEY (`idCustomer`)
    REFERENCES `e_commerce`.`Customer` (`idCustomer`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e_commerce`.`Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e_commerce`.`Product` (
  `idProduct` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `idCategory` INT UNSIGNED NOT NULL,
  `idSubCategory` INT UNSIGNED NULL,
  `Title` VARCHAR(200) NOT NULL,
  `Price` DOUBLE UNSIGNED NOT NULL,
  `Description` VARCHAR(1000) NULL,
  `ImagePath` VARCHAR(100) NULL,
  `Cart_idCart` BIGINT(20) UNSIGNED NOT NULL,
  `Cart_Order_idOrder` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idProduct`, `Cart_idCart`, `Cart_Order_idOrder`),
  INDEX `idProductCategory_idx` (`idCategory` ASC),
  CONSTRAINT `idProductCategory`
    FOREIGN KEY (`idCategory`)
    REFERENCES `e_commerce`.`Category` (`idCategory`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Product_Cart1`
    FOREIGN KEY (`idProduct`)
    REFERENCES `e_commerce`.`Cart` (`idProduct`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e_commerce`.`SubCategory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e_commerce`.`SubCategory` (
  `idSubCategory` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `idCategory` INT UNSIGNED NOT NULL,
  `SubCategoryName` VARCHAR(100) NULL,
  PRIMARY KEY (`idSubCategory`),
  INDEX `idSubCategoryCategory_idx` (`idCategory` ASC),
  CONSTRAINT `idSubCategoryCategory`
    FOREIGN KEY (`idCategory`)
    REFERENCES `e_commerce`.`Category` (`idCategory`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_SubCategory_Product1`
    FOREIGN KEY (`idSubCategory`)
    REFERENCES `e_commerce`.`Product` (`idSubCategory`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e_commerce`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e_commerce`.`Order` (
  `idOrder` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `idCustomer` INT UNSIGNED NOT NULL,
  `Cart_idCart` BIGINT(20) UNSIGNED NOT NULL,
  `OrderDate` DATE NULL,
  `OrderCity` VARCHAR(45) NULL,
  `OrderState` VARCHAR(45) NULL,
  `OrderAddress` VARCHAR(200) NULL,
  `OrderMethod` VARCHAR(45) NULL,
  `OrderPaymentId` VARCHAR(100) NULL,
  `OrderPaymentLink` VARCHAR(200) NULL,
  PRIMARY KEY (`idOrder`),
  INDEX `fk_Order_Customer1_idx` (`idCustomer` ASC),
  INDEX `fk_Order_Cart1_idx` (`Cart_idCart` ASC),
  CONSTRAINT `fk_Order_Customer1`
    FOREIGN KEY (`idCustomer`)
    REFERENCES `e_commerce`.`Customer` (`idCustomer`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Order_Cart1`
    FOREIGN KEY (`Cart_idCart`)
    REFERENCES `e_commerce`.`Cart` (`idCart`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
