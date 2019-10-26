USE location;
GO

-- DELETE FROM tablename CONDITION. Ici aucune condition, alors cela supprime tous les records

DELETE FROM ligne_fiche;
DELETE FROM article;
DELETE FROM grille_tarifs;
DELETE FROM client;
DELETE FROM gamme;
DELETE FROM categorie;
DELETE FROM fiche;
DELETE FROM tarif;




-- Ici je veux choisir manuellement la colonne IDENTITY qui est no_client (ma PK), alors j'active cette option
-- On ne peut set IDENTITY_INSERT en ON qu'a une table a la fois. Il faut que je set OFF pour client
-- set ON pour fiche. Il faut qu'on ON soit suivi d'un OFF (temporaire)

PRINT 'Start insert'


INSERT INTO categorie(code_cat, libelle)
	VALUES('MONO','Monoski'),
		  ('SURF','Surf'),
		  ('PA','Patinette'),
		  ('FOA','Ski de fond alternatif'),
		  ('FOP','Ski de fond patineur'),
		  ('SA','Ski alpin')
;


PRINT 'data categorie inserted'


INSERT INTO gamme(code_gam, libelle)
	VALUES('PR','Matériel Professionnel'),
	      ('HG','Haut de gamme'),
		  ('MG','Moyenne gamme'),
		  ('EG','Entrée de gamme')
;

PRINT 'data gamme inserted'

INSERT INTO tarif(code_tarif, libelle,prix_jour)
	VALUES('T1','Base',10),
	      ('T2','Chocolat',15),
		  ('T3','Bronze',20),
		  ('T4','Argent',30),
		  ('T5','Or',50),
		  ('T6','Platine',90)
;

PRINT 'data tarif inserted'


INSERT INTO grille_tarifs(code_gam, code_cat, code_tarif)
	VALUES('EG','MONO','T1'),
	      ('EG','FOA','T1')
;

PRINT 'data grille_tarifs inserted'


INSERT INTO article(refart, designation, code_gam, code_cat)
	VALUES('F01','Fisher Cruiser','EG','FOA'),
		  ('F05','Fisher Cruiser','EG','FOA');

PRINT 'data grille_tarifs inserted'


SET IDENTITY_INSERT client ON;
INSERT INTO client( no_client, nom, prenom, adresse, cpo, ville)
	VALUES(1,'Albert','Anatole','Rue des accacias','6100','Amiens'), 
		  (2,'Bernard', 'Barnabé', 'Rue du bar', '01000', 'Bourg en Bresse'),
		  (3, 'Dupond', 'Camille', 'Rue crébillon', '44000', 'Nantes'),
		  (4,'Desmoulin', 'Daniel', 'Rue descendante', '21000', 'Dijon'),
		  (14, 'Boutaud', 'Sabine', 'Rue des platanes', '75002', 'Paris');
SET IDENTITY_INSERT client OFF;

PRINT 'data client inserted'



SET IDENTITY_INSERT fiche ON;
INSERT INTO fiche(no_fiche, no_client, date_crea, date_paye, etat)
	VALUES(1001, 14 , GETDATE() - 15 , GETDATE() - 13, 'SO'),
		  (1002, 4 , GETDATE() - 13 , NULL, 'EC'), 
		  (1003, 1 , GETDATE() - 12 , NULL, 'RE'); 
SET IDENTITY_INSERT fiche OFF;

PRINT 'data fiche inserted'


INSERT INTO ligne_fiche(no_fiche, no_ligne, refart, depart , retour)
	VALUES(1001, 1 , 'F05', GETDATE() - 15, GETDATE() - 13);
