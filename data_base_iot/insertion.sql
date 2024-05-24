/*GATEWAY*/
INSERT INTO gateway (fk_antenna_id, fk_site_id, pk_gateway_id, building, area, service_name)
VALUES
('be6e7cdd73', '28-clima', 'eb256c49f9', '1', 'a', 'anestesiología'),
('cb7fe8ef80', '28-johoho', 'f98e05b0f2', '1', 'a', 'cirugía pediátrica'),
('2e36a672ef', '28-singeho', '7c26eeb865', 1, 'a', 'oftalmología'),
('74308487b6', '28-clima', 'f08ec4f8d6', '2', 'b', 'urología'),
('c8c54c4f0a', '28-johoho','17a967b9ce', 1, 'b', 'cirugía plástica'),
('9ef1e55e06', '28-singeho', '634dc832f1', '1', 'a', 'inmunología'),
('7422aa462f', '28-madf', '740b1f1c79', '1', 'a', 'almacen'),
('a3df5039ca', '15-acorf', '4d1aed4af1', '1', 'a', 'almacen'),
('ee748ac21a', '36-ponf', '1259a077aa', '1', 'a', 'almacen'),
('539cf20232','28-madf', '6d0a39a806', '1', 'a', 'llenado');


/*ANTENNA*/
INSERT INTO antenna (fk_gateway_id, pk_antenna_id, fk_site_id, building, area, service_name)
VALUES
('eb256c49f9', 'be6e7cdd73', '28-clima', '1', 'a', 'anestesiología'),
('f98e05b0f2', 'cb7fe8ef80', '28-johoho', '1', 'a', 'cirugía pediátrica'),
('7c26eeb865', '2e36a672ef', '28-singeho', 1, 'a', 'oftalmología'),
('f08ec4f8d6', '74308487b6', '28-clima','2', 'b', 'urología'),
('17a967b9ce', 'c8c54c4f0a', '28-johoho',1, 'b', 'cirugía plástica'),
('634dc832f1', '9ef1e55e06', '28-singeho', '1', 'a', 'inmunología'),
('740b1f1c79', '7422aa462f', '28-madf', '1', 'a', 'almacen'),
('4d1aed4af1', 'a3df5039ca', '15-acorf', '1', 'a', 'almacen'),
('1259a077aa', 'ee748ac21a', '36-ponf', '1', 'a', 'almacen'),
('6d0a39a806', '539cf20232','28-madf', '1', 'a', 'llenado');


/*HOSPITAL*/
INSERT INTO hospital (pk_hospital_id, name, delegation,
	country_code, state_code, province_code, address, coordinate, 
    contact_name, contact_email, number_bed, number_or, number_op, pk_facility_provider)
VALUES
('28-clima', 'clínica mayo', 'centre', 724, 13, 28, 'barrio mezquita de la fama', 
	POINT(-20.5633, 57.9753), 'clotilde nieto', 'clotildenieto@gmail.com', 500, 20, 1, '28-madf'),
('28-johoho', 'john hopkins hospital', 'centre', 724, 13, 28, 'alameda guitarra del duque', 
	POINT(-83.8076, -158.2516), 'paola caparros', 'paolacaparros@gmail.com', 500, 20, 0, '28-madf'),
('28-singeho', 'singapore general hospital', 'north', 724, 12, 36, 'avenida del micólogo gadiel 34',
	POINT(39.0349, -126.0116), 'joseba de los santos', 'josebadelossantos@gmail.com', 250, 15, 0, '36-ponf');


/*FACILTY*/
INSERT INTO facility (pk_facility_id, fk_cylinder_provider, 
	name, type, delegation, country_code, state_code, province_code, address, 
    coordinate, contact_name, contact_email)
VALUES
('28-madf', null, 'madrid facility', 'fill', 'centre', 724, 13, 28, 
	'calle alfareros del noroeste 66', POINT(65.6532, 11.9553), 
    'manuel roldan' ,'manuelroldan@gmail.com'),
('15-acorf', null, 'acoruna facility', 'fill', 'north', 724, 12, 15, 
	'parque semidiosa de la magia 251',POINT(-62.6502, -110.5025), 
	'maria isabel oliveira', 'mariaisabeloliveira@gmail.com'),
('36-ponf', '15-acorf', 'pontevedra facility', 'distribution', 'north', 724, 12, 36,
	'calle de trujal y yerros', POINT(41.9301, 173.8594), 
	'rosa maria lopez', 'rosamarialopez@gmail.com');  

/*GAS CYLINDER*/
INSERT INTO gas_cylinder (device_id, fk_antenna_id, pressure, timestamp)
VALUES
('df0e36dd87', 'cb7fe8ef80', 200, '2024-05-01 12:20:00'),
('df0e36dd87', 'cb7fe8ef80', 150, '2024-05-01 12:25:00'),
('96bf0be1cd', '2e36a672ef', 100, '2024-05-01 12:30:00'),
('96bf0be1cd', '74308487b6', 110, '2024-05-01 12:27:00'),
('96bf0be1cd', 'a3df5039ca', 125, '2024-05-01 12:25:00'),
('96bf0be1cd', 'cb7fe8ef80', 150, '2024-05-01 12:22:00'),
('8e59fecb12', '7422aa462f', 100, '2024-05-01 12:12:00'),
('883f453e2c', 'a3df5039ca', 100, '2024-05-01 12:13:00'),
('96bf0be1cd', 'ee748ac21a', 200, '2024-05-01 12:14:00'),
('df0e36dd87', 'ee748ac21a', 200, '2024-05-01 12:17:00'),
('96bf0be1cd', '74308487b6', 120, '2024-05-01 12:19:00'),
('96bf0be1cd', 'a3df5039ca', 120, '2024-05-01 12:13:00'),
('96bf0be1cd', 'cb7fe8ef80', 120, '2024-05-01 12:14:00'),
('8e59fecb12', '7422aa462f', 75, '2024-05-01 12:17:00'),
('883f453e2c', 'a3df5039ca', 50, '2024-05-01 12:19:00');

/*FLOWMETER*/
INSERT INTO flowmeter (device_id, fk_antenna_id, fk_pipe_parent,
	pipe_size, saturation_flow, pressure, product, timestamp)
VALUES
('1128efc69a', 'cb7fe8ef80', null, 20, 30, 5, 'air', '2024-05-01 12:00:00'),
('49f951434a', 'cb7fe8ef80', '1128efc69a', 15, 30, 5, 'air', '2024-05-01 12:10:00'),
('b0baeb5904', '2e36a672ef', null, 15, 5, 5, 'oxigen', '2024-05-01 12:10:00'),
('4830eff571', '74308487b6', null, 20, 20, 5, 'air', '2024-05-01 12:15:00'),
('1aa05487d1', 'a3df5039ca', null, 15, 15, 5, 'oxigen', '2024-05-01 12:10:00'),
('4830eff571', 'cb7fe8ef80', '1128efc69a', 20, 25, 5, 'air', '2024-05-01 12:12:00'),
('1aa05487d1', '7422aa462f', null, 15, 20, 5, 'oxigen', '2024-05-01 12:04:00'),
('4830eff571', 'a3df5039ca', '1aa05487d1', 20, 10, 5, 'oxigen', '2024-05-01 12:07:00'),
('b0baeb5904', 'ee748ac21a', null, 15, 10, 5, 'oxigen', '2024-05-01 12:09:00'),
('4830eff571', 'ee748ac21a', null, 20, 25, 5, 'air', '2024-05-01 12:10:00');

/*FRIDGE TEMPERATURE*/
INSERT INTO fridge_temperature (device_id, fk_antenna_id, temperature, timestamp)
VALUES
('e0f67ae5f6', 'cb7fe8ef80', 4, '2024-05-01 12:00:00'),
('4aa550fd86', 'cb7fe8ef80', 4, '2024-05-01 12:10:00'),
('000b7cb59f', '2e36a672ef', 5, '2024-05-01 12:10:00'),
('2d704601bd', '74308487b6', 5, '2024-05-01 12:15:00'),
('e0f67ae5f6', 'a3df5039ca', 5, '2024-05-01 12:10:00'),
('e0f67ae5f6', 'cb7fe8ef80', 10, '2024-05-01 12:12:00'),
('88fc167b29', '7422aa462f', 4, '2024-05-01 12:04:00'),
('4aa550fd86', 'a3df5039ca', 5, '2024-05-01 12:07:00'),
('000b7cb59f', 'ee748ac21a', 5, '2024-05-01 12:09:00'),
('2d704601bd', 'ee748ac21a', 5, '2024-05-01 12:10:00');

/*WEATHER CONDITIONS*/
INSERT INTO weather_conditions (device_id, fk_antenna_id, 
	co2, humidity, temperature, timestamp)
VALUES
('b5068abbb8', 'cb7fe8ef80', 500, 60, 18, '2024-05-01 12:00:00'),
('587b0e9c8e', 'cb7fe8ef80', 500, 60, 18, '2024-05-01 12:10:00'),
('9ff1f2da03', '2e36a672ef', 500, 60, 19, '2024-05-01 12:10:00'),
('fa23900e09', '74308487b6', 500, 60, 19, '2024-05-01 12:15:00'),
('e74de6874a', 'a3df5039ca', 500, 60, 20, '2024-05-01 12:10:00'),
('b5068abbb8', 'cb7fe8ef80', 490, 50, 19, '2024-05-01 12:12:00'),
('587b0e9c8e', '7422aa462f', 490, 50, 18, '2024-05-01 12:04:00'),
('9ff1f2da03', 'a3df5039ca', 490, 50, 20, '2024-05-01 12:07:00'),
('fa23900e09', 'ee748ac21a', 490, 50, 21, '2024-05-01 12:09:00'),
('e74de6874a', 'ee748ac21a', 490, 60, 20, '2024-05-01 12:11:00');