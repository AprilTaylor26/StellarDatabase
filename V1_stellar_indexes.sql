-- INDEXING TO IMPROVE JOIN AND FILTERING PERFORMANCE --
CREATE INDEX idx_planets_star_system ON stellar_planets(star_system);
CREATE INDEX idx_planets_host_star ON stellar_planets(host_star);

CREATE INDEX idx_discovery_planet ON stellar_discovery(planet_id);
CREATE INDEX idx_discovery_observatory ON stellar_discovery(observatory_id);
CREATE INDEX idx_discovery_year ON stellar_discovery(discovery_year);

CREATE INDEX idx_info_planet ON stellar_planetary_info(planet_id);
CREATE INDEX idx_info_mass ON stellar_planetary_info(planet_mass);
CREATE INDEX idx_info_density ON stellar_planetary_info(planet_density);

CREATE INDEX idx_galaxy_planet ON stellar_galaxy_info(planet_id);
CREATE INDEX idx_galaxy_band ON stellar_galaxy_info(distance_band);

CREATE INDEX idx_moons_planet ON planet_moons(planet_id);
CREATE INDEX idx_moons_name ON planet_moons(moon_name);

CREATE INDEX idx_observatories_country ON stellar_observatories(country);
CREATE INDEX idx_observatories_type ON stellar_observatories(telescope_type);