-- PLANET OVERVIEW VIEW --
-- Pupose: Combines planets and stars system data for reporting and analysis.
CREATE OR REPLACE VIEW vw_planet_overview AS
SELECT p.planet_id,
       p.planet_name,
       p.host_star,
       p.star_system,
       s.star_type,
       s.star_mass
 FROM stellar_planets p
 JOIN stellar_stars s ON p.host_star = s.star_name;


-- GALAXY INFO VIEW --
-- Purpose: Shows galaxy info and star system details. 
CREATE OR REPLACE VIEW vw_galaxy_overview AS
SELECT g.galaxy_lat, 
       g.galaxy_long, 
       g.distance_band, 
       p.host_star 
FROM stellar_galaxy_info g 
JOIN stellar_planets p ON g.galaxy_id = p.planet_id;


-- DISCOVERY SUMMARY VIEW --
-- Purpose: Shows planet discoveries with observatory details.
CREATE OR REPLACE VIEW vw_discovery_overview AS
SELECT d.discovery_id,
       d.discovery_facility,
       d.discovery_year,
       o.observatory_name,
       o.telescope_type
FROM stellar_discovery d
JOIN stellar_observatories o ON d.observatory_id = o.observatory_id;


-- PLANETARY STATS VIEW --
-- Purpose: Shows planetary and planet information.
CREATE OR REPLACE VIEW vw_planetary_stats_overview AS
SELECT p.planet_name,
       pi.planet_mass,
       pi.planet_color,
       p.star_system
FROM stellar_planetary_info pi
JOIN stellar_planets p ON pi.planet_id = p.planet_id;