CREATE DATABASE gestion_employe;
GO
USE gestion_employe;

-- "service" est un mot réservé par le système. Les doubles " permettent de pallier le problème
CREATE TABLE "service"(
    code_service char(5) CONSTRAINT pk_service PRIMARY KEY,
    libelle varchar(30) NOT NULL CONSTRAINT un_service_libelle UNIQUE
);

CREATE TABLE employe( 
    code_emp int CONSTRAINT pk_employe PRIMARY KEY,
    nom varchar(20) NOT NULL,
    prenom char(20) null,
    date_embauche datetime DEFAULT getdate() NOT NULL,
    date_modif datetime  null,
    salaire numeric(8,2) NOT NULL DEFAULT 0 CONSTRAINT ck_employe_salaire CHECK (salaire >= 0),
    code_service char(5) NOT NULL REFERENCES service(code_service),
    code_chef int null REFERENCES employe(code_emp),
    CONSTRAINT ck_employe_verifdate CHECK (date_modif is null or date_modif >= date_embauche) 
);

CREATE TABLE conge(
    code_emp int NOT NULL REFERENCES employe(code_emp) ON DELETE CASCADE,   
    annee numeric(4) NOT NULL,
    nb_jours_acquis numeric(2) DEFAULT 30,
    CONSTRAINT pk_conge PRIMARY KEY (code_emp,annee)
);

CREATE TABLE conge_mens(
    code_emp int   NOT NULL,
    annee numeric(4) NOT NULL,
    mois numeric(2) NOT NULL CONSTRAINT ck_conge_mois CHECK (mois BETWEEN 1 AND 12),
    nb_jours_pris numeric(2) DEFAULT 0,
    CONSTRAINT pk_conge_mens PRIMARY KEY (code_emp, annee, mois),
    CONSTRAINT fk_conge_mens FOREIGN KEY (code_emp, annee) REFERENCES conge (code_emp, annee) ON DELETE CASCADE
);
