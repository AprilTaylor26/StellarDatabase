# StellarDatabase
A relational SQL database modeling planets, stars, observatories, discoveries, and related astronomical data.

### Overview
The Stellar Database Project is a fully‑designed relational database built in Oracle SQL. It models a fictional astronomical research environment, including planets, stars, observatories, discovery events, planetary characteristics, galaxy information, and moon data. This database contains 500 rows of synthetic data and is structured for analytical queries, reporting, and exploration.

This project demonstrates beginner‑to‑intermediate SQL skills including:
Schema design
Identity primary keys
Foreign key relationships
Constraints
Indexing strategy
Views for reporting
Analytical SQL queries
Data generation using Mockaroo
Script organization and modularization

Schema Overview
Core tables:
stellar_planets – planet info
stellar_stars – star classifications
stellar_systems – star systems and galaxies
stellar_observatories – observatory metadata
stellar_discovery – discovery events
stellar_planetary_info – mass, density, orbital data
stellar_galaxy_info – galaxy mapping
planet_moons – moon data
stellar_missions – missions target information

All primary keys use Oracle GENERATED ALWAYS AS IDENTITY.
Foreign keys connect planets to discoveries, observatories, systems, galaxies, moons, and missions.

Views Created: 
vw_planet_overview – planets + stars + systems
vw_discovery_overview – discoveries + observatories
vw_planetary_stats_overview – planet data
vw_galaxy_overview – host star + galaxy information
