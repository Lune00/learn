DROP DATABASE Location;
GO

CREATE DATABASE Location;
GO

USE Location;

CREATE TABLE clients(
	noCli		NUMERIC(6)		CONSTRAINT pk_clients PRIMARY KEY,
	nom			VARCHAR(30)		NOT NULL,
	prenom		VARCHAR(30),
	adresse		VARCHAR(120),
	cpo			CHAR(5)			NOT NULL
								CONSTRAINT ck_clients_cpo CHECK(cpo BETWEEN 1000 AND 95999),
	ville		VARCHAR(80)		DEFAULT 'Nantes' NOT NULL
);

CREATE TABLE fiches(
	noFic		NUMERIC(6)		CONSTRAINT pk_fiches PRIMARY KEY,
	noCli		NUMERIC(6)		NOT NULL
								CONSTRAINT fk_fiches_clients  REFERENCES clients(noCli) ON DELETE CASCADE,
	dateCrea	DATETIME		DEFAULT GETDATE() NOT NULL	,
	datePaye	DATETIME,
	etat		CHAR(2)			DEFAULT 'EC' NOT NULL
								CONSTRAINT ck_fiches_etat CHECK(etat IN('EC', 'RE', 'SO')),
	CONSTRAINT ck_fiches_dates CHECK(datePaye > dateCrea),
	CONSTRAINT ck_fiches_datePaye_etat CHECK(datePaye IS NULL AND etat <> 'SO'
										OR datePaye IS NOT NULL AND etat = 'SO')
);

CREATE TABLE gammes(
	codeGam		CHAR(5)			CONSTRAINT pk_gammes PRIMARY KEY,
	libelle		VARCHAR(30)		NOT NULL
								CONSTRAINT un_gammes_libelle UNIQUE
);

CREATE TABLE categories(
	codeCate	CHAR(5)			CONSTRAINT pk_categories PRIMARY KEY,
	libelle		VARCHAR(30)		NOT NULL
								CONSTRAINT un_categories_libelle UNIQUE
);

CREATE TABLE tarifs(
	codeTarif	CHAR(5)			CONSTRAINT pk_tarifs PRIMARY KEY,
	libelle		VARCHAR(30)		NOT NULL
								CONSTRAINT un_tarifs_libelle UNIQUE,
	prixJour	NUMERIC(10,2)	NOT NULL
								CONSTRAINT ck_tarifs_prixJour CHECK(prixJour >= 0)
);

CREATE TABLE grilleTarifs(
	codeGam		CHAR(5)			CONSTRAINT fk_grilleTarifs_gammes 
								REFERENCES gammes(codeGam),
	codeCate	CHAR(5)			CONSTRAINT fk_grilleTarifs_categories 
								REFERENCES categories(codeCate),
	codeTarif	CHAR(5)			NOT NULL
								CONSTRAINT fk_grilleTarifs_tarifs 
								REFERENCES tarifs(codeTarif),
	CONSTRAINT pk_grilleTarifs PRIMARY KEY (codeGam, codeCate)
);

CREATE TABLE articles(
	refart		CHAR(3)			CONSTRAINT pk_articles PRIMARY KEY,
	designation VARCHAR(80)		NOT NULL,
	codeGam		CHAR(5)			NOT NULL,
	codeCate	CHAR(5)			NOT NULL,
	CONSTRAINT fk_articles_grilleTarifs FOREIGN KEY (codeGam, codeCate)
								REFERENCES grilleTarifs(codeGam, codeCate)
);

CREATE TABLE lignesFic(
	noFic		NUMERIC(6)		CONSTRAINT fk_lignesFic_fiches 
								REFERENCES fiches(noFic) ON DELETE CASCADE,
	noLig		NUMERIC(3),
	refart		CHAR(3)			NOT NULL
								CONSTRAINT fk_lignesFic_articles 
								REFERENCES articles(refart),
	depart		DATETIME		
								DEFAULT GETDATE() NOT NULL,
	retour		DATETIME,
	CONSTRAINT pk_lignesFic PRIMARY KEY(noFic, noLig),
	CONSTRAINT ck_lignesFic_dates CHECK(retour>depart)
);