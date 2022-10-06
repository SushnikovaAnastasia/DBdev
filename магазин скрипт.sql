-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`магазин`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`магазин` (
  `id_адреса магазинов` INT NOT NULL,
  `потери` VARCHAR(45) NULL,
  `Продажи за день` VARCHAR(45) NULL,
  `продажи за месяц` VARCHAR(45) NULL,
  `доставка` VARCHAR(45) NULL,
  PRIMARY KEY (`id_адреса магазинов`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Сотрудники`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Сотрудники` (
  `id_сотрудника` INT NOT NULL,
  `Имя` VARCHAR(45) NULL,
  `Фамилия` VARCHAR(45) NULL,
  `Отчество` VARCHAR(45) NULL,
  `Адрес работы` VARCHAR(45) NULL,
  `телефон` VARCHAR(45) NULL,
  `скидка сотруднику` VARCHAR(45) NULL,
  `магазин_id_адреса магазинов` INT NOT NULL,
  PRIMARY KEY (`id_сотрудника`),
  INDEX `fk_Сотрудники_магазин_idx` (`магазин_id_адреса магазинов` ASC) VISIBLE,
  CONSTRAINT `fk_Сотрудники_магазин`
    FOREIGN KEY (`магазин_id_адреса магазинов`)
    REFERENCES `mydb`.`магазин` (`id_адреса магазинов`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Каталог`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Каталог` (
  `id_товара` INT NOT NULL,
  `обои флезелинновые` VARCHAR(45) NULL,
  `обои виниловые` VARCHAR(45) NULL,
  `клей для фл.обоев` VARCHAR(45) NULL,
  `клей для вин.оюоев` VARCHAR(45) NULL,
  `адрес магазина` VARCHAR(45) NULL,
  `магазин_id_адреса магазинов` INT NOT NULL,
  PRIMARY KEY (`id_товара`),
  INDEX `fk_Каталог_магазин1_idx` (`магазин_id_адреса магазинов` ASC) VISIBLE,
  CONSTRAINT `fk_Каталог_магазин1`
    FOREIGN KEY (`магазин_id_адреса магазинов`)
    REFERENCES `mydb`.`магазин` (`id_адреса магазинов`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Поставщики`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Поставщики` (
  `id_Поставщика` INT NOT NULL,
  `Имя` VARCHAR(45) NULL,
  `Фамилия` VARCHAR(45) NULL,
  `Отчекство` VARCHAR(45) NULL,
  `номер телефона` VARCHAR(45) NULL,
  `адреса магазинов` VARCHAR(45) NULL,
  `магазин_id_адреса магазинов` INT NOT NULL,
  PRIMARY KEY (`id_Поставщика`),
  INDEX `fk_Поставщики_магазин1_idx` (`магазин_id_адреса магазинов` ASC) VISIBLE,
  CONSTRAINT `fk_Поставщики_магазин1`
    FOREIGN KEY (`магазин_id_адреса магазинов`)
    REFERENCES `mydb`.`магазин` (`id_адреса магазинов`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`акции`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`акции` (
  `id_акции` INT NOT NULL,
  `на обои` VARCHAR(45) NULL,
  `на клей` VARCHAR(45) NULL,
  `сотрудникам` VARCHAR(45) NULL,
  `Сотрудники_id_сотрудника` INT NOT NULL,
  `Каталог_id_товара` INT NOT NULL,
  PRIMARY KEY (`id_акции`),
  INDEX `fk_акции_Сотрудники1_idx` (`Сотрудники_id_сотрудника` ASC) VISIBLE,
  INDEX `fk_акции_Каталог1_idx` (`Каталог_id_товара` ASC) VISIBLE,
  CONSTRAINT `fk_акции_Сотрудники1`
    FOREIGN KEY (`Сотрудники_id_сотрудника`)
    REFERENCES `mydb`.`Сотрудники` (`id_сотрудника`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_акции_Каталог1`
    FOREIGN KEY (`Каталог_id_товара`)
    REFERENCES `mydb`.`Каталог` (`id_товара`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
