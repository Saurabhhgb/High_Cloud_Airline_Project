use airlines;
SELECT count('%Airline ID')
FROM airlines.`sql file`;

-- Que 2. Find the load Factor percentage on a yearly , Quarterly , Monthly basis ( Transported passengers / Available seats)
-- Ans

-- Yearly Load Factor
SELECT 
    `Year`,
    SUM(`# Transported Passengers`) / SUM(`# Available Seats`) * 100 AS Load_Factor_Percentage
FROM
    airlines.`sql file`
GROUP BY `Year`
ORDER BY `Year`;

-- Quarterly Load Factor
SELECT 
    `Year`,
    CEIL(`Month (#)` / 3) AS Quarter,
    SUM(`# Transported Passengers`) / SUM(`# Available Seats`) * 100 AS Load_Factor_Percentage
FROM
    airlines.`sql file`
GROUP BY `Year` , Quarter
ORDER BY `Year` , Quarter;

-- Monthly Load Factor
SELECT 
    `Year`,
    `Month (#)`,
    SUM(`# Transported Passengers`) / SUM(`# Available Seats`) * 100 AS Load_Factor_Percentage
FROM
    airlines.`sql file`
GROUP BY `Year` , `Month (#)`
ORDER BY `Year` , `Month (#)`;


-- Que 3. Find the load Factor percentage on a Carrier Name basis ( Transported passengers / Available seats)
-- Ans

SELECT 
    `Carrier Name`,
    SUM(`# Transported Passengers`) / SUM(`# Available Seats`) * 100 AS Load_Factor_Percentage
FROM
    airlines.`sql file`
GROUP BY `Carrier Name`
ORDER BY Load_Factor_Percentage DESC;


-- Que 4. Identify Top 10 Carrier Names based passengers preference 
-- Ans

SELECT 
    `Carrier Name`,
    COUNT(`# Transported Passengers`) AS Total_Passengers
FROM
    airlines.`sql file`
GROUP BY `Carrier Name`
ORDER BY `Total_Passengers` DESC
LIMIT 10;

-- Que5.Display top Routes ( from-to City) based on Number of Flights 
-- Ans

SELECT 
    `From - To City`, COUNT(*) AS Number_of_Flights
FROM
    airlines.`sql file`
GROUP BY `From - To City`
ORDER BY Number_of_Flights DESC
LIMIT 10;

-- Que 6.Identify the how much load factor is occupied on Weekend vs Weekdays.
-- Ans

SELECT 
    CASE 
        WHEN DAYOFWEEK(CONCAT(`Year`, '-', `Month (#)`, '-', `Day`)) IN (1, 7) THEN 'Weekend'
        ELSE 'Weekday'
    END AS Day_Type,
    SUM(`# Transported Passengers`) / SUM(`# Available Seats`) * 100 AS Load_Factor_Percentage
FROM airlines.`sql file`
GROUP BY Day_Type;

-- Que 7.Identify number of flights based on Distance group
-- Ans

SELECT 
    `%Distance Group ID`, COUNT(*) AS `number of flights`
FROM
    airlines.`sql file`
GROUP BY `%Distance Group ID`
ORDER BY `%Distance Group ID`;
