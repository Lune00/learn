create table GENRES_FILM (
code_genre char(2) constraint pk_codes_genre primary key,
signification varchar(30) not null)

create table DVD(
num_dvd int identity(1,1) constraint pk_dvd primary key,
titre varchar(40) not null,
prix_base money not null,
code_realisateur char(6) null,
code_genre char(2) not null,
annee decimal null,
descriptif varchar(300) null,
duree int null,
constraint fk_dvd_genre foreign key (code_genre) references genres_film(code_genre))

create table REALISATEURS(
code_realisateur char(6) constraint pk_realisateurs primary key,
prenom varchar(20) null,
nom varchar(20) not null,
annee_naissance numeric null,
pays varchar(20) null )

alter table DVD 
add constraint fk_dvd_realisateurs foreign key(code_realisateur) references realisateurs (code_realisateur)

create table TYPES_LOCATION(
code_type char(2) constraint pk_types_location primary key,
libelle varchar(30) not null,
coefficient numeric(4,2) not null,
nb_jours numeric(6,2) not null)

create table CLIENTS(
code_client char(6) constraint pk_clients primary key,
titre varchar(4) not null,
prenom varchar(30) not null,
nom varchar(30) not null,
adresse_rue varchar(45) not null,
code_postal char(5) not null,
ville varchar(30)not null,
num_telephone char(10) not null,
date_naissance datetime null,
enfants bit null,
constraint ck_clients_titre check (titre in('M.','Mme','Mlle')))

create table FACTURES(
num_facture int identity(1,1) constraint pk_factures primary key,
code_client char(6) not null constraint fk_factures_clients references clients(code_client),
date_facture date not null)


create table LOCATIONS(
num_facture int not null ,
num_dvd int not null ,
code_type char(2) not null ,
date_retour datetime null,
constraint pk_locations primary key (num_facture,num_dvd),
constraint fk_locations_factures foreign key (num_facture) references FACTURES (num_facture),
constraint fk_locations_dvd foreign key (num_dvd) references dvd (num_dvd) )

alter table locations
add constraint fk_locations_types_location foreign key (code_type) references types_location (code_type)

/*drop table locations
drop table factures
drop table clients
drop table types_location
drop table dvd
drop table realisateurs
drop table genres_film*/

