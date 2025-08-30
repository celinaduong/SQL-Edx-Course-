create table meteorites_staging (
    name text,
    id int,
    nametype text,
    class text,
    mass real,
    discovery text,
    year int,
    lat real,
    long real,
    primary key(id)
);


.import --csv --skip 1 meteorites.csv meteorites_staging



update meteorites_staging
set mass = null
where mass = '';

update meteorites_staging
set year = null
where year = '';

update meteorites_staging
set lat = null
where lat = '';

update meteorites_staging
set long = null
where long = '';



update
    meteorites_staging
set
    mass = round(mass, 2),
    lat = round(lat, 2),
    long = round(long, 2);



delete from meteorites_staging
where nametype = 'Relict';



create table meteorites (
    id int,
    name text,
    class text,
    mass real,
    discovery text,
    year int,
    lat real,
    long real,
    primary key(id)
);

insert into meteorites (
    id,
    name,
    class,
    mass,
    discovery,
    year,
    lat,
    long
) select
    row_number() over (order by year, name),
    name,
    class,
    mass,
    discovery,
    year,
    lat,
    long
from
    meteorites_staging;

drop table meteorites_staging;
