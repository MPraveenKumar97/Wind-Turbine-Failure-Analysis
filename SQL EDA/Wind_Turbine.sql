create database WT;

use WT;

create table wind_turbine (
     date text,
     Wind_speed double null,
     Power double null,
     Nacelle_ambient_temperature double null,
     Generator_bearing_temperature double null,
Gear_oil_temperature double null,
     Ambient_temperature double null,
     Rotor_Speed double null,
     Nacelle_temperature double null,
     Bearing_temperature double null,
     Generator_speed double null,
     Yaw_angle double null,
     Wind_direction double null,
     Wheel_hub_temperature double null,
     Gear_box_inlet_temperature double null,
     Failure_status text null
 );
 
show variables like 'secure_file_priv';

show variables like '%local%';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Wind_turbine.csv'
INTO TABLE wind_turbine
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(date, @Wind_speed, @Power, @Nacelle_ambient_temperature, Generator_bearing_temperature, Gear_oil_temperature,
Ambient_temperature, Rotor_Speed, @Nacelle_temperature, Bearing_temperature, @Generator_speed, @Yaw_angle,
Wind_direction, Wheel_hub_temperature, @Gear_box_inlet_temperature, Failure_status)
SET Wind_speed = nullif((@Wind_speed), ''),
Power = nullif((@Power), ''),
Nacelle_ambient_temperature = nullif((@Nacelle_ambient_temperature), ''),
Nacelle_temperature = nullif((@Nacelle_temperature), ''),
Generator_speed = nullif((@Generator_speed), ''),
Yaw_angle = nullif((@Yaw_angle), ''),
Gear_box_inlet_temperature = nullif((@Gear_box_inlet_temperature), '');

#Total rows count
select count(*) from wind_turbine;

#To check the null count in wind speed
select count(*) from wind_turbine where Wind_speed is null;

#Check the dates and wind speeds where wind speed is null
select date,Wind_speed from wind_turbine where Wind_speed is null;

select count(*) from wind_turbine;

/*------Before Preprocessing-----*/

/*First Moment Business Decision*/

/*Mean*/

------- Calculating the mean value for Wind_speed--------
SELECT AVG (Wind_speed) AS mean_value FROM wind_turbine;

------- Mean value for Power--------
SELECT AVG (Power) AS mean_value FROM wind_turbine;

------- Mean value for Nacelle_ambient_temperature--------
SELECT AVG (Nacelle_ambient_temperature) AS mean_value FROM wind_turbine;

------- Mean value for Generator_bearing_temperature--------
SELECT AVG (Generator_bearing_temperature) AS mean_value FROM wind_turbine;

------- Mean value for Gear_oil_temperature--------
SELECT AVG (Gear_oil_temperature) AS mean_value FROM wind_turbine;

------- Mean value for Ambient_temperature--------
SELECT AVG (Ambient_temperature) AS mean_value FROM wind_turbine;

------- Mean value for Rotor_Speed--------
SELECT AVG (Rotor_Speed) AS mean_value FROM wind_turbine;

------- Mean value for Nacelle_temperature--------
SELECT AVG (Nacelle_temperature) AS mean_value FROM wind_turbine;

------- Mean value for Bearing_temperature--------
SELECT AVG (Bearing_temperature) AS mean_value FROM wind_turbine;

------- Mean value for Generator_speed--------
SELECT AVG (Generator_speed) AS mean_value FROM wind_turbine;

------- Mean value for Wheel_hub_temperature--------
SELECT AVG (Wheel_hub_temperature) AS mean_value FROM wind_turbine;

------- Mean value for Gear_box_inlet_temperature--------
SELECT AVG (Gear_box_inlet_temperature) AS mean_value FROM wind_turbine;

------- Mean value for Yaw_angle--------
SELECT AVG (Yaw_angle) AS mean_value FROM wind_turbine;

------- Mean value for Wind_direction--------
SELECT AVG (Wind_55direction) AS mean_value FROM wind_turbine;

/*Median*/

# Median for Wind_speed
SELECT AVG(Wind_speed) AS median
FROM (
    SELECT Wind_speed,
            ROW_NUMBER() OVER (ORDER BY Wind_speed) AS row_num,
            COUNT(*) OVER () AS total_count
    FROM wind_turbine
) AS median_subquery
WHERE row_num BETWEEN (total_count + 1) / 2 AND total_count / 2 + 1;

# Median for Power
SELECT AVG(Power) AS median
FROM (
    SELECT Power,
            ROW_NUMBER() OVER (ORDER BY Power) AS row_num,
            COUNT(*) OVER () AS total_count
    FROM wind_turbine
) AS median_subquery
WHERE row_num BETWEEN (total_count + 1) / 2 AND total_count / 2 + 1;

# Median for Nacelle_ambient_temperature
SELECT AVG(Nacelle_ambient_temperature) AS median
FROM (
    SELECT Nacelle_ambient_temperature,
            ROW_NUMBER() OVER (ORDER BY Nacelle_ambient_temperature) AS row_num,
            COUNT(*) OVER () AS total_count
    FROM wind_turbine
) AS median_subquery
WHERE row_num BETWEEN (total_count + 1) / 2 AND total_count / 2 + 1;

# Median for Generator_bearing_temperature
SELECT AVG(Generator_bearing_temperature) AS median
FROM (
    SELECT Generator_bearing_temperature,
            ROW_NUMBER() OVER (ORDER BY Generator_bearing_temperature) AS row_num,
            COUNT(*) OVER () AS total_count
    FROM wind_turbine
) AS median_subquery
WHERE row_num BETWEEN (total_count + 1) / 2 AND total_count / 2 + 1;

# Median for Gear_oil_temperature
SELECT AVG(Gear_oil_temperature) AS median
FROM (
    SELECT Gear_oil_temperature,
            ROW_NUMBER() OVER (ORDER BY Gear_oil_temperature) AS row_num,
            COUNT(*) OVER () AS total_count
    FROM wind_turbine
) AS median_subquery
WHERE row_num BETWEEN (total_count + 1) / 2 AND total_count / 2 + 1;

# Median for Ambient_temperature
SELECT AVG(Ambient_temperature) AS median
FROM (
    SELECT Ambient_temperature,
            ROW_NUMBER() OVER (ORDER BY Ambient_temperature) AS row_num,
            COUNT(*) OVER () AS total_count
    FROM wind_turbine
) AS median_subquery
WHERE row_num BETWEEN (total_count + 1) / 2 AND total_count / 2 + 1;

# Median for Rotor_Speed
SELECT AVG(Rotor_Speed) AS median
FROM (
    SELECT Rotor_Speed,
            ROW_NUMBER() OVER (ORDER BY Rotor_Speed) AS row_num,
            COUNT(*) OVER () AS total_count
    FROM wind_turbine
) AS median_subquery
WHERE row_num BETWEEN (total_count + 1) / 2 AND total_count / 2 + 1;

# Median for Nacelle_temperature
SELECT AVG(Nacelle_temperature) AS median
FROM (
    SELECT Nacelle_temperature,
            ROW_NUMBER() OVER (ORDER BY Nacelle_temperature) AS row_num,
            COUNT(*) OVER () AS total_count
    FROM wind_turbine
) AS median_subquery
WHERE row_num BETWEEN (total_count + 1) / 2 AND total_count / 2 + 1;

# Median for Bearing_temperature
SELECT AVG(Bearing_temperature) AS median
FROM (
    SELECT Bearing_temperature,
            ROW_NUMBER() OVER (ORDER BY Bearing_temperature) AS row_num,
            COUNT(*) OVER () AS total_count
    FROM wind_turbine
) AS median_subquery
WHERE row_num BETWEEN (total_count + 1) / 2 AND total_count / 2 + 1;

# Median for Generator_speed
SELECT AVG(Generator_speed) AS median
FROM (
    SELECT Generator_speed,
            ROW_NUMBER() OVER (ORDER BY Generator_speed) AS row_num,
            COUNT(*) OVER () AS total_count
    FROM wind_turbine
) AS median_subquery
WHERE row_num BETWEEN (total_count + 1) / 2 AND total_count / 2 + 1;

# Median for Yaw_angle
SELECT AVG(Yaw_angle) AS median
FROM (
    SELECT Yaw_angle,
            ROW_NUMBER() OVER (ORDER BY Yaw_angle) AS row_num,
            COUNT(*) OVER () AS total_count
    FROM wind_turbine
) AS median_subquery
WHERE row_num BETWEEN (total_count + 1) / 2 AND total_count / 2 + 1;

# Median for Wind_direction
SELECT AVG(Wind_direction) AS median
FROM (
    SELECT Wind_direction,
            ROW_NUMBER() OVER (ORDER BY Wind_direction) AS row_num,
            COUNT(*) OVER () AS total_count
    FROM wind_turbine
) AS median_subquery
WHERE row_num BETWEEN (total_count + 1) / 2 AND total_count / 2 + 1;

# Median for Wheel_hub_temperature
SELECT AVG(Wheel_hub_temperature) AS median
FROM (
    SELECT Wheel_hub_temperature,
            ROW_NUMBER() OVER (ORDER BY Wheel_hub_temperature) AS row_num,
            COUNT(*) OVER () AS total_count
    FROM wind_turbine
) AS median_subquery
WHERE row_num BETWEEN (total_count + 1) / 2 AND total_count / 2 + 1;

# Median for Gear_box_inlet_temperature
SELECT AVG(Gear_box_inlet_temperature) AS median
FROM (
    SELECT Gear_box_inlet_temperature,
            ROW_NUMBER() OVER (ORDER BY Gear_box_inlet_temperature) AS row_num,
            COUNT(*) OVER () AS total_count
    FROM wind_turbine
) AS median_subquery
WHERE row_num BETWEEN (total_count + 1) / 2 AND total_count / 2 + 1;

/*Mode*/

# Mode for Wind_speed
SELECT Wind_speed AS mode
FROM (
SELECT Wind_speed, COUNT(*) AS frequency
FROM wind_turbine
GROUP BY Wind_speed
ORDER BY frequency DESC
LIMIT 1
) AS mode;

# Mode for Power
SELECT Power AS mode
FROM (
SELECT Power, COUNT(*) AS frequency
FROM wind_turbine
GROUP BY Power
ORDER BY frequency DESC
LIMIT 1
) AS mode;

# Mode for Nacelle_ambient_temperature
SELECT Nacelle_ambient_temperature AS mode
FROM (
SELECT Nacelle_ambient_temperature, COUNT(*) AS frequency
FROM wind_turbine
GROUP BY Nacelle_ambient_temperature
ORDER BY frequency DESC
LIMIT 1
) AS mode;

# Mode for Generator_bearing_temperature
SELECT Generator_bearing_temperature AS mode
FROM (
SELECT Generator_bearing_temperature, COUNT(*) AS frequency
FROM wind_turbine
GROUP BY Generator_bearing_temperature
ORDER BY frequency DESC
LIMIT 1
) AS mode;

# Mode for Gear_oil_temperature
SELECT Gear_oil_temperature AS mode
FROM (
SELECT Gear_oil_temperature, COUNT(*) AS frequency
FROM wind_turbine
GROUP BY Gear_oil_temperature
ORDER BY frequency DESC
LIMIT 1
) AS mode;

# Mode for Ambient_temperature
SELECT Ambient_temperature AS mode
FROM (
SELECT Ambient_temperature, COUNT(*) AS frequency
FROM wind_turbine
GROUP BY Ambient_temperature
ORDER BY frequency DESC
LIMIT 1
) AS mode;

# Mode for Rotor_Speed
SELECT Rotor_Speed AS mode
FROM (
SELECT Rotor_Speed, COUNT(*) AS frequency
FROM wind_turbine
GROUP BY Rotor_Speed
ORDER BY frequency DESC
LIMIT 1
) AS mode;

# Mode for Nacelle_temperature
SELECT Nacelle_temperature AS mode
FROM (
SELECT Nacelle_temperature, COUNT(*) AS frequency
FROM wind_turbine
GROUP BY Nacelle_temperature
ORDER BY frequency DESC
LIMIT 1
) AS mode;

# Mode for Bearing_temperature
SELECT Bearing_temperature AS mode
FROM (
SELECT Bearing_temperature, COUNT(*) AS frequency
FROM wind_turbine
GROUP BY Bearing_temperature
ORDER BY frequency DESC
LIMIT 1
) AS mode;

# Mode for Generator_speed
SELECT Generator_speed AS mode
FROM (
SELECT Generator_speed, COUNT(*) AS frequency
FROM wind_turbine
GROUP BY Generator_speed
ORDER BY frequency DESC
LIMIT 1
) AS mode;

# Mode for Yaw_angle
SELECT Yaw_angle AS mode
FROM (
SELECT Yaw_angle, COUNT(*) AS frequency
FROM wind_turbine
GROUP BY Yaw_angle
ORDER BY frequency DESC
LIMIT 1
) AS mode;

# Mode for Wind_direction
SELECT Wind_direction AS mode
FROM (
SELECT Wind_direction, COUNT(*) AS frequency
FROM wind_turbine
GROUP BY Wind_direction
ORDER BY frequency DESC
LIMIT 1
) AS mode;

# Mode for Wheel_hub_temperature
SELECT Wheel_hub_temperature AS mode
FROM (
SELECT Wheel_hub_temperature, COUNT(*) AS frequency
FROM wind_turbine
GROUP BY Wheel_hub_temperature
ORDER BY frequency DESC
LIMIT 1
) AS mode;

# Mode for Gear_box_inlet_temperature
SELECT Gear_box_inlet_temperature AS mode
FROM (
SELECT Gear_box_inlet_temperature, COUNT(*) AS frequency
FROM wind_turbine
GROUP BY Gear_box_inlet_temperature
ORDER BY frequency DESC
LIMIT 1
) AS mode;


/*Second Moment Business Decision*/

/*Variance*/

------- Calculating the Variance for Wind_speed--------
SELECT VARIANCE(Wind_speed) FROM wind_turbine;

------- VARIANCE for Power--------
SELECT VARIANCE(Power) FROM wind_turbine;

------- VARIANCE for Nacelle_ambient_temperature--------
SELECT VARIANCE(Nacelle_ambient_temperature) FROM wind_turbine;

------- VARIANCE for Generator_bearing_temperature--------
SELECT VARIANCE(Generator_bearing_temperature) FROM wind_turbine;

------- VARIANCE for Gear_oil_temperature--------
SELECT VARIANCE(Gear_oil_temperature) FROM wind_turbine;

------- VARIANCE for Ambient_temperature--------
SELECT VARIANCE(Ambient_temperature) FROM wind_turbine;

------- VARIANCE for Rotor_Speed--------
SELECT VARIANCE(Rotor_Speed) FROM wind_turbine;

------- VARIANCE for Nacelle_temperature--------
SELECT VARIANCE(Nacelle_temperature) FROM wind_turbine;

------- VARIANCE for Bearing_temperature--------
SELECT VARIANCE(Bearing_temperature) FROM wind_turbine;

------- VARIANCE for Generator_speed--------
SELECT VARIANCE(Generator_speed) FROM wind_turbine;

------- VARIANCE for Wheel_hub_temperature--------
SELECT VARIANCE(Wheel_hub_temperature) FROM wind_turbine;

------- VARIANCE for Gear_box_inlet_temperature--------
SELECT VARIANCE(Gear_box_inlet_temperature) FROM wind_turbine;

------- VARIANCE for Yaw_angle--------
SELECT VARIANCE(Yaw_angle) FROM wind_turbine;

------- VARIANCE for Wind_direction--------
SELECT VARIANCE(Wind_direction) FROM wind_turbine;

/*Standard Deviation*/

------- Calculating the Standard Deviation value for Wind_speed--------
SELECT STDDEV(Wind_speed) AS standard_deviation FROM wind_turbine;

------- Standard Deviation for Power--------
SELECT STDDEV(Power) AS standard_deviation FROM wind_turbine;

------- Standard Deviation for Nacelle_ambient_temperature--------
SELECT STDDEV(Nacelle_ambient_temperature) AS standard_deviation FROM wind_turbine;

------- Standard Deviation for Generator_bearing_temperature--------
SELECT STDDEV(Generator_bearing_temperature) AS standard_deviation FROM wind_turbine;

------- Standard Deviation for Gear_oil_temperature--------
SELECT STDDEV(Gear_oil_temperature) AS standard_deviation FROM wind_turbine;

------- Standard Deviation for Ambient_temperature--------
SELECT STDDEV(Ambient_temperature) AS standard_deviation FROM wind_turbine;

------- Standard Deviation for Rotor_Speed--------
SELECT STDDEV(Rotor_Speed) AS standard_deviation FROM wind_turbine;

------- Standard Deviation for Nacelle_temperature--------
SELECT STDDEV(Nacelle_temperature) AS standard_deviation FROM wind_turbine;

------- Standard Deviation for Bearing_temperature--------
SELECT STDDEV(Bearing_temperature) AS standard_deviation FROM wind_turbine;

------- Standard Deviation for Generator_speed--------
SELECT STDDEV(Generator_speed) AS standard_deviation FROM wind_turbine;

------- Standard Deviation for Wheel_hub_temperature--------
SELECT STDDEV(Wheel_hub_temperature) AS standard_deviation FROM wind_turbine;

------- Standard Deviation for Gear_box_inlet_temperature--------
SELECT STDDEV(Gear_box_inlet_temperature) AS standard_deviation FROM wind_turbine;

------- Standard Deviation for Yaw_angle--------
SELECT STDDEV(Yaw_angle) AS standard_deviation FROM wind_turbine;

------- Standard Deviation for Wind_direction--------
SELECT STDDEV(Wind_direction) AS standard_deviation FROM wind_turbine;

/*Range with Min & Max*/

-- Range for Wind_speed
SELECT Min(Wind_speed), Max(Wind_speed), Max(Wind_speed) - Min(Wind_speed) AS range_Wind_speed FROM wind_turbine;

-- Range for Power
SELECT Min(Power), Max(Power), Max(Power) - Min(Power) AS range_Power FROM wind_turbine;

-- Range for Nacelle_ambient_temperature
SELECT Min(Nacelle_ambient_temperature), Max(Nacelle_ambient_temperature), Max(Nacelle_ambient_temperature) - Min(Nacelle_ambient_temperature) AS range_Nacelle_ambient_temperature FROM wind_turbine;

-- Range for Generator_bearing_temperature
SELECT Min(Generator_bearing_temperature), Max(Generator_bearing_temperature), Max(Generator_bearing_temperature) - Min(Generator_bearing_temperature) AS range_Generator_bearing_temperature FROM wind_turbine;

-- Range for Gear_oil_temperature
SELECT Min(Gear_oil_temperature), Max(Gear_oil_temperature), Max(Gear_oil_temperature) - Min(Gear_oil_temperature) AS range_Gear_oil_temperature FROM wind_turbine;

-- Range for Ambient_temperature
SELECT Min(Ambient_temperature), Max(Ambient_temperature), Max(Ambient_temperature) - Min(Ambient_temperature) AS range_Ambient_temperature FROM wind_turbine;

-- Range for Rotor_Speed
SELECT Min(Rotor_Speed), Max(Rotor_Speed), Max(Rotor_Speed) - Min(Rotor_Speed) AS range_Rotor_Speed FROM wind_turbine;

-- Range for Nacelle_temperature
SELECT Min(Nacelle_temperature), Max(Nacelle_temperature), Max(Nacelle_temperature) - Min(Nacelle_temperature) AS range_Nacelle_temperature FROM wind_turbine;

-- Range for Bearing_temperature
SELECT Min(Bearing_temperature), Max(Bearing_temperature), Max(Bearing_temperature) - Min(Bearing_temperature) AS range_Bearing_temperature FROM wind_turbine;

-- Range for Generator_speed
SELECT Min(Generator_speed), Max(Generator_speed), Max(Generator_speed) - Min(Generator_speed) AS range_Generator_speed FROM wind_turbine;

-- Range for Yaw_angle
SELECT Min(Yaw_angle), Max(Yaw_angle), Max(Yaw_angle) - Min(Yaw_angle) AS range_Yaw_angle FROM wind_turbine;

-- Range for Wind_direction
SELECT Min(Wind_direction), Max(Wind_direction), Max(Wind_direction) - Min(Wind_direction) AS range_Wind_direction FROM wind_turbine;

-- Range for Wheel_hub_temperature
SELECT Min(Wheel_hub_temperature), Max(Wheel_hub_temperature), Max(Wheel_hub_temperature) - Min(Wheel_hub_temperature) AS range_Wheel_hub_temperature FROM wind_turbine;

-- Range for Gear_box_inlet_temperature
SELECT Min(Gear_box_inlet_temperature), Max(Gear_box_inlet_temperature), Max(Gear_box_inlet_temperature) - Min(Gear_box_inlet_temperature) AS range_Gear_box_inlet_temperature FROM wind_turbine;

/*Third Moment Business Decision*/

/*Skewness*/

------- Skewness value for Wind_speed--------
SELECT 3 * AVG(POW((Wind_speed - (SELECT AVG(Wind_speed) FROM wind_turbine)) / (SELECT STDDEV(Wind_speed) FROM wind_turbine), 3))
  AS skewness FROM wind_turbine;

------- Skewness for Power--------
SELECT 3 * AVG(POW((Power - (SELECT AVG(Power) FROM wind_turbine)) / (SELECT STDDEV(Power) FROM wind_turbine), 3))
  AS skewness FROM wind_turbine;
 
  ------- Skewness for Nacelle_ambient_temperature--------
SELECT 3 * AVG(POW((Nacelle_ambient_temperature - (SELECT AVG(Nacelle_ambient_temperature) FROM wind_turbine)) / (SELECT STDDEV(Nacelle_ambient_temperature) FROM wind_turbine), 3))
  AS skewness FROM wind_turbine;
 
  ------- Skewness for Generator_bearing_temperature--------
SELECT 3 * AVG(POW((Generator_bearing_temperature - (SELECT AVG(Generator_bearing_temperature) FROM wind_turbine)) / (SELECT STDDEV(Generator_bearing_temperature) FROM wind_turbine), 3))
  AS skewness FROM wind_turbine;
 
  ------- Skewness for Gear_oil_temperature--------
SELECT 3 * AVG(POW((Gear_oil_temperature - (SELECT AVG(Gear_oil_temperature) FROM wind_turbine)) / (SELECT STDDEV(Gear_oil_temperature) FROM wind_turbine), 3))
  AS skewness FROM wind_turbine;
 
  ------- Skewness for Ambient_temperature--------
SELECT 3 * AVG(POW((Ambient_temperature - (SELECT AVG(Ambient_temperature) FROM wind_turbine)) / (SELECT STDDEV(Ambient_temperature) FROM wind_turbine), 3))
  AS skewness FROM wind_turbine;
 
  ------- Skewness for Rotor_Speed--------
SELECT 3 * AVG(POW((Rotor_Speed - (SELECT AVG(Rotor_Speed) FROM wind_turbine)) / (SELECT STDDEV(Rotor_Speed) FROM wind_turbine), 3))
  AS skewness FROM wind_turbine;
 
  ------- Skewness for Nacelle_temperature--------
SELECT 3 * AVG(POW((Nacelle_temperature - (SELECT AVG(Nacelle_temperature) FROM wind_turbine)) / (SELECT STDDEV(Nacelle_temperature) FROM wind_turbine), 3))
  AS skewness FROM wind_turbine;
 
  ------- Skewness for Bearing_temperature--------
SELECT 3 * AVG(POW((Bearing_temperature - (SELECT AVG(Bearing_temperature) FROM wind_turbine)) / (SELECT STDDEV(Bearing_temperature) FROM wind_turbine), 3))
  AS skewness FROM wind_turbine;
 
  ------- Skewness for Generator_speed--------
SELECT 3 * AVG(POW((Generator_speed - (SELECT AVG(Generator_speed) FROM wind_turbine)) / (SELECT STDDEV(Generator_speed) FROM wind_turbine), 3))
  AS skewness FROM wind_turbine;
 
  ------- Skewness for Wheel_hub_temperature--------
SELECT 3 * AVG(POW((Wheel_hub_temperature - (SELECT AVG(Wheel_hub_temperature) FROM wind_turbine)) / (SELECT STDDEV(Wheel_hub_temperature) FROM wind_turbine), 3))
  AS skewness FROM wind_turbine;
 
  ------- Skewness for Gear_box_inlet_temperature--------
SELECT 3 * AVG(POW((Gear_box_inlet_temperature - (SELECT AVG(Gear_box_inlet_temperature) FROM wind_turbine)) / (SELECT STDDEV(Gear_box_inlet_temperature) FROM wind_turbine), 3))
  AS skewness FROM wind_turbine;
 
  ------- Skewness for Yaw_angle--------
SELECT 3 * AVG(POW((Yaw_angle - (SELECT AVG(Yaw_angle) FROM wind_turbine)) / (SELECT STDDEV(Yaw_angle) FROM wind_turbine), 3))
  AS skewness FROM wind_turbine;
 
  ------- Skewness for Wind_direction--------
SELECT 3 * AVG(POW((Wind_direction - (SELECT AVG(Wind_direction) FROM wind_turbine)) / (SELECT STDDEV(Wind_direction) FROM wind_turbine), 3))
  AS skewness FROM wind_turbine;
  
  
/*Fourth Moment Business Decision*/

/*Kurtosis*/

------- kurtosis value for Wind_speed--------
SELECT AVG(POW((Wind_speed - (SELECT AVG(Wind_speed) FROM wind_turbine)) / (SELECT STDDEV(Wind_speed) FROM wind_turbine), 4))
AS kurtosis FROM wind_turbine;

 ------- kurtosis for Power--------
SELECT AVG(POW((Power - (SELECT AVG(Power) FROM wind_turbine)) / (SELECT STDDEV(Power) FROM wind_turbine), 4))
AS kurtosis FROM wind_turbine;

 ------- kurtosis for Nacelle_ambient_temperature--------
SELECT AVG(POW((Nacelle_ambient_temperature - (SELECT AVG(Nacelle_ambient_temperature) FROM wind_turbine)) / (SELECT STDDEV(Nacelle_ambient_temperature) FROM wind_turbine), 4))
AS kurtosis FROM wind_turbine;

 ------- kurtosis for Generator_bearing_temperature--------
SELECT AVG(POW((Generator_bearing_temperature - (SELECT AVG(Generator_bearing_temperature) FROM wind_turbine)) / (SELECT STDDEV(Generator_bearing_temperature) FROM wind_turbine), 4))
AS kurtosis FROM wind_turbine;

 ------- kurtosis for Gear_oil_temperature--------
SELECT AVG(POW((Gear_oil_temperature - (SELECT AVG(Gear_oil_temperature) FROM wind_turbine)) / (SELECT STDDEV(Gear_oil_temperature) FROM wind_turbine), 4))
AS kurtosis FROM wind_turbine;

 ------- kurtosis for Ambient_temperature--------
SELECT AVG(POW((Ambient_temperature - (SELECT AVG(Ambient_temperature) FROM wind_turbine)) / (SELECT STDDEV(Ambient_temperature) FROM wind_turbine), 4))
AS kurtosis FROM wind_turbine;

 ------- kurtosis for Rotor_Speed--------
SELECT AVG(POW((Rotor_Speed - (SELECT AVG(Rotor_Speed) FROM wind_turbine)) / (SELECT STDDEV(Rotor_Speed) FROM wind_turbine), 4))
AS kurtosis FROM wind_turbine;

 ------- kurtosis for Nacelle_temperature--------
SELECT AVG(POW((Nacelle_temperature - (SELECT AVG(Nacelle_temperature) FROM wind_turbine)) / (SELECT STDDEV(Nacelle_temperature) FROM wind_turbine), 4))
AS kurtosis FROM wind_turbine;

 ------- kurtosis for Bearing_temperature--------
SELECT AVG(POW((Bearing_temperature - (SELECT AVG(Bearing_temperature) FROM wind_turbine)) / (SELECT STDDEV(Bearing_temperature) FROM wind_turbine), 4))
AS kurtosis FROM wind_turbine;

 ------- kurtosis for Generator_speed--------
SELECT AVG(POW((Generator_speed - (SELECT AVG(Generator_speed) FROM wind_turbine)) / (SELECT STDDEV(Generator_speed) FROM wind_turbine), 4))
AS kurtosis FROM wind_turbine;

 ------- kurtosis for Wheel_hub_temperature--------
SELECT AVG(POW((Wheel_hub_temperature - (SELECT AVG(Wheel_hub_temperature) FROM wind_turbine)) / (SELECT STDDEV(Wheel_hub_temperature) FROM wind_turbine), 4))
AS kurtosis FROM wind_turbine;

 ------- kurtosis for Gear_box_inlet_temperature--------
SELECT AVG(POW((Gear_box_inlet_temperature - (SELECT AVG(Gear_box_inlet_temperature) FROM wind_turbine)) / (SELECT STDDEV(Gear_box_inlet_temperature) FROM wind_turbine), 4))
AS kurtosis FROM wind_turbine;

 ------- kurtosis for Yaw_angle--------
SELECT AVG(POW((Yaw_angle - (SELECT AVG(Yaw_angle) FROM wind_turbine)) / (SELECT STDDEV(Yaw_angle) FROM wind_turbine), 4))
AS kurtosis FROM wind_turbine;

 ------- kurtosis for Wind_direction--------
SELECT AVG(POW((Wind_direction - (SELECT AVG(Wind_direction) FROM wind_turbine)) / (SELECT STDDEV(Wind_direction) FROM wind_turbine), 4))
AS kurtosis FROM wind_turbine;


---- Correlation coefficient ----
---- Calculating the correlation coefficient relation Wind_speed and Power-----
   Select
  ( COUNT(*) * sum(Wind_speed * Power ) - sum(Wind_speed) * sum(Power)) /
  SQRT((COUNT(*) * sum(Wind_speed * Wind_speed) - POW(sum(Wind_speed), 2)) *
       (COUNT(*) * sum(Power * Power) - POW(sum(Power), 2))) AS correlation_coefficient
  from wind_turbine;
 
 ---- Calculate the correlation coefficient relation Power and Wind_direction -----
  Select
  ( COUNT(*) * sum(Power * Wind_direction ) - sum(Power) * sum(Wind_direction)) /
  SQRT((COUNT(*) * sum(Power * Power) - POW(sum(Power), 2)) *
       (COUNT(*) * sum(Wind_direction * Wind_direction) - POW(sum(Wind_direction), 2))) AS correlation_coefficient
  from wind_turbine;
 
  ---- Calculate the correlation coefficient relation Generator_speed and Wheel_hub_temperature -----
  Select
  ( COUNT(*) * sum(Generator_speed * Wheel_hub_temperature ) - sum(Generator_speed) * sum(Wheel_hub_temperature)) /
  SQRT((COUNT(*) * sum(Generator_speed * Generator_speed) - POW(sum(Generator_speed), 2)) *
       (COUNT(*) * sum(Wheel_hub_temperature * Wheel_hub_temperature) - POW(sum(Wheel_hub_temperature), 2))) AS correlation_coefficient
  from wind_turbine;
 
 ---- Calculate the correlation coefficient relation Rotor_Speed and Bearing_temperature -----
  Select
  ( COUNT(*) * sum(Rotor_Speed * Bearing_temperature ) - sum(Rotor_Speed) * sum(Bearing_temperature)) /
  SQRT((COUNT(*) * sum(Rotor_Speed * Rotor_Speed) - POW(sum(Rotor_Speed), 2)) *
       (COUNT(*) * sum(Bearing_temperature * Bearing_temperature) - POW(sum(Bearing_temperature), 2))) AS correlation_coefficient
  from wind_turbine;

----- Calculate the Covariance coefficient relation --------
----- Calculate the Covariance coefficient relation between Wind_speed and Power --------
select AVG ((Wind_speed - avg_Wind_speed) * (Power - avg_Power)) as covariance
from wind_turbine, (select avg(Wind_speed) as avg_Wind_speed, avg(Power) as avg_Power
from wind_turbine) as subquery;

----- Calculate the Covariance coefficient relation between Power and Wind_direction --------
select AVG ((Power - avg_Power) * (Wind_direction - avg_Wind_direction)) as covariance
from wind_turbine, (select avg(Power) as avg_Power, avg(Wind_direction) as avg_Wind_direction
from wind_turbine) as subquery;

----- Calculate the Covariance coefficient relation between Generator_speed and Wheel_hub_temperature --------
select AVG ((Generator_speed - avg_Generator_speed) * (Wheel_hub_temperature - avg_Wheel_hub_temperature)) as covariance
from wind_turbine, (select avg(Generator_speed) as avg_Generator_speed, avg(Wheel_hub_temperature) as avg_Wheel_hub_temperature
from wind_turbine) as subquery;

----- Calculate the Covariance coefficient relation between Rotor_Speed and Bearing_temperature --------
select AVG ((Rotor_Speed - avg_Rotor_Speed) * (Bearing_temperature - avg_Bearing_temperature)) as covariance
from wind_turbine, (select avg(Rotor_Speed) as avg_Rotor_Speed, avg(Bearing_temperature) as avg_Bearing_temperature
from wind_turbine) as subquery;

----- Count of duplicates -----
SELECT Wind_speed,Power,Nacelle_ambient_temperature,Generator_bearing_temperature,Gear_oil_temperature,Ambient_temperature,Rotor_Speed,
Nacelle_temperature,Bearing_temperature,Generator_speed,Yaw_angle,Wind_direction,Wheel_hub_temperature,Gear_box_inlet_temperature,COUNT(*) as duplicate_count
FROM Wind_turbine
GROUP BY Wind_speed,power,Nacelle_ambient_temperature,Generator_bearing_temperature,Gear_oil_temperature,Ambient_temperature,Rotor_Speed,
Nacelle_temperature,Bearing_temperature,Generator_speed,Yaw_angle,Wind_direction,Wheel_hub_temperature,Gear_box_inlet_temperature
HAVING COUNT(*) > 1;

----- Count of Null values -----
SELECT
    COUNT(*) AS total_rows,
    SUM(CASE WHEN Wind_speed IS NULL THEN 1 ELSE 0 END) AS Wind_speed_nulls,
    COUNT(*) - COUNT(Wind_speed) AS Wind_speed_not_nulls,
    
    SUM(CASE WHEN Power IS NULL THEN 1 ELSE 0 END) AS Power_nulls,
    COUNT(*) - COUNT(Power) AS Power_not_nulls,
    
    SUM(CASE WHEN Nacelle_ambient_temperature IS NULL THEN 1 ELSE 0 END) AS Nacelle_ambient_temperature_nulls,
    COUNT(*) - COUNT(Nacelle_ambient_temperature) AS Nacelle_ambient_temperature_not_nulls,
    
    SUM(CASE WHEN Generator_bearing_temperature IS NULL THEN 1 ELSE 0 END) AS Generator_bearing_temperature_nulls,
    COUNT(*) - COUNT(Generator_bearing_temperature) AS Generator_bearing_temperature_not_nulls,
    
    SUM(CASE WHEN Gear_oil_temperature IS NULL THEN 1 ELSE 0 END) AS Gear_oil_temperature_nulls,
    COUNT(*) - COUNT(Gear_oil_temperature) AS Gear_oil_temperature_not_nulls,
    
    SUM(CASE WHEN Ambient_temperature IS NULL THEN 1 ELSE 0 END) AS Ambient_temperature_nulls,
    COUNT(*) - COUNT(Ambient_temperature) AS Ambient_temperature_not_nulls,
    
    SUM(CASE WHEN Rotor_Speed IS NULL THEN 1 ELSE 0 END) AS Rotor_Speed_nulls,
    COUNT(*) - COUNT(Rotor_Speed) AS Rotor_Speed_not_nulls,
    
    SUM(CASE WHEN Nacelle_temperature IS NULL THEN 1 ELSE 0 END) AS Nacelle_temperature_nulls,
    COUNT(*) - COUNT(Nacelle_temperature) AS Nacelle_temperature_not_nulls,
    
    SUM(CASE WHEN Bearing_temperature IS NULL THEN 1 ELSE 0 END) AS Bearing_temperature_nulls,
    COUNT(*) - COUNT(Bearing_temperature) AS Bearing_temperature_not_nulls,
    
    SUM(CASE WHEN Generator_speed IS NULL THEN 1 ELSE 0 END) AS Generator_speed_nulls,
    COUNT(*) - COUNT(Generator_speed) AS Generator_speed_not_nulls,
    
    SUM(CASE WHEN Yaw_angle IS NULL THEN 1 ELSE 0 END) AS Yaw_angle_nulls,
    COUNT(*) - COUNT(Yaw_angle) AS Yaw_angle_not_nulls,
    
    SUM(CASE WHEN Wind_direction IS NULL THEN 1 ELSE 0 END) AS Wind_direction_nulls,
    COUNT(*) - COUNT(Wind_direction) AS Wind_direction_not_nulls,
    
    SUM(CASE WHEN Wheel_hub_temperature IS NULL THEN 1 ELSE 0 END) AS Wheel_hub_temperature_nulls,
    COUNT(*) - COUNT(Wheel_hub_temperature) AS Wheel_hub_temperature_not_nulls,
    
    SUM(CASE WHEN Gear_box_inlet_temperature IS NULL THEN 1 ELSE 0 END) AS Gear_box_inlet_temperature_nulls,
    COUNT(*) - COUNT(Gear_box_inlet_temperature) AS Gear_box_inlet_temperature_not_nulls
FROM wind_turbine;


---- Counting outliers using z-score ----
    
SELECT
    COUNT(CASE WHEN ABS((Wind_speed - (SELECT mean_value FROM (SELECT AVG(Wind_speed) AS mean_value FROM Wind_turbine) AS mean_stats)) / (SELECT std_dev FROM (SELECT STDDEV(Wind_speed) AS std_dev FROM Wind_turbine) AS std_dev_stats)) > 3 THEN 1 END) AS Wind_speed_outliers,
    COUNT(CASE WHEN ABS((Power - (SELECT mean_value FROM (SELECT AVG(Power) AS mean_value FROM Wind_turbine) AS mean_stats)) / (SELECT std_dev FROM (SELECT STDDEV(Power) AS std_dev FROM Wind_turbine) AS std_dev_stats)) > 3 THEN 1 END) AS Power_outliers,
    COUNT(CASE WHEN ABS((Nacelle_ambient_temperature - (SELECT mean_value FROM (SELECT AVG(Nacelle_ambient_temperature) AS mean_value FROM Wind_turbine) AS mean_stats)) / (SELECT std_dev FROM (SELECT STDDEV(Nacelle_ambient_temperature) AS std_dev FROM Wind_turbine) AS std_dev_stats)) > 3 THEN 1 END) AS Nacelle_ambient_temperature_outliers,
    COUNT(CASE WHEN ABS((Generator_bearing_temperature - (SELECT mean_value FROM (SELECT AVG(Generator_bearing_temperature) AS mean_value FROM Wind_turbine) AS mean_stats)) / (SELECT std_dev FROM (SELECT STDDEV(Generator_bearing_temperature) AS std_dev FROM Wind_turbine) AS std_dev_stats)) > 3 THEN 1 END) AS Generator_bearing_temperature_outliers,
    COUNT(CASE WHEN ABS((Gear_oil_temperature - (SELECT mean_value FROM (SELECT AVG(Gear_oil_temperature) AS mean_value FROM Wind_turbine) AS mean_stats)) / (SELECT std_dev FROM (SELECT STDDEV(Gear_oil_temperature) AS std_dev FROM Wind_turbine) AS std_dev_stats)) > 3 THEN 1 END) AS Gear_oil_temperature_outliers,
    COUNT(CASE WHEN ABS((Ambient_temperature - (SELECT mean_value FROM (SELECT AVG(Ambient_temperature) AS mean_value FROM Wind_turbine) AS mean_stats)) / (SELECT std_dev FROM (SELECT STDDEV(Ambient_temperature) AS std_dev FROM Wind_turbine) AS std_dev_stats)) > 3 THEN 1 END) AS Ambient_temperature_outliers,
    COUNT(CASE WHEN ABS((Rotor_Speed - (SELECT mean_value FROM (SELECT AVG(Rotor_Speed) AS mean_value FROM Wind_turbine) AS mean_stats)) / (SELECT std_dev FROM (SELECT STDDEV(Rotor_Speed) AS std_dev FROM Wind_turbine) AS std_dev_stats)) > 3 THEN 1 END) AS Rotor_Speed_outliers,
    COUNT(CASE WHEN ABS((Nacelle_temperature - (SELECT mean_value FROM (SELECT AVG(Nacelle_temperature) AS mean_value FROM Wind_turbine) AS mean_stats)) / (SELECT std_dev FROM (SELECT STDDEV(Nacelle_temperature) AS std_dev FROM Wind_turbine) AS std_dev_stats)) > 3 THEN 1 END) AS Nacelle_temperature_outliers,
    COUNT(CASE WHEN ABS((Bearing_temperature - (SELECT mean_value FROM (SELECT AVG(Bearing_temperature) AS mean_value FROM Wind_turbine) AS mean_stats)) / (SELECT std_dev FROM (SELECT STDDEV(Bearing_temperature) AS std_dev FROM Wind_turbine) AS std_dev_stats)) > 3 THEN 1 END) AS Bearing_temperature_outliers,
    COUNT(CASE WHEN ABS((Generator_speed - (SELECT mean_value FROM (SELECT AVG(Generator_speed) AS mean_value FROM Wind_turbine) AS mean_stats)) / (SELECT std_dev FROM (SELECT STDDEV(Generator_speed) AS std_dev FROM Wind_turbine) AS std_dev_stats)) > 3 THEN 1 END) AS Generator_speed_outliers,
    COUNT(CASE WHEN ABS((Yaw_angle - (SELECT mean_value FROM (SELECT AVG(Yaw_angle) AS mean_value FROM Wind_turbine) AS mean_stats)) / (SELECT std_dev FROM (SELECT STDDEV(Yaw_angle) AS std_dev FROM Wind_turbine) AS std_dev_stats)) > 3 THEN 1 END) AS Yaw_angle_outliers,
    COUNT(CASE WHEN ABS((Wind_direction - (SELECT mean_value FROM (SELECT AVG(Wind_direction) AS mean_value FROM Wind_turbine) AS mean_stats)) / (SELECT std_dev FROM (SELECT STDDEV(Wind_direction) AS std_dev FROM Wind_turbine) AS std_dev_stats)) > 3 THEN 1 END) AS Wind_direction_outliers,
    COUNT(CASE WHEN ABS((Wheel_hub_temperature - (SELECT mean_value FROM (SELECT AVG(Wheel_hub_temperature) AS mean_value FROM Wind_turbine) AS mean_stats)) / (SELECT std_dev FROM (SELECT STDDEV(Wheel_hub_temperature) AS std_dev FROM Wind_turbine) AS std_dev_stats)) > 3 THEN 1 END) AS Wheel_hub_temperature_outliers,
    COUNT(CASE WHEN ABS((Gear_box_inlet_temperature - (SELECT mean_value FROM (SELECT AVG(Gear_box_inlet_temperature) AS mean_value FROM Wind_turbine) AS mean_stats)) / (SELECT std_dev FROM (SELECT STDDEV(Gear_box_inlet_temperature) AS std_dev FROM Wind_turbine) AS std_dev_stats)) > 3 THEN 1 END) AS Gear_box_inlet_temperature_outliers
FROM
    wind_turbine;

----- creation of new table to work upon outliers -----   
CREATE TABLE clean_wt AS SELECT * FROM wind_turbine;

----- Mean Imputation -----

-- Calculate the mean for each column
SELECT
    AVG(Wind_speed) AS Wind_speed_mean,
    AVG(Power) AS Power_mean,
    AVG(Nacelle_ambient_temperature) AS Nacelle_ambient_temperature_mean,
    AVG(Generator_bearing_temperature) AS Generator_bearing_temperature_mean,
    AVG(Gear_oil_temperature) AS Gear_oil_temperature_mean,
    AVG(Ambient_temperature) AS Ambient_temperature_mean,
    AVG(Rotor_Speed) AS Rotor_Speed_mean,
    AVG(Nacelle_temperature) AS Nacelle_temperature_mean,
    AVG(Bearing_temperature) AS Bearing_temperature_mean,
    AVG(Generator_speed) AS Generator_speed_mean,
    AVG(Yaw_angle) AS Yaw_angle_mean,
    AVG(Wind_direction) AS Wind_direction_mean,
    AVG(Wheel_hub_temperature) AS Wheel_hub_temperature_mean,
    AVG(Gear_box_inlet_temperature) AS Gear_box_inlet_temperature_mean
FROM clean_wt;

----- Update null values with the mean value for each column -----

----- Replacing Wind_speed with mean imputation -----
select avg(Wind_speed) as mean_value
from clean_wt
where Wind_speed is not null;

create temporary table tmp_mean as
select avg(Wind_speed) as mean_speed
from clean_wt
where Wind_speed is not null;

update clean_wt
set Wind_speed = ifnull(Wind_speed, (select mean_speed from tmp_mean));

select count(*) from clean_wt where Wind_speed is null;

drop temporary table if exists tmp_mean;

select date, Wind_speed from clean_wt where Wind_speed = '17.555572916666677';

----- Replacing Power with mean imputation -----
select avg(Power) as mean_value
from clean_wt
where Power is not null;

create temporary table tmp_mean as
select avg(Power) as mean_speed
from clean_wt
where Power is not null;

update clean_wt
set Power = ifnull(Power, (select mean_speed from tmp_mean));

select count(*) from clean_wt where Power is null;

drop temporary table if exists tmp_mean;

select date, Power from clean_wt where Power = '3.1237878260869616';

----- Replacing Nacelle_ambient_temperature with mean imputation -----
select avg(Nacelle_ambient_temperature) as mean_value
from clean_wt
where Nacelle_ambient_temperature is not null;

create temporary table tmp_mean as
select avg(Nacelle_ambient_temperature) as mean_speed
from clean_wt
where Nacelle_ambient_temperature is not null;

update clean_wt
set Nacelle_ambient_temperature = ifnull(Nacelle_ambient_temperature, (select mean_speed from tmp_mean));

select count(*) from clean_wt where Nacelle_ambient_temperature is null;

drop temporary table if exists tmp_mean;

select date, Nacelle_ambient_temperature from clean_wt where Nacelle_ambient_temperature = '21.009246717346265';

----- Replacing Nacelle_temperature with mean imputation -----
select avg(Nacelle_temperature) as mean_value
from clean_wt
where Nacelle_temperature is not null;

create temporary table tmp_mean as
select avg(Nacelle_temperature) as mean_speed
from clean_wt
where Nacelle_temperature is not null;

update clean_wt
set Nacelle_temperature = ifnull(Nacelle_temperature, (select mean_speed from tmp_mean));

select count(*) from clean_wt where Nacelle_temperature is null;

drop temporary table if exists tmp_mean;

select date, Nacelle_temperature from clean_wt where Nacelle_temperature = '45.17411195577048';

----- Replacing Generator_speed with mean imputation -----
select avg(Generator_speed) as mean_value
from clean_wt
where Generator_speed is not null;

create temporary table tmp_mean as
select avg(Generator_speed) as mean_speed
from clean_wt
where Generator_speed is not null;

update clean_wt
set Generator_speed = ifnull(Generator_speed, (select mean_speed from tmp_mean));

select count(*) from clean_wt where Generator_speed is null;

drop temporary table if exists tmp_mean;

select date, Generator_speed from clean_wt where Generator_speed = '1419.793976405274';

-- Replacing Yaw_angle with mean imputation
select avg(Yaw_angle) as mean_value
from clean_wt
where Yaw_angle is not null;

create temporary table tmp_mean as
select avg(Yaw_angle) as mean_speed
from clean_wt
where Yaw_angle is not null;

update clean_wt
set Yaw_angle = ifnull(Yaw_angle, (select mean_speed from tmp_mean));

select count(*) from clean_wt where Yaw_angle is null;

drop temporary table if exists tmp_mean;

select date, Yaw_angle from clean_wt where Yaw_angle = '45.608924843423715';

----- Replacing Gear_box_inlet_temperature with mean imputation -----
select avg(Gear_box_inlet_temperature) as mean_value
from clean_wt
where Gear_box_inlet_temperature is not null;

create temporary table tmp_mean as
select avg(Gear_box_inlet_temperature) as mean_speed
from clean_wt
where Gear_box_inlet_temperature is not null;

update clean_wt
set Gear_box_inlet_temperature = ifnull(Gear_box_inlet_temperature, (select mean_speed from tmp_mean));

select count(*) from clean_wt where Gear_box_inlet_temperature is null;

drop temporary table if exists tmp_mean;

select date, Gear_box_inlet_temperature from clean_wt where Gear_box_inlet_temperature = '22.97843976527442';


    
----- Outlier Treatment -----
    
-- Replacing outliers using Zscore outlier treatment
select * from clean_wt;

-- Wind_Speed--
-- Calculate the mean and standard deviation (Wind_speed)
SELECT
  AVG(Wind_speed) AS mean_value,
  STDDEV(Wind_speed) AS std_dev
FROM
  clean_wt;

-- Update outliers with the mean value
UPDATE clean_wt
SET Wind_speed = (SELECT mean_value FROM (SELECT AVG(Wind_speed) AS mean_value FROM clean_wt) AS mean_stats)
WHERE
  ABS((Wind_speed - (SELECT mean_value FROM (SELECT AVG(Wind_speed) AS mean_value FROM clean_wt) AS mean_stats)) /
  (SELECT std_dev FROM (SELECT STDDEV(Wind_speed) AS std_dev FROM clean_wt) AS std_dev_stats)) > 3;

-- Final Count of Wind_speed_outliers after outlier treatment
SELECT
COUNT(CASE WHEN ABS(Wind_speed - (SELECT AVG(Wind_speed) FROM clean_wt)) > 3 * (SELECT STDDEV(Wind_speed) FROM clean_wt) THEN 1 END) AS Wind_speed_outliers
FROM clean_wt;

--  Power --
-- Calculate the mean and standard deviation (Power)
SELECT
  AVG(Power) AS mean_value,
  STDDEV(Power) AS std_dev
FROM
  clean_wt;

-- Update outliers with the mean value
UPDATE clean_wt
SET Power = (SELECT mean_value FROM (SELECT AVG(Power) AS mean_value FROM clean_wt) AS mean_stats)
WHERE
  ABS((Power - (SELECT mean_value FROM (SELECT AVG(Power) AS mean_value FROM clean_wt) AS mean_stats)) /
  (SELECT std_dev FROM (SELECT STDDEV(Power) AS std_dev FROM clean_wt) AS std_dev_stats)) > 3;

-- Final Count of Power_outliers after outlier treatment
SELECT
COUNT(CASE WHEN ABS(Power - (SELECT AVG(Power) FROM clean_wt)) > 3 * (SELECT STDDEV(Power) FROM clean_wt) THEN 1 END) AS Power_outliers
FROM clean_wt;

-- Nacelle_ambient_temperature --
-- Calculate the mean and standard deviation (Nacelle_ambient_temperature)
SELECT
  AVG(Nacelle_ambient_temperature) AS mean_value,
  STDDEV(Nacelle_ambient_temperature) AS std_dev
FROM
  clean_wt;

-- Update outliers with the mean value
UPDATE clean_wt
SET Nacelle_ambient_temperature = (SELECT mean_value FROM (SELECT AVG(Nacelle_ambient_temperature) AS mean_value FROM clean_wt) AS mean_stats)
WHERE
  ABS((Nacelle_ambient_temperature - (SELECT mean_value FROM (SELECT AVG(Nacelle_ambient_temperature) AS mean_value FROM clean_wt) AS mean_stats)) /
  (SELECT std_dev FROM (SELECT STDDEV(Nacelle_ambient_temperature) AS std_dev FROM clean_wt) AS std_dev_stats)) > 3;

-- Final Count of Nacelle_ambient_temperature_outliers after outlier treatment
SELECT
COUNT(CASE WHEN ABS(Nacelle_ambient_temperature - (SELECT AVG(Nacelle_ambient_temperature) FROM clean_wt)) > 3 * (SELECT STDDEV(Nacelle_ambient_temperature) FROM clean_wt) THEN 1 END) AS Nacelle_ambient_temperature_outliers
FROM clean_wt;

-- Generator_bearing_temperature --
-- Calculate the mean and standard deviation (Generator_bearing_temperature)
SELECT
  AVG(Generator_bearing_temperature) AS mean_value,
  STDDEV(Generator_bearing_temperature) AS std_dev
FROM
  clean_wt;

-- Update outliers with the mean value
UPDATE clean_wt
SET Generator_bearing_temperature = (SELECT mean_value FROM (SELECT AVG(Generator_bearing_temperature) AS mean_value FROM clean_wt) AS mean_stats)
WHERE
  ABS((Generator_bearing_temperature - (SELECT mean_value FROM (SELECT AVG(Generator_bearing_temperature) AS mean_value FROM clean_wt) AS mean_stats)) /
  (SELECT std_dev FROM (SELECT STDDEV(Generator_bearing_temperature) AS std_dev FROM clean_wt) AS std_dev_stats)) > 3;

-- Final Count of Generator_bearing_temperature_outliers after outlier treatment
SELECT
COUNT(CASE WHEN ABS(Generator_bearing_temperature - (SELECT AVG(Generator_bearing_temperature) FROM clean_wt)) > 3 * (SELECT STDDEV(Generator_bearing_temperature) FROM clean_wt) THEN 1 END) AS Generator_bearing_temperature_outliers
FROM clean_wt;

-- Gear_oil_temperature --
-- Calculate the mean and standard deviation (Gear_oil_temperature)
SELECT
  AVG(Gear_oil_temperature) AS mean_value,
  STDDEV(Gear_oil_temperature) AS std_dev
FROM
  clean_wt;

-- Update outliers with the mean value
UPDATE clean_wt
SET Gear_oil_temperature = (SELECT mean_value FROM (SELECT AVG(Gear_oil_temperature) AS mean_value FROM clean_wt) AS mean_stats)
WHERE
  ABS((Gear_oil_temperature - (SELECT mean_value FROM (SELECT AVG(Gear_oil_temperature) AS mean_value FROM clean_wt) AS mean_stats)) /
  (SELECT std_dev FROM (SELECT STDDEV(Gear_oil_temperature) AS std_dev FROM clean_wt) AS std_dev_stats)) > 3;

-- Final Count of Gear_oil_temperature_outliers after outlier treatment
SELECT
COUNT(CASE WHEN ABS(Gear_oil_temperature - (SELECT AVG(Gear_oil_temperature) FROM clean_wt)) > 3 * (SELECT STDDEV(Gear_oil_temperature) FROM clean_wt) THEN 1 END) AS Gear_oil_temperature_outliers
FROM clean_wt;

-- Ambient_temperature --
-- Calculate the mean and standard deviation (Ambient_temperature)
SELECT
  AVG(Ambient_temperature) AS mean_value,
  STDDEV(Ambient_temperature) AS std_dev
FROM
  clean_wt;

-- Update outliers with the mean value
UPDATE clean_wt
SET Ambient_temperature = (SELECT mean_value FROM (SELECT AVG(Ambient_temperature) AS mean_value FROM clean_wt) AS mean_stats)
WHERE
  ABS((Ambient_temperature - (SELECT mean_value FROM (SELECT AVG(Ambient_temperature) AS mean_value FROM clean_wt) AS mean_stats)) /
  (SELECT std_dev FROM (SELECT STDDEV(Ambient_temperature) AS std_dev FROM clean_wt) AS std_dev_stats)) > 3;

-- Final Count of Ambient_temperature_outliers after outlier treatment
SELECT
COUNT(CASE WHEN ABS(Ambient_temperature - (SELECT AVG(Ambient_temperature) FROM clean_wt)) > 3 * (SELECT STDDEV(Ambient_temperature) FROM clean_wt) THEN 1 END) AS Ambient_temperature_outliers
FROM clean_wt;

-- Rotor_Speed --
-- Calculate the mean and standard deviation (Rotor_Speed)
SELECT
  AVG(Rotor_Speed) AS mean_value,
  STDDEV(Rotor_Speed) AS std_dev
FROM
  clean_wt;

-- Update outliers with the mean value
UPDATE clean_wt
SET Rotor_Speed = (SELECT mean_value FROM (SELECT AVG(Rotor_Speed) AS mean_value FROM clean_wt) AS mean_stats)
WHERE
  ABS((Rotor_Speed - (SELECT mean_value FROM (SELECT AVG(Rotor_Speed) AS mean_value FROM clean_wt) AS mean_stats)) /
  (SELECT std_dev FROM (SELECT STDDEV(Rotor_Speed) AS std_dev FROM clean_wt) AS std_dev_stats)) > 3;

-- Final Count of Rotor_Speed_outliers after outlier treatment
SELECT
COUNT(CASE WHEN ABS(Rotor_Speed - (SELECT AVG(Rotor_Speed) FROM clean_wt)) > 3 * (SELECT STDDEV(Rotor_Speed) FROM clean_wt) THEN 1 END) AS Rotor_Speed_outliers
FROM clean_wt;

-- Nacelle_temperature --
-- Calculate the mean and standard deviation (Nacelle_temperature)
SELECT
  AVG(Nacelle_temperature) AS mean_value,
  STDDEV(Nacelle_temperature) AS std_dev
FROM
  clean_wt;

-- Update outliers with the mean value
UPDATE clean_wt
SET Nacelle_temperature = (SELECT mean_value FROM (SELECT AVG(Nacelle_temperature) AS mean_value FROM clean_wt) AS mean_stats)
WHERE
  ABS((Nacelle_temperature - (SELECT mean_value FROM (SELECT AVG(Nacelle_temperature) AS mean_value FROM clean_wt) AS mean_stats)) /
  (SELECT std_dev FROM (SELECT STDDEV(Nacelle_temperature) AS std_dev FROM clean_wt) AS std_dev_stats)) > 3;

-- Final Count of Nacelle_temperature_outliers after outlier treatment
SELECT
COUNT(CASE WHEN ABS(Nacelle_temperature - (SELECT AVG(Nacelle_temperature) FROM clean_wt)) > 3 * (SELECT STDDEV(Nacelle_temperature) FROM clean_wt) THEN 1 END) AS Nacelle_temperature_outliers
FROM clean_wt;

-- Bearing_temperature --
-- Calculate the mean and standard deviation (Bearing_temperature)
SELECT
  AVG(Bearing_temperature) AS mean_value,
  STDDEV(Bearing_temperature) AS std_dev
FROM
  clean_wt;

-- Update outliers with the mean value
UPDATE clean_wt
SET Bearing_temperature = (SELECT mean_value FROM (SELECT AVG(Bearing_temperature) AS mean_value FROM clean_wt) AS mean_stats)
WHERE
  ABS((Bearing_temperature - (SELECT mean_value FROM (SELECT AVG(Bearing_temperature) AS mean_value FROM clean_wt) AS mean_stats)) /
  (SELECT std_dev FROM (SELECT STDDEV(Bearing_temperature) AS std_dev FROM clean_wt) AS std_dev_stats)) > 3;

-- Final Count of Bearing_temperature_outliers after outlier treatment
SELECT
COUNT(CASE WHEN ABS(Bearing_temperature - (SELECT AVG(Bearing_temperature) FROM clean_wt)) > 3 * (SELECT STDDEV(Bearing_temperature) FROM clean_wt) THEN 1 END) AS Bearing_temperature_outliers
FROM clean_wt;

-- Generator_Speed --
-- Calculate the mean and standard deviation (Generator_speed)
SELECT
  AVG(Generator_speed) AS mean_value,
  STDDEV(Generator_speed) AS std_dev
FROM
  clean_wt;

-- Update outliers with the mean value
UPDATE clean_wt
SET Generator_speed = (SELECT mean_value FROM (SELECT AVG(Generator_speed) AS mean_value FROM clean_wt) AS mean_stats)
WHERE
  ABS((Generator_speed - (SELECT mean_value FROM (SELECT AVG(Generator_speed) AS mean_value FROM clean_wt) AS mean_stats)) /
  (SELECT std_dev FROM (SELECT STDDEV(Generator_speed) AS std_dev FROM clean_wt) AS std_dev_stats)) > 3;

-- Final Count of Generator_speed_outliers after outlier treatment
SELECT
COUNT(CASE WHEN ABS(Generator_speed - (SELECT AVG(Generator_speed) FROM clean_wt)) > 3 * (SELECT STDDEV(Generator_speed) FROM clean_wt) THEN 1 END) AS Generator_speed_outliers
FROM clean_wt;

-- Yaw_angle --
-- Calculate the mean and standard deviation (Yaw_angle)
SELECT
  AVG(Yaw_angle) AS mean_value,
  STDDEV(Yaw_angle) AS std_dev
FROM
  clean_wt;

-- Update outliers with the mean value
UPDATE clean_wt
SET Yaw_angle = (SELECT mean_value FROM (SELECT AVG(Yaw_angle) AS mean_value FROM clean_wt) AS mean_stats)
WHERE
  ABS((Yaw_angle - (SELECT mean_value FROM (SELECT AVG(Yaw_angle) AS mean_value FROM clean_wt) AS mean_stats)) /
  (SELECT std_dev FROM (SELECT STDDEV(Yaw_angle) AS std_dev FROM clean_wt) AS std_dev_stats)) > 3;

-- Final Count of Yaw_angle_outliers after outlier treatment
SELECT
COUNT(CASE WHEN ABS(Yaw_angle - (SELECT AVG(Yaw_angle) FROM clean_wt)) > 3 * (SELECT STDDEV(Yaw_angle) FROM clean_wt) THEN 1 END) AS Yaw_angle_outliers
FROM clean_wt;

-- Wind_direction --
-- Calculate the mean and standard deviation (Wind_direction)
SELECT
  AVG(Wind_direction) AS mean_value,
  STDDEV(Wind_direction) AS std_dev
FROM
  clean_wt;

-- Update outliers with the mean value
UPDATE clean_wt
SET Wind_direction = (SELECT mean_value FROM (SELECT AVG(Wind_direction) AS mean_value FROM clean_wt) AS mean_stats)
WHERE
  ABS((Wind_direction - (SELECT mean_value FROM (SELECT AVG(Wind_direction) AS mean_value FROM clean_wt) AS mean_stats)) /
  (SELECT std_dev FROM (SELECT STDDEV(Wind_direction) AS std_dev FROM clean_wt) AS std_dev_stats)) > 3;

-- Final Count of Wind_direction_outliers after outlier treatment
SELECT
COUNT(CASE WHEN ABS(Wind_direction - (SELECT AVG(Wind_direction) FROM clean_wt)) > 3 * (SELECT STDDEV(Wind_direction) FROM clean_wt) THEN 1 END) AS Wind_direction_outliers
FROM clean_wt;

-- Wheel_hub_temperature --
-- Calculate the mean and standard deviation (Wheel_hub_temperature)
SELECT
  AVG(Wheel_hub_temperature) AS mean_value,
  STDDEV(Wheel_hub_temperature) AS std_dev
FROM
  clean_wt;

-- Update outliers with the mean value
UPDATE clean_wt
SET Wheel_hub_temperature = (SELECT mean_value FROM (SELECT AVG(Wheel_hub_temperature) AS mean_value FROM clean_wt) AS mean_stats)
WHERE
  ABS((Wheel_hub_temperature - (SELECT mean_value FROM (SELECT AVG(Wheel_hub_temperature) AS mean_value FROM clean_wt) AS mean_stats)) /
  (SELECT std_dev FROM (SELECT STDDEV(Wheel_hub_temperature) AS std_dev FROM clean_wt) AS std_dev_stats)) > 3;

-- Final Count of Wheel_hub_temperature_outliers after outlier treatment
SELECT
COUNT(CASE WHEN ABS(Wheel_hub_temperature - (SELECT AVG(Wheel_hub_temperature) FROM clean_wt)) > 3 * (SELECT STDDEV(Wheel_hub_temperature) FROM clean_wt) THEN 1 END) AS Wheel_hub_temperature_outliers
FROM clean_wt;

-- Gear_box_inlet_temperature --
-- Calculate the mean and standard deviation (Gear_box_inlet_temperature)
SELECT
  AVG(Gear_box_inlet_temperature) AS mean_value,
  STDDEV(Gear_box_inlet_temperature) AS std_dev
FROM
  clean_wt;

-- Update outliers with the mean value
UPDATE clean_wt
SET Gear_box_inlet_temperature = (SELECT mean_value FROM (SELECT AVG(Gear_box_inlet_temperature) AS mean_value FROM clean_wt) AS mean_stats)
WHERE
  ABS((Gear_box_inlet_temperature - (SELECT mean_value FROM (SELECT AVG(Gear_box_inlet_temperature) AS mean_value FROM clean_wt) AS mean_stats)) /
  (SELECT std_dev FROM (SELECT STDDEV(Gear_box_inlet_temperature) AS std_dev FROM clean_wt) AS std_dev_stats)) > 3;

-- Final Count of Gear_box_inlet_temperature_outliers after outlier treatment
SELECT
COUNT(CASE WHEN ABS(Gear_box_inlet_temperature - (SELECT AVG(Gear_box_inlet_temperature) FROM clean_wt)) > 3 * (SELECT STDDEV(Gear_box_inlet_temperature) FROM clean_wt) THEN 1 END) AS Gear_box_inlet_temperature_outliers
FROM clean_wt;



------- NULL VALUE COUNT after Data Preproccessing------   #List of null values for each columns---------
 SELECT
  SUM(Wind_speed IS NULL) AS Wind_speed_null_count,
  SUM(Power IS NULL) AS Power_null_count,
  SUM(Nacelle_ambient_temperature IS NULL) AS Nacelle_ambient_temperature_null_count,
  SUM(Nacelle_temperature IS NULL) AS Nacelle_temperature_null_count,
  SUM(Generator_bearing_temperature IS NULL) AS Generator_bearing_temperature_null_count,
  SUM(Gear_oil_temperature IS NULL) AS Gear_oil_temperature_null_count,
  SUM(Ambient_temperature IS NULL) AS Ambient_temperature_null_count,
  SUM(Rotor_Speed IS NULL) AS Rotor_Speed_null_count,
  SUM(Bearing_temperature IS NULL) AS Bearing_temperature_null_count,
  SUM(Wind_direction IS NULL) AS Wind_direction_null_count,
  SUM(Wheel_hub_temperature IS NULL) AS Wheel_hub_temperature_null_count,
  SUM(Generator_speed IS NULL) AS Generator_speed_null_count,
  SUM(Yaw_angle IS NULL) AS Yaw_angle_null_count,
  SUM(Gear_box_inlet_temperature IS NULL) AS Gear_box_inlet_temperature_null_count
  from clean_wt;

    

----- Four Moments of Business Decision -----

/*First Moment Business Decision*/

/*Mean*/

-- Calculating the mean value for Wind_speed
SELECT AVG(Wind_speed) AS mean_value FROM clean_wt;

-- Mean value for Power
SELECT AVG(Power) AS mean_value FROM clean_wt;

-- Mean value for Nacelle_ambient_temperature
SELECT AVG(Nacelle_ambient_temperature) AS mean_value FROM clean_wt;

-- Mean value for Generator_bearing_temperature
SELECT AVG(Generator_bearing_temperature) AS mean_value FROM clean_wt;

-- Mean value for Gear_oil_temperature
SELECT AVG(Gear_oil_temperature) AS mean_value FROM clean_wt;

-- Mean value for Ambient_temperature
SELECT AVG(Ambient_temperature) AS mean_value FROM clean_wt;

-- Mean value for Rotor_Speed
SELECT AVG(Rotor_Speed) AS mean_value FROM clean_wt;

-- Mean value for Nacelle_temperature
SELECT AVG(Nacelle_temperature) AS mean_value FROM clean_wt;

-- Mean value for Bearing_temperature
SELECT AVG(Bearing_temperature) AS mean_value FROM clean_wt;

-- Mean value for Generator_speed
SELECT AVG(Generator_speed) AS mean_value FROM clean_wt;

-- Mean value for Wheel_hub_temperature
SELECT AVG(Wheel_hub_temperature) AS mean_value FROM clean_wt;

-- Mean value for Gear_box_inlet_temperature
SELECT AVG(Gear_box_inlet_temperature) AS mean_value FROM clean_wt;

-- Mean value for Yaw_angle
SELECT AVG(Yaw_angle) AS mean_value FROM clean_wt;

-- Mean value for Wind_direction
SELECT AVG(Wind_direction) AS mean_value FROM clean_wt;

/*Median*/

-- Median for Wind_speed
SELECT AVG(Wind_speed) AS median
FROM (
    SELECT Wind_speed,
            ROW_NUMBER() OVER (ORDER BY Wind_speed) AS row_num,
            COUNT(*) OVER () AS total_count
    FROM clean_wt
) AS median_subquery
WHERE row_num BETWEEN (total_count + 1) / 2 AND total_count / 2 + 1;

-- Median for Power
SELECT AVG(Power) AS median
FROM (
    SELECT Power,
            ROW_NUMBER() OVER (ORDER BY Power) AS row_num,
            COUNT(*) OVER () AS total_count
    FROM clean_wt
) AS median_subquery
WHERE row_num BETWEEN (total_count + 1) / 2 AND total_count / 2 + 1;

-- Median for Nacelle_ambient_temperature
SELECT AVG(Nacelle_ambient_temperature) AS median
FROM (
    SELECT Nacelle_ambient_temperature,
            ROW_NUMBER() OVER (ORDER BY Nacelle_ambient_temperature) AS row_num,
            COUNT(*) OVER () AS total_count
    FROM clean_wt
) AS median_subquery
WHERE row_num BETWEEN (total_count + 1) / 2 AND total_count / 2 + 1;

-- Median for Generator_bearing_temperature
SELECT AVG(Generator_bearing_temperature) AS median
FROM (
    SELECT Generator_bearing_temperature,
            ROW_NUMBER() OVER (ORDER BY Generator_bearing_temperature) AS row_num,
            COUNT(*) OVER () AS total_count
    FROM clean_wt
) AS median_subquery
WHERE row_num BETWEEN (total_count + 1) / 2 AND total_count / 2 + 1;

-- Median for Gear_oil_temperature
SELECT AVG(Gear_oil_temperature) AS median
FROM (
    SELECT Gear_oil_temperature,
            ROW_NUMBER() OVER (ORDER BY Gear_oil_temperature) AS row_num,
            COUNT(*) OVER () AS total_count
    FROM clean_wt
) AS median_subquery
WHERE row_num BETWEEN (total_count + 1) / 2 AND total_count / 2 + 1;

-- Median for Ambient_temperature
SELECT AVG(Ambient_temperature) AS median
FROM (
    SELECT Ambient_temperature,
            ROW_NUMBER() OVER (ORDER BY Ambient_temperature) AS row_num,
            COUNT(*) OVER () AS total_count
    FROM clean_wt
) AS median_subquery
WHERE row_num BETWEEN (total_count + 1) / 2 AND total_count / 2 + 1;

-- Median for Rotor_Speed
SELECT AVG(Rotor_Speed) AS median
FROM (
    SELECT Rotor_Speed,
            ROW_NUMBER() OVER (ORDER BY Rotor_Speed) AS row_num,
            COUNT(*) OVER () AS total_count
    FROM clean_wt
) AS median_subquery
WHERE row_num BETWEEN (total_count + 1) / 2 AND total_count / 2 + 1;

-- Median for Nacelle_temperature
SELECT AVG(Nacelle_temperature) AS median
FROM (
    SELECT Nacelle_temperature,
            ROW_NUMBER() OVER (ORDER BY Nacelle_temperature) AS row_num,
            COUNT(*) OVER () AS total_count
    FROM clean_wt
) AS median_subquery
WHERE row_num BETWEEN (total_count + 1) / 2 AND total_count / 2 + 1;

-- Median for Bearing_temperature
SELECT AVG(Bearing_temperature) AS median
FROM (
    SELECT Bearing_temperature,
            ROW_NUMBER() OVER (ORDER BY Bearing_temperature) AS row_num,
            COUNT(*) OVER () AS total_count
    FROM clean_wt
) AS median_subquery
WHERE row_num BETWEEN (total_count + 1) / 2 AND total_count / 2 + 1;

-- Median for Generator_speed
SELECT AVG(Generator_speed) AS median
FROM (
    SELECT Generator_speed,
            ROW_NUMBER() OVER (ORDER BY Generator_speed) AS row_num,
            COUNT(*) OVER () AS total_count
    FROM clean_wt
) AS median_subquery
WHERE row_num BETWEEN (total_count + 1) / 2 AND total_count / 2 + 1;

-- Median for Yaw_angle
SELECT AVG(Yaw_angle) AS median
FROM (
    SELECT Yaw_angle,
            ROW_NUMBER() OVER (ORDER BY Yaw_angle) AS row_num,
            COUNT(*) OVER () AS total_count
    FROM clean_wt
) AS median_subquery
WHERE row_num BETWEEN (total_count + 1) / 2 AND total_count / 2 + 1;

-- Median for Wind_direction
SELECT AVG(Wind_direction) AS median
FROM (
    SELECT Wind_direction,
            ROW_NUMBER() OVER (ORDER BY Wind_direction) AS row_num,
            COUNT(*) OVER () AS total_count
    FROM clean_wt
) AS median_subquery
WHERE row_num BETWEEN (total_count + 1) / 2 AND total_count / 2 + 1;

-- Median for Wheel_hub_temperature
SELECT AVG(Wheel_hub_temperature) AS median
FROM (
    SELECT Wheel_hub_temperature,
            ROW_NUMBER() OVER (ORDER BY Wheel_hub_temperature) AS row_num,
            COUNT(*) OVER () AS total_count
    FROM clean_wt
) AS median_subquery
WHERE row_num BETWEEN (total_count + 1) / 2 AND total_count / 2 + 1;

-- Median for Gear_box_inlet_temperature
SELECT AVG(Gear_box_inlet_temperature) AS median
FROM (
    SELECT Gear_box_inlet_temperature,
            ROW_NUMBER() OVER (ORDER BY Gear_box_inlet_temperature) AS row_num,
            COUNT(*) OVER () AS total_count
    FROM clean_wt
) AS median_subquery
WHERE row_num BETWEEN (total_count + 1) / 2 AND total_count / 2 + 1;

/*Mode*/

-- Mode for Wind_speed
SELECT Wind_speed AS mode
FROM (
    SELECT Wind_speed, COUNT(*) AS frequency
    FROM clean_wt
    GROUP BY Wind_speed
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;

-- Mode for Power
SELECT Power AS mode
FROM (
    SELECT Power, COUNT(*) AS frequency
    FROM clean_wt
    GROUP BY Power
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;

-- Mode for Nacelle_ambient_temperature
SELECT Nacelle_ambient_temperature AS mode
FROM (
    SELECT Nacelle_ambient_temperature, COUNT(*) AS frequency
    FROM clean_wt
    GROUP BY Nacelle_ambient_temperature
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;

-- Mode for Generator_bearing_temperature
SELECT Generator_bearing_temperature AS mode
FROM (
    SELECT Generator_bearing_temperature, COUNT(*) AS frequency
    FROM clean_wt
    GROUP BY Generator_bearing_temperature
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;

-- Mode for Gear_oil_temperature
SELECT Gear_oil_temperature AS mode
FROM (
    SELECT Gear_oil_temperature, COUNT(*) AS frequency
    FROM clean_wt
    GROUP BY Gear_oil_temperature
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;

-- Mode for Ambient_temperature
SELECT Ambient_temperature AS mode
FROM (
    SELECT Ambient_temperature, COUNT(*) AS frequency
    FROM clean_wt
    GROUP BY Ambient_temperature
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;

-- Mode for Rotor_Speed
SELECT Rotor_Speed AS mode
FROM (
    SELECT Rotor_Speed, COUNT(*) AS frequency
    FROM clean_wt
    GROUP BY Rotor_Speed
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;

-- Mode for Nacelle_temperature
SELECT Nacelle_temperature AS mode
FROM (
    SELECT Nacelle_temperature, COUNT(*) AS frequency
    FROM clean_wt
    GROUP BY Nacelle_temperature
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;

-- Mode for Bearing_temperature
SELECT Bearing_temperature AS mode
FROM (
    SELECT Bearing_temperature, COUNT(*) AS frequency
    FROM clean_wt
    GROUP BY Bearing_temperature
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;

-- Mode for Generator_speed
SELECT Generator_speed AS mode
FROM (
    SELECT Generator_speed, COUNT(*) AS frequency
    FROM clean_wt
    GROUP BY Generator_speed
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;

-- Mode for Yaw_angle
SELECT Yaw_angle AS mode
FROM (
    SELECT Yaw_angle, COUNT(*) AS frequency
    FROM clean_wt
    GROUP BY Yaw_angle
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;

-- Mode for Wind_direction
SELECT Wind_direction AS mode
FROM (
    SELECT Wind_direction, COUNT(*) AS frequency
    FROM clean_wt
    GROUP BY Wind_direction
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;

-- Mode for Wheel_hub_temperature
SELECT Wheel_hub_temperature AS mode
FROM (
    SELECT Wheel_hub_temperature, COUNT(*) AS frequency
    FROM clean_wt
    GROUP BY Wheel_hub_temperature
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;

-- Mode for Gear_box_inlet_temperature
SELECT Gear_box_inlet_temperature AS mode
FROM (
    SELECT Gear_box_inlet_temperature, COUNT(*) AS frequency
    FROM clean_wt
    GROUP BY Gear_box_inlet_temperature
    ORDER BY frequency DESC
    LIMIT 1
) AS mode;


/*Second Moment Business Decision*/

/*Variance*/

-- Calculating the Variance value for Wind_speed
SELECT VARIANCE(Wind_speed) FROM clean_wt;

-- VARIANCE for Power
SELECT VARIANCE(Power) FROM clean_wt;

-- VARIANCE for Nacelle_ambient_temperature
SELECT VARIANCE(Nacelle_ambient_temperature) FROM clean_wt;

-- VARIANCE for Generator_bearing_temperature
SELECT VARIANCE(Generator_bearing_temperature) FROM clean_wt;

-- VARIANCE for Gear_oil_temperature
SELECT VARIANCE(Gear_oil_temperature) FROM clean_wt;

-- VARIANCE for Ambient_temperature
SELECT VARIANCE(Ambient_temperature) FROM clean_wt;

-- VARIANCE for Rotor_Speed
SELECT VARIANCE(Rotor_Speed) FROM clean_wt;

-- VARIANCE for Nacelle_temperature
SELECT VARIANCE(Nacelle_temperature) FROM clean_wt;

-- VARIANCE for Bearing_temperature
SELECT VARIANCE(Bearing_temperature) FROM clean_wt;

-- VARIANCE for Generator_speed
SELECT VARIANCE(Generator_speed) FROM clean_wt;

-- VARIANCE for Wheel_hub_temperature
SELECT VARIANCE(Wheel_hub_temperature) FROM clean_wt;

-- VARIANCE for Gear_box_inlet_temperature
SELECT VARIANCE(Gear_box_inlet_temperature) FROM clean_wt;

-- VARIANCE for Yaw_angle
SELECT VARIANCE(Yaw_angle) FROM clean_wt;

-- VARIANCE for Wind_direction
SELECT VARIANCE(Wind_direction) FROM clean_wt;

/*Standard Deviation*/

-- Calculating the Standard Deviation value for Wind_speed
SELECT STDDEV(Wind_speed) AS standard_deviation FROM clean_wt;

-- Standard Deviation for Power
SELECT STDDEV(Power) AS standard_deviation FROM clean_wt;

-- Standard Deviation for Nacelle_ambient_temperature
SELECT STDDEV(Nacelle_ambient_temperature) AS standard_deviation FROM clean_wt;

-- Standard Deviation for Generator_bearing_temperature
SELECT STDDEV(Generator_bearing_temperature) AS standard_deviation FROM clean_wt;

-- Standard Deviation for Gear_oil_temperature
SELECT STDDEV(Gear_oil_temperature) AS standard_deviation FROM clean_wt;

-- Standard Deviation for Ambient_temperature
SELECT STDDEV(Ambient_temperature) AS standard_deviation FROM clean_wt;

-- Standard Deviation for Rotor_Speed
SELECT STDDEV(Rotor_Speed) AS standard_deviation FROM clean_wt;

-- Standard Deviation for Nacelle_temperature
SELECT STDDEV(Nacelle_temperature) AS standard_deviation FROM clean_wt;

-- Standard Deviation for Bearing_temperature
SELECT STDDEV(Bearing_temperature) AS standard_deviation FROM clean_wt;

-- Standard Deviation for Generator_speed
SELECT STDDEV(Generator_speed) AS standard_deviation FROM clean_wt;

-- Standard Deviation for Wheel_hub_temperature
SELECT STDDEV(Wheel_hub_temperature) AS standard_deviation FROM clean_wt;

-- Standard Deviation for Gear_box_inlet_temperature
SELECT STDDEV(Gear_box_inlet_temperature) AS standard_deviation FROM clean_wt;

-- Standard Deviation for Yaw_angle
SELECT STDDEV(Yaw_angle) AS standard_deviation FROM clean_wt;

-- Standard Deviation for Wind_direction
SELECT STDDEV(Wind_direction) AS standard_deviation FROM clean_wt;

/*Range with Min & Max*/

-- Range for Wind_speed
SELECT Min(Wind_speed), Max(Wind_speed), Max(Wind_speed) - Min(Wind_speed) AS range_Wind_speed FROM clean_wt;

-- Range for Power
SELECT Min(Power), Max(Power), Max(Power) - Min(Power) AS range_Power FROM clean_wt;

-- Range for Nacelle_ambient_temperature
SELECT Min(Nacelle_ambient_temperature), Max(Nacelle_ambient_temperature), Max(Nacelle_ambient_temperature) - Min(Nacelle_ambient_temperature) AS range_Nacelle_ambient_temperature FROM clean_wt;

-- Range for Generator_bearing_temperature
SELECT Min(Generator_bearing_temperature), Max(Generator_bearing_temperature), Max(Generator_bearing_temperature) - Min(Generator_bearing_temperature) AS range_Generator_bearing_temperature FROM clean_wt;

-- Range for Gear_oil_temperature
SELECT Min(Gear_oil_temperature), Max(Gear_oil_temperature), Max(Gear_oil_temperature) - Min(Gear_oil_temperature) AS range_Gear_oil_temperature FROM clean_wt;

-- Range for Ambient_temperature
SELECT Min(Ambient_temperature), Max(Ambient_temperature), Max(Ambient_temperature) - Min(Ambient_temperature) AS range_Ambient_temperature FROM clean_wt;

-- Range for Rotor_Speed
SELECT Min(Rotor_Speed), Max(Rotor_Speed), Max(Rotor_Speed) - Min(Rotor_Speed) AS range_Rotor_Speed FROM clean_wt;

-- Range for Nacelle_temperature
SELECT Min(Nacelle_temperature), Max(Nacelle_temperature), Max(Nacelle_temperature) - Min(Nacelle_temperature) AS range_Nacelle_temperature FROM clean_wt;

-- Range for Bearing_temperature
SELECT Min(Bearing_temperature), Max(Bearing_temperature), Max(Bearing_temperature) - Min(Bearing_temperature) AS range_Bearing_temperature FROM clean_wt;

-- Range for Generator_speed
SELECT Min(Generator_speed), Max(Generator_speed), Max(Generator_speed) - Min(Generator_speed) AS range_Generator_speed FROM clean_wt;

-- Range for Yaw_angle
SELECT Min(Yaw_angle), Max(Yaw_angle), Max(Yaw_angle) - Min(Yaw_angle) AS range_Yaw_angle FROM clean_wt;

-- Range for Wind_direction
SELECT Min(Wind_direction), Max(Wind_direction), Max(Wind_direction) - Min(Wind_direction) AS range_Wind_direction FROM clean_wt;

-- Range for Wheel_hub_temperature
SELECT Min(Wheel_hub_temperature), Max(Wheel_hub_temperature), Max(Wheel_hub_temperature) - Min(Wheel_hub_temperature) AS range_Wheel_hub_temperature FROM clean_wt;

-- Range for Gear_box_inlet_temperature
SELECT Min(Gear_box_inlet_temperature), Max(Gear_box_inlet_temperature), Max(Gear_box_inlet_temperature) - Min(Gear_box_inlet_temperature) AS range_Gear_box_inlet_temperature FROM clean_wt;


/*Third Moment Business Decision*/

/*Skewness*/

-- Skewness value for Wind_speed
SELECT 3 * AVG(POW((Wind_speed - (SELECT AVG(Wind_speed) FROM clean_wt)) / (SELECT STDDEV(Wind_speed) FROM clean_wt), 3)) AS skewness FROM clean_wt;

-- Skewness for Power
SELECT 3 * AVG(POW((Power - (SELECT AVG(Power) FROM clean_wt)) / (SELECT STDDEV(Power) FROM clean_wt), 3)) AS skewness FROM clean_wt;

-- Skewness for Nacelle_ambient_temperature
SELECT 3 * AVG(POW((Nacelle_ambient_temperature - (SELECT AVG(Nacelle_ambient_temperature) FROM clean_wt)) / (SELECT STDDEV(Nacelle_ambient_temperature) FROM clean_wt), 3)) AS skewness FROM clean_wt;

-- Skewness for Generator_bearing_temperature
SELECT 3 * AVG(POW((Generator_bearing_temperature - (SELECT AVG(Generator_bearing_temperature) FROM clean_wt)) / (SELECT STDDEV(Generator_bearing_temperature) FROM clean_wt), 3)) AS skewness FROM clean_wt;

-- Skewness for Gear_oil_temperature
SELECT 3 * AVG(POW((Gear_oil_temperature - (SELECT AVG(Gear_oil_temperature) FROM clean_wt)) / (SELECT STDDEV(Gear_oil_temperature) FROM clean_wt), 3)) AS skewness FROM clean_wt;

-- Skewness for Ambient_temperature
SELECT 3 * AVG(POW((Ambient_temperature - (SELECT AVG(Ambient_temperature) FROM clean_wt)) / (SELECT STDDEV(Ambient_temperature) FROM clean_wt), 3)) AS skewness FROM clean_wt;

-- Skewness for Rotor_Speed
SELECT 3 * AVG(POW((Rotor_Speed - (SELECT AVG(Rotor_Speed) FROM clean_wt)) / (SELECT STDDEV(Rotor_Speed) FROM clean_wt), 3)) AS skewness FROM clean_wt;

-- Skewness for Nacelle_temperature
SELECT 3 * AVG(POW((Nacelle_temperature - (SELECT AVG(Nacelle_temperature) FROM clean_wt)) / (SELECT STDDEV(Nacelle_temperature) FROM clean_wt), 3)) AS skewness FROM clean_wt;

-- Skewness for Bearing_temperature
SELECT 3 * AVG(POW((Bearing_temperature - (SELECT AVG(Bearing_temperature) FROM clean_wt)) / (SELECT STDDEV(Bearing_temperature) FROM clean_wt), 3)) AS skewness FROM clean_wt;

-- Skewness for Generator_speed
SELECT 3 * AVG(POW((Generator_speed - (SELECT AVG(Generator_speed) FROM clean_wt)) / (SELECT STDDEV(Generator_speed) FROM clean_wt), 3)) AS skewness FROM clean_wt;

-- Skewness for Wheel_hub_temperature
SELECT 3 * AVG(POW((Wheel_hub_temperature - (SELECT AVG(Wheel_hub_temperature) FROM clean_wt)) / (SELECT STDDEV(Wheel_hub_temperature) FROM clean_wt), 3)) AS skewness FROM clean_wt;

-- Skewness for Gear_box_inlet_temperature
SELECT 3 * AVG(POW((Gear_box_inlet_temperature - (SELECT AVG(Gear_box_inlet_temperature) FROM clean_wt)) / (SELECT STDDEV(Gear_box_inlet_temperature) FROM clean_wt), 3)) AS skewness FROM clean_wt;

-- Skewness for Yaw_angle
SELECT 3 * AVG(POW((Yaw_angle - (SELECT AVG(Yaw_angle) FROM clean_wt)) / (SELECT STDDEV(Yaw_angle) FROM clean_wt), 3)) AS skewness FROM clean_wt;

-- Skewness for Wind_direction
SELECT 3 * AVG(POW((Wind_direction - (SELECT AVG(Wind_direction) FROM clean_wt)) / (SELECT STDDEV(Wind_direction) FROM clean_wt), 3)) AS skewness FROM clean_wt;


/*Fourth Moment Business Decision*/

/*Kurtosis*/

-- Kurtosis value for Wind_speed
SELECT AVG(POW((Wind_speed - (SELECT AVG(Wind_speed) FROM clean_wt)) / (SELECT STDDEV(Wind_speed) FROM clean_wt), 4)) AS kurtosis FROM clean_wt;

-- Kurtosis for Power
SELECT AVG(POW((Power - (SELECT AVG(Power) FROM clean_wt)) / (SELECT STDDEV(Power) FROM clean_wt), 4)) AS kurtosis FROM clean_wt;

-- Kurtosis for Nacelle_ambient_temperature
SELECT AVG(POW((Nacelle_ambient_temperature - (SELECT AVG(Nacelle_ambient_temperature) FROM clean_wt)) / (SELECT STDDEV(Nacelle_ambient_temperature) FROM clean_wt), 4)) AS kurtosis FROM clean_wt;

-- Kurtosis for Generator_bearing_temperature
SELECT AVG(POW((Generator_bearing_temperature - (SELECT AVG(Generator_bearing_temperature) FROM clean_wt)) / (SELECT STDDEV(Generator_bearing_temperature) FROM clean_wt), 4)) AS kurtosis FROM clean_wt;

-- Kurtosis for Gear_oil_temperature
SELECT AVG(POW((Gear_oil_temperature - (SELECT AVG(Gear_oil_temperature) FROM clean_wt)) / (SELECT STDDEV(Gear_oil_temperature) FROM clean_wt), 4)) AS kurtosis FROM clean_wt;

-- Kurtosis for Ambient_temperature
SELECT AVG(POW((Ambient_temperature - (SELECT AVG(Ambient_temperature) FROM clean_wt)) / (SELECT STDDEV(Ambient_temperature) FROM clean_wt), 4)) AS kurtosis FROM clean_wt;

-- Kurtosis for Rotor_Speed
SELECT AVG(POW((Rotor_Speed - (SELECT AVG(Rotor_Speed) FROM clean_wt)) / (SELECT STDDEV(Rotor_Speed) FROM clean_wt), 4)) AS kurtosis FROM clean_wt;

-- Kurtosis for Nacelle_temperature
SELECT AVG(POW((Nacelle_temperature - (SELECT AVG(Nacelle_temperature) FROM clean_wt)) / (SELECT STDDEV(Nacelle_temperature) FROM clean_wt), 4)) AS kurtosis FROM clean_wt;

-- Kurtosis for Bearing_temperature
SELECT AVG(POW((Bearing_temperature - (SELECT AVG(Bearing_temperature) FROM clean_wt)) / (SELECT STDDEV(Bearing_temperature) FROM clean_wt), 4)) AS kurtosis FROM clean_wt;

-- Kurtosis for Generator_speed
SELECT AVG(POW((Generator_speed - (SELECT AVG(Generator_speed) FROM clean_wt)) / (SELECT STDDEV(Generator_speed) FROM clean_wt), 4)) AS kurtosis FROM clean_wt;

-- Kurtosis for Wheel_hub_temperature
SELECT AVG(POW((Wheel_hub_temperature - (SELECT AVG(Wheel_hub_temperature) FROM clean_wt)) / (SELECT STDDEV(Wheel_hub_temperature) FROM clean_wt), 4)) AS kurtosis FROM clean_wt;

-- Kurtosis for Gear_box_inlet_temperature
SELECT AVG(POW((Gear_box_inlet_temperature - (SELECT AVG(Gear_box_inlet_temperature) FROM clean_wt)) / (SELECT STDDEV(Gear_box_inlet_temperature) FROM clean_wt), 4)) AS kurtosis FROM clean_wt;

-- Kurtosis for Yaw_angle
SELECT AVG(POW((Yaw_angle - (SELECT AVG(Yaw_angle) FROM clean_wt)) / (SELECT STDDEV(Yaw_angle) FROM clean_wt), 4)) AS kurtosis FROM clean_wt;

-- Kurtosis for Wind_direction
SELECT AVG(POW((Wind_direction - (SELECT AVG(Wind_direction) FROM clean_wt)) / (SELECT STDDEV(Wind_direction) FROM clean_wt), 4)) AS kurtosis FROM clean_wt;





    
    









