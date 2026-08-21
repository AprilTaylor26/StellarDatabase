-- Analytical Script --
-- Purpose: Analytical queries for insights and reporting --


-- Plantet Analysis --

-- 1. total number of planets
SELECT COUNT(*) AS total_planets
FROM stellar_planets;

-- 2. Planets grouped by star system
SELECT star_system, COUNT(*) AS planet_count
FROM stellar_planets
GROUP BY star_system
ORDER BY planet_count DESC;

-- 3. Most common host star
SELECT host_star, COUNT(*) AS frequency
FROM stellar_planets
GROUP BY host_star
ORDER BY frequency DESC;


-- Discovery Analysis --

-- 1. Most common discovery method
SELECT discovery_method, COUNT(*) AS method_count
FROM stellar_discovery
GROUP BY discovery_method
ORDER BY method_count DESC;

-- 2. Discovery per observatory
SELECT o.observatory_name, COUNT(*) AS discoveries
FROM stellar_discovery d
JOIN stellar_observatories o 
    ON d.observatory_id = o.observatory_id
GROUP BY o.observatory_name
ORDER BY discoveries DESC;

-- 3. Discoveries by yeaR
SELECT discovery_year, COUNT(*) AS total
FROM stellar_discovery
GROUP BY discovery_year
ORDER BY discovery_year;


-- Planetary Characteristics Analysis --


-- 1. Average mass per star system
SELECT p.star_system, AVG(i.planet_mass) AS avg_mass
FROM stellar_planetary_info i 
JOIN stellar_planets p 
    ON i.planet_id = p.planet_id
GROUP BY p.star_system
ORDER BY avg_mass DESC;

-- 2. Top 10 hottest planets;
SELECT p.planet_name, i.orbital_period, i.planet_mass, i.planet_density
FROM stellar_planetary_info i
JOIN stellar_planets p
    ON i.planet_id = p.planet_id
ORDER BY i.planet_density DESC
FETCH FIRST 10 ROWS ONLY;


-- Galaxy Analysis --

-- 1. Planets per galaxy
SELECT galaxy_id, COUNT(*) AS planet_count
FROM stellar_galaxy_info
GROUP BY galaxy_id
ORDER BY planet_count DESC;


-- Moons and Missions Analysis --

-- 1. Number of moons per planet
SELECT p.planet_name, COUNT(*) AS moon_count
FROM planet_moons m
JOIN stellar_planets p
    ON m.planet_id = p.planet_id
GROUP BY p.planet_name
ORDER BY moon_count DESC;



-- Summary Metrics --

-- summary of major entities
SELECT
    (SELECT COUNT(*) FROM stellar_planets) AS planets,
    (SELECT COUNT(*) FROM stellar_stars) AS stars,
    (SELECT COUNT(*) FROM stellar_systems) AS systems,
    (SELECT COUNT(*) FROM stellar_observatories) AS observatories,
    (SELECT COUNT(*) FROM stellar_discovery) AS discoveries;
