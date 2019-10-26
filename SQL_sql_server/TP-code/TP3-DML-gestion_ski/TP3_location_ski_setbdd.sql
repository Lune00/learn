-- Go : execute ce qui precede et une fois la requete envoyée, traite les autres
CREATE DATABASE location;
GO

-- met un pointeur la bdd utilisée (plus besoin de préciser le path de la bdd)
USE location;
GO


-- Si ON , autorise l'insertion de valeurs explicites dans la colonne identité d'une table (ici ma clef 'no_client' en manuel)
-- Si OFF(par defaut) n'autorise pas l'insertion de valeurs explicites dans la colonne identité d'une table
--SET IDENTITY_INSERT client OFF;  


---- ! TESTS 
--SELECT * FROM client;
--INSERT INTO fiche(no_client, etat, date_paye) VALUES(1, 'SO', '2020-01-01' );
--SELECT * FROM fiche;

CREATE TABLE client(
	no_client NUMERIC(6) NOT NULL IDENTITY(1,1) CONSTRAINT pk_no_client PRIMARY KEY,
	nom VARCHAR(30) NOT NULL,
	prenom VARCHAR(30),
	adresse VARCHAR(120),
	cpo CHAR(5) NOT NULL CONSTRAINT ck_clien_cpo CHECK( 100 < CONVERT(INT, cpo) AND 95999 > CONVERT(INT, cpo) ),
	ville VARCHAR(80) NOT NULL DEFAULT 'Nantes'
);

--FOREIGN KEY (arg de CONSTRAINT : exige que chaque valeur de la colonne existe dans la colonne spécifiée dans la colonne référencée)
CREATE TABLE fiche(
	no_fiche NUMERIC(6) IDENTITY(0,2) NOT NULL CONSTRAINT pk_fiche_no_fiche PRIMARY KEY,
	no_client NUMERIC(6) NOT NULL CONSTRAINT fk_fiche_no_client FOREIGN KEY REFERENCES client(no_client) ON DELETE CASCADE,
	etat CHAR(2) NOT NULL CONSTRAINT ck_fiche_etat CHECK( etat IN ('EC','RE','SO' ) ),
	date_crea DATETIME NOT NULL DEFAULT GETDATE(),
	date_paye DATETIME,
	-- mettre contrainte a la fin pour eviter toutes les dependences liées a l'ordre de declaration des attributs etc...
	CONSTRAINT ck_fiche_paye CHECK( 
						( etat = 'SO' AND date_paye IS NOT NULL AND date_paye >= date_crea ) OR ( etat <> 'SO' AND date_paye IS NULL ) ),
	 
);

CREATE TABLE tarif(
	code_tarif CHAR(5) NOT NULL CONSTRAINT pk_tarif PRIMARY KEY,
	libelle VARCHAR(50) NOT NULL, 
	prix_jour NUMERIC(5,2) NOT NULL CONSTRAINT ck_prix_jour CHECK( 0 < prix_jour),
);

CREATE TABLE gamme(
	code_gam CHAR(5) NOT NULL CONSTRAINT pk_gamme_code_gam PRIMARY KEY,
	libelle VARCHAR(50) NOT NULL, 
);

CREATE TABLE categorie(
	code_cat CHAR(5) NOT NULL CONSTRAINT pk_categorie_code_cat PRIMARY KEY,
	libelle VARCHAR(50) NOT NULL, 
);

CREATE TABLE grille_tarifs(
	code_gam CHAR(5) NOT NULL,
	code_cat CHAR(5) NOT NULL,
	code_tarif CHAR(5) NOT NULL CONSTRAINT fk_grille_tarifs_code_tarif FOREIGN KEY REFERENCES tarif(code_tarif),
	CONSTRAINT pk_grille_tarifs PRIMARY KEY ( code_gam, code_cat ),
	CONSTRAINT fk_grille_tarifs_code_gam FOREIGN KEY (code_gam) REFERENCES gamme(code_gam) ON UPDATE CASCADE,
	CONSTRAINT fk_grille_tarifs_code_cat FOREIGN KEY (code_cat) REFERENCES categorie(code_cat),
);


CREATE TABLE article(
	refart CHAR(8) NOT NULL CONSTRAINT pk_article_refart PRIMARY KEY,
	designation VARCHAR(80) NOT NULL,
	code_gam CHAR(5),
	code_cat CHAR(5),
	CONSTRAINT fk_article FOREIGN KEY (code_gam, code_cat) REFERENCES grille_tarifs(code_gam,code_cat),
);


CREATE TABLE ligne_fiche(
	no_ligne NUMERIC(3) NOT NULL,
	no_fiche NUMERIC(6) NOT NULL CONSTRAINT fk_ligne_fiche_no_fiche FOREIGN KEY REFERENCES fiche(no_fiche) ON DELETE CASCADE,
	refart CHAR(8) NOT NULL COnsTRAINT fk_ligne_fiche_refart FOREIGN KEY REFERENCES article(refart),
	CONSTRAINT pk_ligne_fiche PRIMARY KEY(no_ligne, no_fiche),
	depart DATETIME NOT NULL DEFAULT GETDATE(),
	retour DATETIME,
	CONSTRAINT ck_ligne_fiche_retour CHECK( retour > depart ),
);

-- TEST 'ON DELETE CASCADE' : si je supprime le client, la fiche du client est automatiquement supprimée
--INSERT INTO client(nom,prenom,cpo) VALUES('SChuhmacher','Paul','35136');
--INSERT INTO fiche(no_client, etat) VALUES(1,'RE');
--SELECT * FROM client;
--SELECT * FROM fiche;
--DELETE FROM client WHERE no_client=1;








