-- MySQL Script generated by MySQL Workbench
-- Wed 31 Mar 2021 02:08:49 AM -04
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Laboratorio
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Laboratorio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Laboratorio` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
USE `Laboratorio` ;

-- -----------------------------------------------------
-- Table `Laboratorio`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Laboratorio`.`clientes` (
    `id` INT NULL AUTO_INCREMENT,
    `cedula` VARCHAR(45) NOT NULL,
    `nombre` VARCHAR(45) NOT NULL,
    `apellido` VARCHAR(45) NOT NULL,
    `correo` VARCHAR(320) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `cedula_UNIQUE` (`cedula` ASC) VISIBLE,
    UNIQUE INDEX `correo_UNIQUE` (`correo` ASC) VISIBLE)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Laboratorio`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Laboratorio`.`roles` (
                                                     `id` INT NULL AUTO_INCREMENT,
                                                     `nombre` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`id`))
    ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Laboratorio`.`users` (
                                                     `id` INT NOT NULL AUTO_INCREMENT,
                                                     `name` VARCHAR(45) NOT NULL,
    `pass` VARCHAR(45) NOT NULL,
    `access_token` VARCHAR(45) NULL,
    `roles_id` INT NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE,
    UNIQUE INDEX `access_token_UNIQUE` (`access_token` ASC) VISIBLE,
    INDEX `fk_users_roles_idx` (`roles_id` ASC) VISIBLE,
    CONSTRAINT `fk_users_roles`
    FOREIGN KEY (`roles_id`)
    REFERENCES `Laboratorio`.`roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Laboratorio`.`examenes` (
                                                        `id` INT NOT NULL AUTO_INCREMENT,
                                                        `nombre` VARCHAR(45) NOT NULL,
    `descripcion` TEXT(240) NULL,
    `resultado` TEXT(1000) NULL,
    `estado` TINYINT NULL DEFAULT 0,
    `clientes_id` INT NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `fk_examenes_clientes1_idx` (`clientes_id` ASC) VISIBLE,
    CONSTRAINT `fk_examenes_clientes1`
    FOREIGN KEY (`clientes_id`)
    REFERENCES `Laboratorio`.`clientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
