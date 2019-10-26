-- #

--CREATE DATABASE gestion_employes COLLATE French_CI_AS;
--GO


CREATE DATABASE gestion_employes COLLATE French_CI_AS;
GO;

DROP gestion_employes;
GO;

CREATE SCHEMA gestion;
GO;


 --#

 -- selection + F5 : execute que le code selectionné


--- TEMP ----
DROP TABLE gestion_employes.gestion.employe;
DROP TABLE gestion_employes.gestion.mon_service;
DROP TABLE gestion_employes.gestion.conges;
DROP TABLE gestion_employes.gestion.conges_mens;

-- TABLES

CREATE TABLE gestion_employes.gestion.mon_service(
	code_service INT NOT NULL CONSTRAINT pk_code_service PRIMARY KEY,
	libelle VARCHAR(50) NOT NULL
);


CREATE TABLE gestion_employes.gestion.employe( 
	code_emp INT NOT NULL IDENTITY( 1, 1 ) CONSTRAINT pk_code_emp PRIMARY KEY,
	nom VARCHAR(50) NOT NULL,
	prenom VARCHAR(50) NOT NULL,
	date_embauche DATE NOT NULL,
	date_modif DATE NOT NULL,
	salaire DECIMAL(10,2) NOT NULL CONSTRAINT ck_employe_salaire CHECK( 0 < salaire ),
	photo VARCHAR(60),
	code_chef INT CONSTRAINT fk_employe_code_service REFERENCES gestion_employes.gestion.employe( code_emp ),
	code_service INT NOT NULL CONSTRAINT fk_mon_service_code_service REFERENCES gestion_employes.gestion.mon_service(code_service),
);


-- TABLE conges : definit une prise de congé . annee est un attribut qu'on va cherche dans conges_mens
CREATE TABLE gestion_employes.gestion.conges(
	code_emp INT NOT NULL
		CONSTRAINT fk_employe_code_employe REFERENCES gestion_employes.gestion.employe(code_emp),
	annee NUMERIC(4) NOT NULL,
	nb_jours_acquis INT,
	-- definition d'une clef primaire composée de deux attributs (code_emp [FK] et annee)
	CONSTRAINT pk_conges PRIMARY KEY (code_emp, annee),
);

-- TABLE conges : suggestion / correction
--CREATE TABLE gestion_employes.gestion.conges(
--	code_emp INT NOT NULL 
--		--CONSTRAINT fk_employe_code_employe : on force a nommer la contrainte (mais elle est fait implicitement avec un nom genere)
--		 REFERENCES gestion_employes.gestion.employe(code_emp),
--	annee NUMERIC(4) NOT NULL
--		CONSTRAINT fk_conges_annee REFERENCES gestion_employes.gestion.conges_mens(annee),
--	nb_jours_acquis INT,
--	-- definition d'une clef primaire composée de deux attributs (code_emp [FK] et annee)
--	CONSTRAINT pk_conges PRIMARY KEY (code_emp, annee),
--);


-- TABLE conges_mens : definit le nombre de congés par mois/ par an
--CREATE TABLE gestion_employes.gestion.conges_mens(
--	annee NUMERIC(4) NOT NULL,
--	mois NUMERIC(2),
--	nb_jours_pris numeric(2),
--	code_emp INT
--		CONSTRAINT fk_employe_conges REFERENCES gestion_employes.gestion.conges(code_emp),

--	CONSTRAINT pk_conges_mens PRIMARY KEY(annee, mois, code_emp), 
--);


--Questions?
--Dependance cyclique !
-- ? Comment creer une foreign key d'une clef primaire composée ? voir dessous

-- TABLE conges_mens : suggestion / correction
CREATE TABLE gestion_employes.gestion.conges_mens(
	annee NUMERIC(4) NOT NULL,
	mois NUMERIC(2),
	nb_jours_pris numeric(2),
	code_emp INT NOT NULL,
	CONSTRAINT pk_conges_mens PRIMARY KEY(annee, mois, code_emp),
	-- FK composée vers la table conge
	CONSTRAINT fk_conge_mens_conge FOREIGN KEY( code_emp, annee ) REFERENCES gestion_employes.gestion.conges(code_emp, annee)
);













