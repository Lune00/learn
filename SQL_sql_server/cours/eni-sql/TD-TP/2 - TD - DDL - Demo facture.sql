-- Récup. des bases de données dans le moteur SQL
-- SELECT collation_name, name FROM sys.databases;

-- Supprimer une base de données
-- DROP DATABASE une_entreprise;

-- Créer une nouvelle base de données
-- CREATE DATABASE une_entreprise COLLATE French_CI_AS;
-- GO

-- Modifier une base de données
-- ALTER DATABASE une_entreprise SET COMPATIBILITY_LEVEL = 120;
-- GO

-- Pointer sur une base de données
USE une_entreprise;
GO -- spec SQL SERVER = Commit

-- Creer un schema
-- CREATE SCHEMA facturation;

-- Creer une table
-- commentaire sur plusieurs lignes avec la combinaison /* */
/*
CREATE TABLE une_entreprise.facturation.facture(
	id int,
	nom varchar(20)
);
*/

-- Afficher les tables dans la bdd (spec. SQL SERVER)
-- SELECT * FROM une_entreprise.INFORMATION_SCHEMA.TABLES;

-- Modifier une table : ajouter des attributs
-- ALTER TABLE une_entreprise.facturation.facture
--	ADD prenom varchar(50), montantHT decimal(18,2);

-- Vérifier les attibuts de la table FACTURE
-- SELECT * FROM une_entreprise.facturation.facture;

-- Modifier un attribut d'une table
-- ALTER TABLE une_entreprise.facturation.facture
--  	ALTER COLUMN montantHT decimal(10,2);

-- Créer une table avec des contraintes
/*
CREATE TABLE une_entreprise.facturation.client(
	-- constraint : clé primaire ID
	id int IDENTITY(1,1) CONSTRAINT pk_client_id PRIMARY KEY,
	-- constraint : NOT NULL
	nom varchar(50) NOT NULL,
	-- constraint : NOT NULL AND DEFAULT VALUE
	codepostal varchar(7) NOT NULL DEFAULT '44000',
	-- constraint : UNIQUE
	siret varchar(18) NOT NULL CONSTRAINT idx_client_siret UNIQUE,
	-- constraint : CALCULATE
	age int CONSTRAINT ck_client_age CHECK(age BETWEEN 20 AND 50)
);
*/


--TP
-- 1/ SUPPRIMER LA TABLE FACTURE
-- 2/ CREER LA TABLE FACTURE (l'identifiant sera incrémenté par 2) : 
--    - Numero de facture : pas null / unique
--    - qte : pas null / supérieur à 0
--    - montantHt pas null
--    - tva : pas null / plus grand que 0 et < 50%

-- DROP TABLE une_entreprise.facturation.facture;
/*
CREATE TABLE une_entreprise.facturation.facture(
	id int IDENTITY(1,1) CONSTRAINT pk_facture_id PRIMARY KEY,
	numero varchar(10) NOT NULL CONSTRAINT idx_facture_numero UNIQUE,
	qte int NOT NULL CONSTRAINT ck_facture_qte CHECK(qte > 0),
	montant_ht decimal(10,2) NOT NULL,
	tva int NOT NULL CONSTRAINT ck_facture_tva CHECK(0 < tva AND tva < 50)
);
*/


--TD Creer une FK dans la table facture --> client
-- ALTER TABLE une_entreprise.facturation.facture
--	ADD client_id int CONSTRAINT fk_facture_client_id REFERENCES une_entreprise.facturation.client(id);

-- user
-- CREATE LOGIN my_user WITH PASSWORD='my_pass', DEFAULT_DATABASE=une_entreprise;
-- DROP LOGIN my_user; 
-- etc...
