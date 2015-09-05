-- 1) How many airplanes have listed speeds? What is the minimum listed speed and the maximum listed speed?
Select Count(*) as PlanesWithSpeed,min(speed),max(speed)  from flights.planes where speed is not NuLL;

-- 2. What is the total distance flown by all of the planes in January 2013?  What is the total distance flown by all of the planes in January 2013 where the tailnum is missing?
Select sum(distance),month,year from flights.flights where month =1 and year=2013 and tailnum is NULL GROUP BY month,year;


-- 3) What is the total distance flown for all planes on July 5, 2013 grouped by aircraft manufacturer?  Write this 
-- statement first using an INNER JOIN, then using LEFT OUTER JOIN.  How do your results compare?

Select  p.manufacturer,sum(distance) as Distance from flights.flights  f inner join flights.planes p on f.tailnum=p.tailnum 
where f.month =7 and f.day= 5 and f.year=2013 and f.tailnum=p.tailnum group BY p.manufacturer order by Distance DESC;

Select  p.manufacturer,sum(distance) as Distance from flights.flights f left outer join flights.planes  p on f.tailnum=p.tailnum 
where f.month =7 and f.day= 5 and f.year=2013 and f.tailnum=p.tailnum group BY p.manufacturer order by Distance DESC;

-- Both the statements returns the same result set.

-- 4) Write and answer at least one question of your own choosing that joins information from  at least three of the 
-- tables in the flights database
-- Which Airport has maximum number of flights of which carrier and manufacturer

-- Find out carrier name, airport name on specific days when the depart delay is more than 60 minutes and the reason behind it (to start with I have considered wind_speed and wind_gust

Select  f.carrier, a.name as AirportName, f.dep_delay, f.month,f.day,f.year, w.wind_speed,w.wind_gust  from flights.flights f  
join flights.airports  a  on f.origin=a.faa 
join flights.weather w on f.origin = w.origin
where f.dep_delay >60 and f.origin=a.faa and f.origin = w.origin  group by f.month,f.day,f.year order by f.dep_delay desc;

