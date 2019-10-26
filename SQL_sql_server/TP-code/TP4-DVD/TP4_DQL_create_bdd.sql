
--DROP DATABASE dvd_location;


CREATE DATABASE dvd_location;
GO


USE dvd_location;

CREATE TABLE clients(
	code_client VARCHAR(80) CONSTRAINT pk_clients PRIMARY KEY,
	titre VARCHAR(5),
	prenom VARCHAR(50),
	nom VARCHAR(50),
	adresse_rue VARCHAR(50),
	code_postal VARCHAR(7),
	ville VARCHAR(50),
	num_telephone VARCHAR(50),
	date_naissance DATE,
	enfants INT,
);

CREATE TABLE factures(
	num_facture INT IDENTITY(1,1) CONSTRAINT pk_factures PRIMARY KEY,
	code_client VARCHAR(80),
	date_facture DATE,
	CONSTRAINT fk_factures_code_client FOREIGN KEY(code_client) REFERENCES clients(code_client),
);


CREATE TABLE genres_film(
	code_genre CHAR(2) CONSTRAINT pk_genres_film_code_genre PRIMARY KEY,
	signification VARCHAR(50),
);


CREATE TABLE realisateurs(
	code_realisateur VARCHAR(50) CONSTRAINT realisateurs_code_realisateur PRIMARY KEY,
	prenom VARCHAR(50),
	nom VARCHAR(50),
	annee_naissance INT,
	pays VARCHAR(50),
);

CREATE TABLE types_location(
	code_type CHAR(2) CONSTRAINT pk_types_location_code_type PRIMARY KEY,
	libelle VARCHAR(80),
	coefficient INT,
	nb_jours INT,
);

CREATE TABLE dvd(
	num_dvd INT IDENTITY(1,1) CONSTRAINT pk_dvd_num_dvd PRIMARY KEY,
	titre varchar(100),
	prix_base NUMERIC(5,2),
	code_realisateur VARCHAR(50),
	code_genre CHAR(2),
	annee INT,
	descriptif VARCHAR(150),
	duree INT,
	CONSTRAINT fk_dvd_code_realisateur FOREIGN KEY (code_realisateur) REFERENCES realisateurs(code_realisateur),
	CONSTRAINT fk_dvd_code_genre FOREIGN KEY (code_genre) REFERENCES genres_film(code_genre),
);


CREATE TABLE locations(
	num_facture INT,
	num_dvd INT,
	code_type CHAR(2),
	date_retour DATE,
	CONSTRAINT fk_locations_num_facture FOREIGN KEY (num_facture) REFERENCES factures(num_facture),
	CONSTRAINT fk_locations_num_dvd FOREIGN KEY (num_dvd) REFERENCES dvd(num_dvd),
	CONSTRAINT fk_locations_code_type FOREIGN KEY (code_type) REFERENCES types_location(code_type),
	CONSTRAINT pk_locations PRIMARY KEY (num_facture, num_dvd, code_type),
);





