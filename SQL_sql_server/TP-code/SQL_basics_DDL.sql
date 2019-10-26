-- commentaire ou /* */

-- selection toutes les bases de données:
--SELECT * FROM sys.databases;

-- renvoie dans l'ordre d'appel:
--SELECT name, collation_name FROM sys.databases;

-- detruit la base de données, irréversible:
--DROP DATABASE une_entreprise;

-- creer une base de données. Attention le moteur sql choisit l'encodage (depend de la config) a ne pas faire
--CREATE DATABASE une_entreprise;

--SELECT collation_name, name FROM sys.databases;

-- creation bdd avec encodage des données avec la commande COLLATE
--CREATE DATABASE une_entreprise COLLATE French_CI_AS;
--SELECT collation_name, name FROM sys.databases;

-- Modifier une base de données: gestion de version
--ALTER DATABASE une_entreprise 
--	SET COMPATIBILITY_LEVEL = 120 ;

--Creation d'un schéma pour une base de données. Quelle base utilise-t-on?

--Je mets le pointeur SQL sur cette base de données (une_entreprise) avec USE mybdd (toutes les requetes s'appliqueront que sur elles)
--Sur SQL server il faut utilise GO pour finaliser l'instruction
USE une_entreprise;
GO --spec sql server = Commit


-- Creation du schéma:
-- CREATE SCHEMA facturation;

-- Creation d'une table:

/*CREATE TABLE une_entreprise.facturation.facture(
	id INT,
	nom varchar(20)
);
*/

-- Afficher les tables dans la bdd( spec. SQL Server)
--SELECT * FROM une_entreprise.INFORMATION_SCHEMA.TABLES;

-- Modifier une table (par ex, rajouter un attribut)
/*ALTER TABLE une_entreprise.facturation.facture
	 ADD montantHT decimal(18,2);
	 */

-- Verifier les attributs de la table facture
--SELECT * FROM une_entreprise.facturation.facture;

---- Modifier attribut montantHT
--ALTER TABLE une_entreprise.facturation.facture
--	ALTER COLUMN montantHT decimal(10,2);

-- Creation d'une nouvelle table avec des contraintes et primary key

--CREATE TABLE une_entreprise.facturation.client(
--	-- Creation d'une clé primaire iD
--		-- IDENTITY(valeur de depart, increment) NOT NULL[déja géré par PRIMARY KEY] Genere auto des valeurs de clef
--		-- CONSTRAINT : primary key
--	id INT NOT NULL IDENTITY(1,1) CONSTRAINT pk_client_id PRIMARY KEY ,
--	-- constraint NOT NULL
--	nom varchar(50) NOT NULL ,
--	-- constraint NOT NULL DEFAULT 44000 (si pas nul autant mettre valeur par defaut -change rien en termes de perf
--	-- car l'espace meme en NULL est alloué)
--	codepostal varchar(7) NOT NULL DEFAULT '44000' ,
--	-- constraint : UNIQUE - CONSTRAINT s'applique ici a droite sur idx_client_siret
--	siret varchar(19) NOT NULL CONSTRAINT idx_client_siret UNIQUE ,
--	-- constraint : CALCULATE
--	age INT CONSTRAINT ck_client_age CHECK(age BETWEEN 20 AND 50) ,
--);


DROP TABLE une_entreprise.facturation.facture;

CREATE TABLE une_entreprise.facturation.facture(

	id INT NOT NULL IDENTITY(1,2) CONSTRAINT pk_facture_id PRIMARY KEY,
	numero INT NOT NULL CONSTRAINT idx_facture_numero UNIQUE ,
	quantite INT NOT NULL CONSTRAINT ck_facture_quantite CHECK(0 < quantite ),
	montantHT decimal(12,2) NOT NULL,
	tva decimal(5,2) NOT NULL CONSTRAINT ck_facture_tva CHECK( 0 < tva and 50 > tva ),
	--constraint : Foreign Key (relation entre facture et client)
	id_client INT NOT NULL,
	CONSTRAINT fk_facture_client_id FOREIGN KEY (id_client) REFERENCES une_entreprise.facturation.client(id)
);

--ajouter apres construction de la table : autre syntaxe, cree la foreign key et la liaison
--ALTER TABLE une_entreprise.facturation.facture
--	ADD id_client INT NOT NULL CONSTRAINT fk_facture_client_id REFERENCES une_entreprise.facture.client(id);

--add user with login and password, base de données d'acces par defaut












