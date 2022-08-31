-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema GoCheetaDB
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `GoCheetaDB` ;

-- -----------------------------------------------------
-- Schema GoCheetaDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `GoCheetaDB` DEFAULT CHARACTER SET utf8 ;
USE `GoCheetaDB` ;

-- -----------------------------------------------------
-- Table `GoCheetaDB`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GoCheetaDB`.`users` ;

CREATE TABLE IF NOT EXISTS `GoCheetaDB`.`users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(16) NOT NULL,
  `user_email` VARCHAR(255) NOT NULL,
  `user_tp_number` VARCHAR(15) NOT NULL,
  `userProfilePic` VARCHAR(255) NULL,
  `user_password` VARCHAR(255) NOT NULL,
  `user_create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_account_status` INT(1) NOT NULL,
  `user_account_verification` INT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `userID_UNIQUE` (`user_id` ASC) );


-- -----------------------------------------------------
-- Table `GoCheetaDB`.`users_otp_details`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GoCheetaDB`.`users_otp_details` ;

CREATE TABLE IF NOT EXISTS `GoCheetaDB`.`users_otp_details` (
  `user_otp_detail_id` INT NOT NULL AUTO_INCREMENT,
  `user_otp` VARCHAR(4) NOT NULL,
  `user_otp_create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_otp_status` INT(1) NOT NULL,
  `user_user_id` INT NOT NULL,
  PRIMARY KEY (`user_otp_detail_id`, `user_user_id`),
  INDEX `fk_otp_details_user1_idx` (`user_user_id` ASC) ,
  CONSTRAINT `fk_otp_details_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `GoCheetaDB`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `GoCheetaDB`.`branches`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GoCheetaDB`.`branches` ;

CREATE TABLE IF NOT EXISTS `GoCheetaDB`.`branches` (
  `branch_id` INT(5) NOT NULL AUTO_INCREMENT,
  `branch_name` VARCHAR(45) NOT NULL,
  `branch_loaction` VARCHAR(45) NOT NULL,
  `brancheCordinate` VARCHAR(75) NOT NULL,
  `branche_status` INT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`branch_id`),
  UNIQUE INDEX `branch_id_UNIQUE` (`branch_id` ASC) );


-- -----------------------------------------------------
-- Table `GoCheetaDB`.`vehicle_types`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GoCheetaDB`.`vehicle_types` ;

CREATE TABLE IF NOT EXISTS `GoCheetaDB`.`vehicle_types` (
  `vehicle_types_id` INT(3) NOT NULL AUTO_INCREMENT,
  `vehicle_type` VARCHAR(45) NOT NULL,
  `vehicle_type_price` DOUBLE(5,2) NOT NULL,
  `vehicle_type_status` INT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`vehicle_types_id`),
  UNIQUE INDEX `vehicle_types_id_UNIQUE` (`vehicle_types_id` ASC) );


-- -----------------------------------------------------
-- Table `GoCheetaDB`.`drivers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GoCheetaDB`.`drivers` ;

CREATE TABLE IF NOT EXISTS `GoCheetaDB`.`drivers` (
  `driver_id` INT NOT NULL AUTO_INCREMENT,
  `driver_user_name` VARCHAR(16) NOT NULL,
  `driver_email` VARCHAR(255) NOT NULL,
  `driver_tp_number` VARCHAR(15) NOT NULL,
  `driverProfilePic` VARCHAR(255) NULL,
  `driver_password` VARCHAR(255) NOT NULL,
  `driver_create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `driver_account_status` INT(1) NOT NULL,
  `driver_account_verification` INT(1) NOT NULL DEFAULT 0,
  `driver_status` ENUM('ONLINE', 'OFFLINE', 'IDLE', 'BUSY') NOT NULL,
  `driver_license_number` VARCHAR(15) NOT NULL,
  `branches_branch_id` INT(5) NOT NULL,
  PRIMARY KEY (`driver_id`),
  UNIQUE INDEX `userID_UNIQUE` (`driver_id` ASC) ,
  INDEX `fk_drivers_branches1_idx` (`branches_branch_id` ASC) ,
  CONSTRAINT `fk_drivers_branches1`
    FOREIGN KEY (`branches_branch_id`)
    REFERENCES `GoCheetaDB`.`branches` (`branch_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `GoCheetaDB`.`vehicles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GoCheetaDB`.`vehicles` ;

CREATE TABLE IF NOT EXISTS `GoCheetaDB`.`vehicles` (
  `vehicle_id` INT NOT NULL AUTO_INCREMENT,
  `vehicle_number` VARCHAR(10) NOT NULL,
  `vehicle_description` VARCHAR(255) NULL,
  `vehicle_status` INT(1) NOT NULL,
  `vehicle_types_vehicle_types_id` INT(3) NOT NULL,
  `drivers_driver_id` INT NOT NULL,
  PRIMARY KEY (`vehicle_id`),
  UNIQUE INDEX `vehicle_number_UNIQUE` (`vehicle_number` ASC) ,
  INDEX `fk_vehicles_vehicle_types1_idx` (`vehicle_types_vehicle_types_id` ASC) ,
  INDEX `fk_vehicles_drivers1_idx` (`drivers_driver_id` ASC) ,
  CONSTRAINT `fk_vehicles_vehicle_types1`
    FOREIGN KEY (`vehicle_types_vehicle_types_id`)
    REFERENCES `GoCheetaDB`.`vehicle_types` (`vehicle_types_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vehicles_drivers1`
    FOREIGN KEY (`drivers_driver_id`)
    REFERENCES `GoCheetaDB`.`drivers` (`driver_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `GoCheetaDB`.`users_logs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GoCheetaDB`.`users_logs` ;

CREATE TABLE IF NOT EXISTS `GoCheetaDB`.`users_logs` (
  `user_log_id` INT UNIQUE NOT NULL AUTO_INCREMENT,
  `user_log_type` VARCHAR(45) NOT NULL,
  `user_log_description` VARCHAR(255) NULL,
  `user_log_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_user_id` INT NOT NULL,
  PRIMARY KEY (`user_log_id`, `user_user_id`),
  INDEX `fk_user_log_user1_idx` (`user_user_id` ASC) ,
  CONSTRAINT `fk_user_log_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `GoCheetaDB`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `GoCheetaDB`.`drivers_logs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GoCheetaDB`.`drivers_logs` ;

CREATE TABLE IF NOT EXISTS `GoCheetaDB`.`drivers_logs` (
  `driver_log_id` INT UNIQUE NOT NULL AUTO_INCREMENT,
  `driver_log_type` VARCHAR(45) NOT NULL,
  `driver_log_description` VARCHAR(255) NULL,
  `driver_log_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `drivers_driver_id` INT NOT NULL,
  PRIMARY KEY (`driver_log_id`, `drivers_driver_id`),
  INDEX `fk_driver_log_drivers1_idx` (`drivers_driver_id` ASC) ,
  CONSTRAINT `fk_driver_log_drivers1`
    FOREIGN KEY (`drivers_driver_id`)
    REFERENCES `GoCheetaDB`.`drivers` (`driver_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `GoCheetaDB`.`drivers_otp_details`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GoCheetaDB`.`drivers_otp_details` ;

CREATE TABLE IF NOT EXISTS `GoCheetaDB`.`drivers_otp_details` (
  `driver_otp_detail_id` INT NOT NULL AUTO_INCREMENT,
  `driver_otp` VARCHAR(4) NOT NULL,
  `driver_otp_create_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `driver_otp_status` INT(1) NOT NULL,
  `drivers_driver_id` INT NOT NULL,
  PRIMARY KEY (`driver_otp_detail_id`, `drivers_driver_id`),
  INDEX `fk_driver_otp_details_drivers1_idx` (`drivers_driver_id` ASC) ,
  CONSTRAINT `fk_driver_otp_details_drivers1`
    FOREIGN KEY (`drivers_driver_id`)
    REFERENCES `GoCheetaDB`.`drivers` (`driver_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `GoCheetaDB`.`user_roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GoCheetaDB`.`user_roles` ;

CREATE TABLE IF NOT EXISTS `GoCheetaDB`.`user_roles` (
  `user_role_id` INT UNIQUE NOT NULL AUTO_INCREMENT,
  `user_role` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`user_role_id`),
  UNIQUE INDEX `user_role_id_UNIQUE` (`user_role_id` ASC) );


-- -----------------------------------------------------
-- Table `GoCheetaDB`.`admin_users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GoCheetaDB`.`admin_users` ;

CREATE TABLE IF NOT EXISTS `GoCheetaDB`.`admin_users` (
  `admin_user_id` INT NOT NULL AUTO_INCREMENT,
  `admin_user_name` VARCHAR(16) NOT NULL,
  `admin_user_email` VARCHAR(255) NOT NULL,
  `admin_user_tp_number` VARCHAR(15) NOT NULL,
  `admin_user_password` VARCHAR(255) NOT NULL,
  `admin_user_create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `admin_user_account_status` INT(1) NOT NULL DEFAULT 1,
  `branches_branch_id` INT(5) NOT NULL,
  `user_roles_user_role_id` INT NOT NULL,
  PRIMARY KEY (`admin_user_id`),
  INDEX `fk_admin_users_branches1_idx` (`branches_branch_id` ASC) ,
  INDEX `fk_admin_users_user_roles1_idx` (`user_roles_user_role_id` ASC) ,
  UNIQUE INDEX `admin_user_id_UNIQUE` (`admin_user_id` ASC) ,
  CONSTRAINT `fk_admin_users_branches1`
    FOREIGN KEY (`branches_branch_id`)
    REFERENCES `GoCheetaDB`.`branches` (`branch_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_admin_users_user_roles1`
    FOREIGN KEY (`user_roles_user_role_id`)
    REFERENCES `GoCheetaDB`.`user_roles` (`user_role_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `GoCheetaDB`.`admin_users_logs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GoCheetaDB`.`admin_users_logs` ;

CREATE TABLE IF NOT EXISTS `GoCheetaDB`.`admin_users_logs` (
  `admin_user_log_id` INT UNIQUE NOT NULL AUTO_INCREMENT,
  `admin_user_log_type` VARCHAR(45) NOT NULL,
  `admin_user_log_description` VARCHAR(255) NULL,
  `admin_user_log_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `admin_users_admin_user_id` INT NOT NULL,
  PRIMARY KEY (`admin_user_log_id`, `admin_users_admin_user_id`),
  INDEX `fk_admin_users_logs_admin_users1_idx` (`admin_users_admin_user_id` ASC) ,
  CONSTRAINT `fk_admin_users_logs_admin_users1`
    FOREIGN KEY (`admin_users_admin_user_id`)
    REFERENCES `GoCheetaDB`.`admin_users` (`admin_user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `GoCheetaDB`.`bookings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GoCheetaDB`.`bookings` ;

CREATE TABLE IF NOT EXISTS `GoCheetaDB`.`bookings` (
  `booking_id` INT UNIQUE NOT NULL AUTO_INCREMENT,
  `booking_name` VARCHAR(100) NOT NULL,
  `booking_create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `booking_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `booking_start_location` VARCHAR(100) NOT NULL,
  `booking_start_location_cordinate` VARCHAR(45) NOT NULL,
  `booking_end_location` VARCHAR(100) NOT NULL,
  `booking_endt_location_cordinate` VARCHAR(45) NOT NULL,
  `bookin_charge` DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  `booking_driver_get_user` INT(1) NOT NULL DEFAULT 0,
  `booking_driver_get_user_time` DATETIME NULL,
  `booking_driver_drop_user` INT(1) NOT NULL DEFAULT 0,
  `booking_driver_drop_user_time` DATETIME NULL,
  `booking_user_status` ENUM('ON TIME', 'LATE', 'CANCEL') NOT NULL DEFAULT 'ON TIME',
  `booking_driver_status` ENUM('ON TIME', 'LATE', 'CANCEL') NOT NULL DEFAULT 'ON TIME',
  `booking_status` ENUM('DRIVER CANCEL', 'USER CANCEL', 'COMPLETE', 'ONGOING', 'PENDING') NOT NULL,
  `booking_cancel_reason` VARCHAR(255) NULL,
  `users_user_id` INT NOT NULL,
  `drivers_driver_id` INT NOT NULL,
  `vehicles_vehicle_id` INT NOT NULL,
  PRIMARY KEY (`booking_id`),
  INDEX `fk_bookings_users1_idx` (`users_user_id` ASC) ,
  INDEX `fk_bookings_drivers1_idx` (`drivers_driver_id` ASC) ,
  INDEX `fk_bookings_vehicles1_idx` (`vehicles_vehicle_id` ASC) ,
  CONSTRAINT `fk_bookings_users1`
    FOREIGN KEY (`users_user_id`)
    REFERENCES `GoCheetaDB`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bookings_drivers1`
    FOREIGN KEY (`drivers_driver_id`)
    REFERENCES `GoCheetaDB`.`drivers` (`driver_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bookings_vehicles1`
    FOREIGN KEY (`vehicles_vehicle_id`)
    REFERENCES `GoCheetaDB`.`vehicles` (`vehicle_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `GoCheetaDB`.`booking_feedbacks`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GoCheetaDB`.`booking_feedbacks` ;

CREATE TABLE IF NOT EXISTS `GoCheetaDB`.`booking_feedbacks` (
  `booking_feedback_id` INT UNIQUE NOT NULL AUTO_INCREMENT,
  `booking_feedback` VARCHAR(255) NOT NULL,
  `booking_feedback_rate` INT(2) NOT NULL,
  `bookings_booking_id` INT UNIQUE NOT NULL,
  PRIMARY KEY (`booking_feedback_id`, `bookings_booking_id`),
  INDEX `fk_booking_feedbacks_bookings1_idx` (`bookings_booking_id` ASC) ,
  CONSTRAINT `fk_booking_feedbacks_bookings1`
    FOREIGN KEY (`bookings_booking_id`)
    REFERENCES `GoCheetaDB`.`bookings` (`booking_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `GoCheetaDB`.`payments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GoCheetaDB`.`payments` ;

CREATE TABLE IF NOT EXISTS `GoCheetaDB`.`payments` (
  `payment_id` INT UNIQUE NOT NULL AUTO_INCREMENT,
  `discount_amount` DOUBLE(5,2) NULL DEFAULT 0.00,
  `discount_reason` VARCHAR(75) NULL DEFAULT NULL,
  `payed_ammount` DOUBLE(5,2) NOT NULL,
  `payment_balance` DOUBLE(5,2) NOT NULL,
  `bookings_booking_id` INT UNIQUE NOT NULL,
  PRIMARY KEY (`payment_id`, `bookings_booking_id`),
  INDEX `fk_payments_bookings1_idx` (`bookings_booking_id` ASC) ,
  CONSTRAINT `fk_payments_bookings1`
    FOREIGN KEY (`bookings_booking_id`)
    REFERENCES `GoCheetaDB`.`bookings` (`booking_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
