/*SHOW ANTENNAS FROM ALL FACILITIES*/
SELECT * 
FROM antenna
WHERE fk_site_id IN (
    SELECT DISTINCT pk_facility_id 
    FROM facility);

/*INFO SITE WITH HIGHEST NUMBER OF ANTENNAS*/
SELECT * 
FROM(
	SELECT 
		fk_site_id, 
        MAX(count_antenna) AS ant_amount
    FROM (
		SELECT 
			fk_site_id, 
            COUNT(pk_antenna_id) AS count_antenna 
		FROM antenna 
		GROUP BY fk_site_id
	) AS sub_1
) AS sub_2
INNER JOIN facility ON sub_2.fk_site_id=facility.pk_facility_id
INNER JOIN hospital ON sub_2.fk_site_id=hospital.pk_hospital_id;

/*INFO SITE WITH HIGHEST NUMBER OF MESSAGES*/
SELECT antenna.pk_antenna_id, sub_2.num_messages, hospital.name
FROM(
	SELECT fk_antenna_id, COUNT(fk_antenna_id) AS num_messages
	FROM(
		SELECT gas_cylinder.fk_antenna_id FROM gas_cylinder
		UNION ALL
		SELECT flowmeter.fk_antenna_id FROM flowmeter
		UNION ALL
		SELECT fridge_temperature.fk_antenna_id FROM fridge_temperature
		UNION ALL
		SELECT weather_conditions.fk_antenna_id FROM weather_conditions
        ) 
    AS sub_1 
	GROUP BY fk_antenna_id
) 
AS sub_2
INNER JOIN antenna ON sub_2.fk_antenna_id=antenna.pk_antenna_id
INNER JOIN hospital ON antenna.fk_site_id=hospital.pk_hospital_id
ORDER BY sub_2.num_messages ASC;