-- TABLES FOR PLANETARY DATABASE --
CREATE TABLE stellar_planets (
    planet_id       NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    planet_name     VARCHAR(250),
    host_star       VARCHAR(250),
    star_system     VARCHAR(250)
);


CREATE TABLE stellar_observatories (
    observatory_id      NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    observatory_name    VARCHAR(100),
    country             VARCHAR(100),
    telescope_type      VARCHAR(100)
);


CREATE TABLE stellar_stars (
    star_id     NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    star_name   VARCHAR(250),
    star_type   VARCHAR(100),
    star_mass   NUMBER,
    star_temp   NUMBER,
    star_age    NUMBER
);


CREATE TABLE stellar_systems (
    system_id       NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    system_name     VARCHAR(250),
    star_id         NUMBER,
    CONSTRAINT fk_star_system
        FOREIGN KEY (star_id)
        REFERENCES stellar_stars(star_id)
);


CREATE TABLE stellar_discovery (
    discovery_id            NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    planet_id               NUMBER,
    observatory_id          NUMBER,
    discovery_method        VARCHAR(100),
    discovery_year          NUMBER(4),
    discovery_facility      VARCHAR(250),
    discovery_telescope     VARCHAR(250),
    discovery_instrument    VARCHAR(250),
    CONSTRAINT fk_discovery_planet
        FOREIGN KEY (planet_id)
        REFERENCES stellar_planets(planet_id),
    CONSTRAINT fk_observatory_name
        FOREIGN KEY (observatory_id)
        REFERENCES stellar_observatories(observatory_id)
);


CREATE TABLE stellar_planetary_info (
    info_id         NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    planet_id       NUMBER,
    orbital_period  NUMBER,
    planet_mass     NUMBER,
    planet_density  NUMBER,
    planet_color    VARCHAR(50),
    planet_axis     NUMBER,
    CONSTRAINT fk_info_planet
        FOREIGN KEY (planet_id)
        REFERENCES stellar_planets(planet_id)
);


CREATE TABLE stellar_galaxy_info (
    galaxy_id           NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    planet_id           NUMBER,
    star_system         VARCHAR(250),
    galaxy_lat          NUMBER,
    galaxy_long         NUMBER,
    distance_band       VARCHAR(50),
    planet_habitable    CHAR(1), -- 'Y' OR 'N'
    CONSTRAINT chk_habitable CHECK (planet_habitable IN ('Y', 'N')),
    CONSTRAINT fk_galaxy_planet
        FOREIGN KEY (planet_id)
        REFERENCES stellar_planets(planet_id)
);


CREATE TABLE planet_moons (
    moon_id        NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    planet_id       NUMBER,
    moon_name       VARCHAR(100),
    orbital_period  NUMBER,
    moon_mass       NUMBER,
    CONSTRAINT fk_planetary_moons
        FOREIGN KEY (planet_id)
        REFERENCES stellar_planets(planet_id)
);


CREATE TABLE stellar_missions (
    mission_id      NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    mission_name    VARCHAR(250),
    launch_year     NUMBER(4),
    agency          VARCHAR(100),
    purpose         VARCHAR(250)
);



COMMIT;