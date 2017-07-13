DROP SCHEMA IF EXISTS `HeroSighting`;

CREATE SCHEMA IF NOT EXISTS `HeroSighting`;

USE `HeroSighting` ;


CREATE TABLE `Hero` (
  `HeroID` INT NOT NULL,
  `HeroName` VARCHAR(45) NOT NULL,
  `HeroDescription` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`HeroID`)
  );


CREATE TABLE `Power` (
  `PowerID` INT NOT NULL,
  `PowerName` VARCHAR(45) NOT NULL,
  `HeroID` INT NOT NULL,
  PRIMARY KEY (`PowerID`),
  INDEX `fk_Power_Hero1_idx` (`HeroID` ASC),
  CONSTRAINT `fk_Power_Hero1`
    FOREIGN KEY (`HeroID`)
    REFERENCES `Hero` (`HeroID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    );


CREATE TABLE `Organization` (
  `OrganizationID` INT NOT NULL,
  `OrganizationName` VARCHAR(45) NOT NULL,
  `OrganizationDescription` VARCHAR(150) NOT NULL,
  `OrganizationAddress` VARCHAR(150) NOT NULL,
  `OrganizationPhone` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`OrganizationID`)
  );


CREATE TABLE  `Location` (
  `LocationID` INT NOT NULL,
  `LocationName` VARCHAR(45) NOT NULL,
  `LocationAddress` VARCHAR(150) NOT NULL,
  `LocationLatitude` DECIMAL(15,4) NOT NULL,
  `LocationLongitude` DECIMAL(15,4) NOT NULL,
  PRIMARY KEY (`LocationID`)
  );


CREATE TABLE `Sighting` (
  `SightingID` INT NOT NULL,
  `SightingDateTime` DATETIME NOT NULL,
  `LocationID` INT NOT NULL,
  PRIMARY KEY (`SightingID`),
  INDEX `fk_Sighting_Location1_idx` (`LocationID` ASC),
  CONSTRAINT `fk_Sighting_Location1`
    FOREIGN KEY (`LocationID`)
    REFERENCES `Location` (`LocationID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    );


CREATE TABLE `Hero_Sighting` (
  `SightingID` INT NOT NULL,
  `HeroID` INT NOT NULL,
  INDEX `fk_Hero_Sighting_Hero1_idx` (`HeroID` ASC),
  CONSTRAINT `fk_Hero_Sighting_Sighting1`
    FOREIGN KEY (`SightingID`)
    REFERENCES `Sighting` (`SightingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Hero_Sighting_Hero1`
    FOREIGN KEY (`HeroID`)
    REFERENCES `Hero` (`HeroID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    );


CREATE TABLE  `Organization_Hero` (
  `HeroID` INT NOT NULL,
  `OrganizationID` INT NOT NULL,
  INDEX `fk_Organization_Hero_Hero1_idx` (`HeroID` ASC),
  INDEX `fk_Organization_Hero_Organization1_idx` (`OrganizationID` ASC),
  CONSTRAINT `fk_Organization_Hero_Hero1`
    FOREIGN KEY (`HeroID`)
    REFERENCES `Hero` (`HeroID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Organization_Hero_Organization1`
    FOREIGN KEY (`OrganizationID`)
    REFERENCES `Organization` (`OrganizationID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    );