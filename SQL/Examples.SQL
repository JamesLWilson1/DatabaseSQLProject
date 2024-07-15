--How many passengers survived?
SELECT COUNT(*) AS Survivors
FROM TitanicData
WHERE Survived = TRUE;

--What is the average age of passengers?
SELECT AVG(Age) AS AverageAge
FROM TitanicData;

--How many passengers were in each passenger class?
SELECT Pclass, COUNT(*) AS NumberOfPassengers
FROM TitanicData
GROUP BY Pclass;

--What is the average fare for each passenger class?
SELECT Pclass, AVG(Fare) AS AverageFare
FROM TitanicData
GROUP BY Pclass;

--How many passengers embarked from each location?
SELECT Embarked, COUNT(*) AS NumberOfPassengers
FROM TitanicData
WHERE Embarked IS NOT NULL
GROUP BY Embarked;

--What is the survival rate for each passenger class?
SELECT Pclass, (COUNT(*) FILTER (WHERE Survived = TRUE) * 1.0 / COUNT(*)) AS SurvivalRate
FROM TitanicData
GROUP BY Pclass;

--What is the average age of passengers who survived vs passengers who did not survive?
SELECT Survived, AVG(Age) AS AverageAge
FROM TitanicData
GROUP BY Survived;

--How many passengers traveled alone vs with family?
SELECT 
    CASE 
        WHEN SibSp = 0 AND Parch = 0 THEN 'Alone' 
        ELSE 'With Family' 
    END AS TravelStatus, 
    COUNT(*) AS NumberOfPassengers
FROM TitanicData
GROUP BY TravelStatus;

--What is the highest fare paid?
SELECT MAX(Fare) AS HighestFare
FROM TitanicData;

--List the unique cabins and the number of passengers in each cabin.
SELECT Cabin, COUNT(*) AS NumberOfPassengers
FROM TitanicData
WHERE Cabin IS NOT NULL
GROUP BY Cabin;