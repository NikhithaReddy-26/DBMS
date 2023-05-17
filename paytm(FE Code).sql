-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Paytm
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Paytm
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Paytm` DEFAULT CHARACTER SET utf8 ;
USE `Paytm` ;

-- -----------------------------------------------------
-- Table `Paytm`.`Branch`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Paytm`.`Branch` (
  `BranchID` INT NOT NULL,
  `BankName` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  `BranchName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`BranchID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Paytm`.`Accounts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Paytm`.`Accounts` (
  `idAccounts` INT NOT NULL,
  `Accountholder_Name` VARCHAR(45) NOT NULL,
  `Account_Type` VARCHAR(45) NOT NULL,
  `Balance` INT NOT NULL,
  `BankName` VARCHAR(45) NOT NULL,
  `Account_OpenDate` DATE NULL,
  `Account_Expiry` DATE NULL,
  `Branch_BranchID` INT NOT NULL,
  PRIMARY KEY (`idAccounts`),
  INDEX `fk_Accounts_Branch1_idx` (`Branch_BranchID` ASC) VISIBLE,
  CONSTRAINT `fk_Accounts_Branch1`
    FOREIGN KEY (`Branch_BranchID`)
    REFERENCES `Paytm`.`Branch` (`BranchID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Paytm`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Paytm`.`Customers` (
  `idCustomer` INT NOT NULL,
  `Customer_FirstName` VARCHAR(45) NOT NULL,
  `Customer_LastName` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  `Age` INT NOT NULL,
  `Gender` VARCHAR(10) NOT NULL,
  `Branch_BranchID` INT NOT NULL,
  PRIMARY KEY (`idCustomer`),
  INDEX `fk_Customers_Branch1_idx` (`Branch_BranchID` ASC) VISIBLE,
  CONSTRAINT `fk_Customers_Branch1`
    FOREIGN KEY (`Branch_BranchID`)
    REFERENCES `Paytm`.`Branch` (`BranchID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Paytm`.`Branches_has_Accounts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Paytm`.`Branches_has_Accounts` (
  `Branches_idCustomer` INT NOT NULL,
  `Accounts_idAccounts` INT NOT NULL,
  PRIMARY KEY (`Branches_idCustomer`, `Accounts_idAccounts`),
  INDEX `fk_Branches_has_Accounts_Accounts1_idx` (`Accounts_idAccounts` ASC) VISIBLE,
  INDEX `fk_Branches_has_Accounts_Branches1_idx` (`Branches_idCustomer` ASC) VISIBLE,
  CONSTRAINT `fk_Branches_has_Accounts_Branches1`
    FOREIGN KEY (`Branches_idCustomer`)
    REFERENCES `Paytm`.`Customers` (`idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Branches_has_Accounts_Accounts1`
    FOREIGN KEY (`Accounts_idAccounts`)
    REFERENCES `Paytm`.`Accounts` (`idAccounts`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
