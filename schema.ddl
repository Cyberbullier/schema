drop schema if exists Movie cascade;
create schema Movie;
set search_path to Movie;

create domain Department as varchar(20)
    default null
    check (value in ('Directing', 'Acting', 'Writing'))

create domain Award as varchar(20)
    default null
    check (value in ('Best Picture', 'Best Actor', 'Best Actress', 'Best Director'))

create domain Platform as varchar(20)
    default null
    check (value in ('Netflix', 'Hulu', 'Prime Video', 'IMDb', 'Rotten Tomatoes'))

create domain RatingScore as numeric(10, 2)
    default null
    check (value>=0 and value <=5.0)

create domain Year as smallint
    default null
    check (value>=1900 and value<=2020)

create table Title(
    tID integer primary key,
    name varchar(25) not null,
    foreign key platform references Platform,
    year Year,
    foreign key director references Crew,
    genre varchar(20),
    country varchar(20)
);

create table Crew(
    cID integer primary key,
    firstName varchar(25) not null,
    lastName varchar(25) not null,
    foreign key tID references Title,
    dept Department,
    country varchar(20)
);

create table Rating(
    foreign key platform references Platform,
    foreign key tID references Title,
    score RatingScore,
    type varchar(25),
    primary key (platform, tID, score)
);

create table Oscars(
    award Award,
    year Year,
    foreign key tID references Title,
    foreign key winner references Crew,
    primary key (award, year, tID, winner)
);

create table Platform(
    pID integer primary key,
    name varchar(25) not null,
    type varchar(25),
);

create table UserReview(
    uID integer primary key,
    user varchar(25),
    foreign key platform references Platform,
    foreign key tID references Title,
    rating RatingScore
);
