drop cascades to type movie.award
drop cascades to type movie.platform
drop cascades to type movie.ratingscore
drop cascades to type movie.year
drop cascades to table movie.movieplatform
drop cascades to table movie.title
drop cascades to table movie.crew
drop cascades to table movie.rating
drop cascades to table movie.oscars
drop cascades to table movie.userreview
DROP SCHEMA
CREATE SCHEMA
SET
CREATE DOMAIN
CREATE DOMAIN
CREATE DOMAIN
CREATE DOMAIN
CREATE DOMAIN
CREATE TABLE
CREATE TABLE
CREATE TABLE
CREATE TABLE
CREATE TABLE
CREATE TABLE
ALTER TABLE
csc343h-zhuan1=> \q
dbsrv1:~/project$ vim schema.ddl 

create table Title(
    tID integer primary key,
    name varchar(25) not null,
    platform integer,
    foreign key (platform) references MoviePlatform(pID),
    year Year,
    director integer,
    genre varchar(20),
    country varchar(20)
);

create table Crew(
    cID integer primary key,
    firstName varchar(25) not null,
    lastName varchar(25) not null,
    title integer not null,
    foreign key (title) references Title(tID),
    dept Department,
    country varchar(20)
);

create table Rating(
    title integer not null,
    platform integer not null,
    foreign key (platform) references MoviePlatform(pID),
    foreign key (title) references Title(tID),
    score RatingScore,
    type varchar(25),
    primary key (platform, title, score)
);

create table Oscars(
    award Award,
    year Year,
    title integer not null,
    winner integer,
    foreign key (title) references Title(tID),
    foreign key (winner) references Crew(cID),
    primary key (award, year, title, winner)
);

create table UserReview(
    uID integer primary key,
    username varchar(25) not null,
    platform integer,
    title integer,
    foreign key (platform) references MoviePlatform(pID),
    foreign key (title) references Title(tID),
    rating RatingScore
);

alter table Title add foreign key (director) references Crew(cID);
