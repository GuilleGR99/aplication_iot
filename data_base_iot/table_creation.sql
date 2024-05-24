/* NEW SCHEMA*/
CREATE SCHEMA `iot` ;

/*GATEWAY*/
CREATE TABLE `iot`.`gateway` (
  `pk_gateway_id` VARCHAR(45) NOT NULL,
  `fk_antenna_id` VARCHAR(45) NOT NULL,
  `fk_site_id` VARCHAR(45) NOT NULL,
  `building` VARCHAR(45) NULL,
  `area` VARCHAR(45) NULL,
  `service_name` VARCHAR(45) NULL,
  PRIMARY KEY (`pk_gateway_id`),
  UNIQUE INDEX `idgateway_UNIQUE` (`pk_gateway_id` ASC) VISIBLE,
  INDEX `fk_gateway_1_idx` (`fk_antenna_id` ASC) VISIBLE,
  INDEX `fk_gateway_2_idx` (`fk_site_id` ASC) VISIBLE,
  CONSTRAINT `fk_gateway_1`
    FOREIGN KEY (`fk_antenna_id`)
    REFERENCES `iot`.`antenna` (`pk_antenna_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_gateway_2`
    FOREIGN KEY (`fk_site_id`)
    REFERENCES `iot`.`hospital` (`pk_hospital_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_gateway_3`
    FOREIGN KEY (`fk_site_id`)
    REFERENCES `iot`.`facility` (`pk_facility_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

/*ANTENNA*/
CREATE TABLE `iot`.`antenna` (
  `pk_antenna_id` VARCHAR(45) NOT NULL,
  `fk_site_id` VARCHAR(45) NULL,
  `building` VARCHAR(255) NULL,
  `area` VARCHAR(45) NULL,
  `service_name` VARCHAR(45) NULL,
  PRIMARY KEY (`pk_antenna_id`),
  UNIQUE INDEX `pk_antenna_id_UNIQUE` (`pk_antenna_id` ASC) VISIBLE);

ALTER TABLE `iot`.`antenna` 
ADD INDEX `fk_site_id_idx` (`fk_site_id` ASC) VISIBLE;
;
ALTER TABLE `iot`.`antenna` 
ADD CONSTRAINT `fk_site_id`
  FOREIGN KEY (`fk_site_id`)
  REFERENCES `iot`.`hospital` (`pk_hospital_id`)
  REFERENCES `iot`.`facility` (`pk_facility_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


/*HOSPITAL*/
CREATE TABLE `iot`.`hospital` (
  `pk_hospital_id` VARCHAR(45) NOT NULL,
  `fk_cylinder_provider` VARCHAR(45) NULL,
  `name` VARCHAR(255) NULL,
  `delegation` VARCHAR(45) NULL,
  `country_code` INT NULL,
  `state_code` INT NULL,
  `province_code` INT NULL,
  `address` VARCHAR(255) NULL,
  `coordinate` POINT NULL,
  `contact_name` VARCHAR(255) NULL,
  `contact_email` VARCHAR(255) NULL,
  `number_bed` INT NULL,
  `number_or` INT NULL,
  `number_op` INT NULL,
  PRIMARY KEY (`pk_hospital_id`),
  UNIQUE INDEX `pk_hospital_id_UNIQUE` (`pk_hospital_id` ASC) VISIBLE);

ALTER TABLE `iot`.`hospital` 
ADD INDEX `fk_cylinder_provider_idx` (`fk_cylinder_provider` ASC) VISIBLE;
;
ALTER TABLE `iot`.`hospital` 
ADD CONSTRAINT `fk_cylinder_provider`
  FOREIGN KEY (`fk_cylinder_provider`)
  REFERENCES `iot`.`facility` (`pk_facility_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


/*FACILITY*/
CREATE TABLE `iot`.`facility` (
  `pk_facility_id` INT NOT NULL,
  `fk_cylinder_provider` INT NULL,
  `name` VARCHAR(255) NULL,
  `type` VARCHAR(45) NULL,
  `delegation` VARCHAR(45) NULL,
  `country_code` INT NULL,
  `state_code` INT NULL,
  `province_code` INT NULL,
  `address` VARCHAR(255) NULL,
  `coordinate` POINT NULL,
  `contact_name` VARCHAR(255) NULL,
  `contact_email` VARCHAR(255) NULL,
  PRIMARY KEY (`pk_facility_id`));

ALTER TABLE `iot`.`facility` 
ADD INDEX `fk_cylinder_provider_idx` (`fk_cylinder_provider` ASC) VISIBLE;
;
ALTER TABLE `iot`.`facility` 
ADD CONSTRAINT `fk_cylinder_provider`
  FOREIGN KEY (`fk_cylinder_provider`)
  REFERENCES `iot`.`facility` (`pk_facility_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


/*GAS CYLINDER*/
CREATE TABLE `iot`.`gas_cylinder` (
  'pk_row_number' INT NOT NULL AUTO_INCREMENT,
  `fk_antenna_id` VARCHAR(45) NOT NULL,
  `device_id` VARCHAR(45) NOT NULL,
  `pressure` FLOAT NULL,
  `timestamp` TIMESTAMP NOT NULL,
  PRIMARY KEY (`pk_row_number`),
  UNIQUE INDEX `pk_row_number_UNIQUE` (`pk_row_number` ASC) VISIBLE)
  INDEX `device_id_idx` (`device_id` ASC) VISIBLE;

/*FK_ANTENA_ID TO GAS CYLINDER*/
ALTER TABLE `iot`.`gas_cylinder` 
ADD INDEX `fk_anntena_id_1_idx` (`fk_antenna_id` ASC) VISIBLE;
;
ALTER TABLE `iot`.`gas_cylinder` 
ADD CONSTRAINT `fk_anntena_id_1`
  FOREIGN KEY (`fk_antenna_id`)
  REFERENCES `iot`.`antenna` (`pk_antenna_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


/*FLOWMETER*/
CREATE TABLE `iot`.`flowmeter` (
  'pk_row_number' INT NOT NULL AUTO_INCREMENT,
  `fk_antenna_id` VARCHAR(45) NOT NULL,
  `fk_pipe_parent` VARCHAR(45) NULL,
  `device_id` VARCHAR(45) NOT NULL,
  `pipe_size` FLOAT NULL,
  `saturation_flow` FLOAT NULL,
  `pressure` FLOAT NULL,
  `product` VARCHAR(45) NULL,
  `timestamp` TIMESTAMP NOT NULL,
  PRIMARY KEY (`pk_row_number`),
  UNIQUE INDEX `pk_row_number_UNIQUE` (`pk_row_number` ASC) VISIBLE,
  INDEX `fk_antenna_id_idx` (`fk_antenna_id` ASC) VISIBLE,
  INDEX `device_id_idx` (`device_id` ASC) VISIBLE,
  CONSTRAINT `fk_antenna_id_2`
    FOREIGN KEY (`fk_antenna_id`)
    REFERENCES `iot`.`antenna_id` (`pk_antenna_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
/*FK_ANTENNA_ID TO FLOWMETER*/
ALTER TABLE `iot`.`flowmeter` 
ADD INDEX `fk_anntena_id_2_idx` (`fk_antenna_id` ASC) VISIBLE;
;
ALTER TABLE `iot`.`flowmeter` 
ADD CONSTRAINT `fk_anntena_id_2`
  FOREIGN KEY (`fk_antenna_id`)
  REFERENCES `iot`.`antenna` (`pk_antenna_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

/*FRIDGE TEMPERATURE*/
CREATE TABLE `iot`.`weather_conditions` (
  'pk_row_number' INT NOT NULL AUTO_INCREMENT,
  `fk_antenna_id` VARCHAR(45) NOT NULL,
  `device_id` VARCHAR(45) NOT NULL,
  `temperature` FLOAT NULL,
  `timestamp` TIMESTAMP NOT NULL,
  PRIMARY KEY (`pk_row_number`),
  UNIQUE INDEX `pk_row_number_UNIQUE` (`pk_row_number` ASC) VISIBLE)
  INDEX `device_id_idx` (`device_id` ASC) VISIBLE;

/*FK_ANTENNA_ID TO FRIDGE TEMPERATURE*/
ALTER TABLE `iot`.`fridge_temperature` 
ADD INDEX `fk_antenna_id_4_idx` (`fk_antenna_id` ASC) VISIBLE;
;
ALTER TABLE `iot`.`fridge_temperature` 
ADD CONSTRAINT `fk_antenna_id_4`
  FOREIGN KEY (`fk_antenna_id`)
  REFERENCES `iot`.`antenna` (`pk_antenna_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

/*WEATHER CONDITIONS*/
CREATE TABLE `iot`.`weather_conditions` (
  'pk_row_number' INT NOT NULL AUTO_INCREMENT,
  `fk_antenna_id` VARCHAR(45) NOT NULL,
  `device_id` VARCHAR(45) NOT NULL,
  `co2` FLOAT NULL,
  `humidity` FLOAT NULL,
  `temperature` FLOAT NULL,
  `timestamp` TIMESTAMP NOT NULL,
  PRIMARY KEY (`pk_row_number`),
  UNIQUE INDEX `pk_row_number_UNIQUE` (`pk_row_number` ASC) VISIBLE)
  INDEX `device_id_idx` (`device_id` ASC) VISIBLE;

/*FK_ANTENNA_ID TO WEATHER CONDITIONS*/
ALTER TABLE `iot`.`weather_conditions` 
ADD INDEX `pk_antenna_id_3_idx` (`fk_antenna_id` ASC) VISIBLE;
;
ALTER TABLE `iot`.`weather_conditions` 
ADD CONSTRAINT `pk_antenna_id_3`
  FOREIGN KEY (`fk_antenna_id`)
  REFERENCES `iot`.`antenna` (`pk_antenna_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


