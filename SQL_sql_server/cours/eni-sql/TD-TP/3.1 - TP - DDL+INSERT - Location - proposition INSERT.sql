USE Location;

-- suppression des précédente valeurs entrées dans la base de données

DELETE FROM lignesFic;
DELETE FROM articles;
DELETE FROM grilleTarifs;
DELETE FROM tarifs;
DELETE FROM gammes;
DELETE FROM categories;
DELETE FROM fiches;
DELETE FROM clients;

-- clients

INSERT INTO clients VALUES(1, 'Albert', 'Anatole', 'Rue des accacias', '61000', 'Amiens');
INSERT INTO clients VALUES(2, 'Bernard', 'Barnabé', 'Rue du bar', '01000', 'Bourg en Bresse');
INSERT INTO clients VALUES(3, 'Dupond', 'Camille', 'Rue Crébillon', '44000', DEFAULT);
INSERT INTO clients VALUES(4, 'Desmoulin', 'Daniel', 'Rue descendante', '21000', 'Dijon');
INSERT INTO clients VALUES(5, 'Ernest', 'Etienne', 'Rue de l’échaffaud', '42000', 'Saint Étienne');
INSERT INTO clients VALUES(6, 'Ferdinand', 'François', 'Rue de la convention', '44100', DEFAULT);
INSERT INTO clients VALUES(9, 'Dupond', 'Jean', 'Rue des mimosas', '75018', 'Paris');
INSERT INTO clients VALUES(14, 'Boutaud', 'Sabine', 'Rue des platanes', '75002', 'Paris');

-- fiches

INSERT INTO fiches VALUES(1001, 14, GETDATE()-15, GETDATE()-13, 'SO');
INSERT INTO fiches VALUES(1002, 4, GETDATE()-13, NULL, DEFAULT);
INSERT INTO fiches VALUES(1003, 1, GETDATE()-12, GETDATE()-10, 'SO');
INSERT INTO fiches VALUES(1004, 6, GETDATE()-11, NULL, DEFAULT);
INSERT INTO fiches VALUES(1005, 3, GETDATE()-10, NULL, DEFAULT);
INSERT INTO fiches VALUES(1006, 9, GETDATE()-10, NULL, 'RE');
INSERT INTO fiches VALUES(1007, 1, GETDATE()-3, NULL, DEFAULT);
INSERT INTO fiches VALUES(1008, 2, DEFAULT, NULL, DEFAULT);

-- gammes

INSERT INTO gammes VALUES('PR', 'Matériel Professionnel');
INSERT INTO gammes VALUES('HG', 'Haut de gamme');
INSERT INTO gammes VALUES('MG', 'Moyenne gamme');
INSERT INTO gammes VALUES('EG', 'Entrée de gamme');

-- categories

INSERT INTO categories VALUES('MONO', 'Monoski');
INSERT INTO categories VALUES('SURF', 'Surf');
INSERT INTO categories VALUES('PA', 'Patinette');
INSERT INTO categories VALUES('FOA', 'Ski de fond alternatif');
INSERT INTO categories VALUES('FOP', 'Ski de fond patineur');
INSERT INTO categories VALUES('SA', 'Ski alpin');

-- tarifs

INSERT INTO tarifs VALUES('T1', 'Base', 10);
INSERT INTO tarifs VALUES('T2', 'Chocolat', 15);
INSERT INTO tarifs VALUES('T3', 'Bronze', 20);
INSERT INTO tarifs VALUES('T4', 'Argent', 30);
INSERT INTO tarifs VALUES('T5', 'Or', 50);
INSERT INTO tarifs VALUES('T6', 'Platine', 90);

-- grilleTarifs

INSERT INTO grilleTarifs VALUES('EG', 'MONO', 'T1');
INSERT INTO grilleTarifs VALUES('MG', 'MONO', 'T2');
INSERT INTO grilleTarifs VALUES('EG', 'SURF', 'T1');
INSERT INTO grilleTarifs VALUES('MG', 'SURF', 'T2');
INSERT INTO grilleTarifs VALUES('HG', 'SURF', 'T3');
INSERT INTO grilleTarifs VALUES('PR', 'SURF', 'T5');
INSERT INTO grilleTarifs VALUES('EG', 'PA', 'T1');
INSERT INTO grilleTarifs VALUES('MG', 'PA', 'T2');
INSERT INTO grilleTarifs VALUES('EG', 'FOA', 'T1');
INSERT INTO grilleTarifs VALUES('MG', 'FOA', 'T2');
INSERT INTO grilleTarifs VALUES('HG', 'FOA', 'T4');
INSERT INTO grilleTarifs VALUES('PR', 'FOA', 'T6');
INSERT INTO grilleTarifs VALUES('EG', 'FOP', 'T2');
INSERT INTO grilleTarifs VALUES('MG', 'FOP', 'T3');
INSERT INTO grilleTarifs VALUES('HG', 'FOP', 'T4');
INSERT INTO grilleTarifs VALUES('PR', 'FOP', 'T6');
INSERT INTO grilleTarifs VALUES('EG', 'SA', 'T1');
INSERT INTO grilleTarifs VALUES('MG', 'SA', 'T2');
INSERT INTO grilleTarifs VALUES('HG', 'SA', 'T4');
INSERT INTO grilleTarifs VALUES('PR', 'SA', 'T6');

-- articles

INSERT INTO articles VALUES('F01', 'Fischer Cruiser', 'EG', 'FOA');
INSERT INTO articles VALUES('F02', 'Fischer Cruiser', 'EG', 'FOA');
INSERT INTO articles VALUES('F03', 'Fischer Cruiser', 'EG', 'FOA');
INSERT INTO articles VALUES('F04', 'Fischer Cruiser', 'EG', 'FOA');
INSERT INTO articles VALUES('F05', 'Fischer Cruiser', 'EG', 'FOA');
INSERT INTO articles VALUES('F10', 'Fischer Sporty Crown', 'MG', 'FOA');
INSERT INTO articles VALUES('F20', 'Fischer RCS Classic GOLD', 'PR', 'FOA');
INSERT INTO articles VALUES('F21', 'Fischer RCS Classic GOLD', 'PR', 'FOA');
INSERT INTO articles VALUES('F22', 'Fischer RCS Classic GOLD', 'PR', 'FOA');
INSERT INTO articles VALUES('F23', 'Fischer RCS Classic GOLD', 'PR', 'FOA');
INSERT INTO articles VALUES('F50', 'Fischer SOSSkating VASA', 'HG', 'FOP');
INSERT INTO articles VALUES('F60', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP');
INSERT INTO articles VALUES('F61', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP');
INSERT INTO articles VALUES('F62', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP');
INSERT INTO articles VALUES('F63', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP');
INSERT INTO articles VALUES('F64', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP');
INSERT INTO articles VALUES('P01', 'Décathlon Allegre junior 150', 'EG', 'PA');
INSERT INTO articles VALUES('P10', 'Fischer mini ski patinette', 'MG', 'PA');
INSERT INTO articles VALUES('P11', 'Fischer mini ski patinette', 'MG', 'PA');
INSERT INTO articles VALUES('S01', 'Décathlon Apparition', 'EG', 'SURF');
INSERT INTO articles VALUES('S02', 'Décathlon Apparition', 'EG', 'SURF');
INSERT INTO articles VALUES('S03', 'Décathlon Apparition', 'EG', 'SURF');
INSERT INTO articles VALUES('A01', 'Salomon 24X+Z12', 'EG', 'SA');
INSERT INTO articles VALUES('A02', 'Salomon 24X+Z12', 'EG', 'SA');
INSERT INTO articles VALUES('A03', 'Salomon 24X+Z12', 'EG', 'SA');
INSERT INTO articles VALUES('A04', 'Salomon 24X+Z12', 'EG', 'SA');
INSERT INTO articles VALUES('A05', 'Salomon 24X+Z12', 'EG', 'SA');
INSERT INTO articles VALUES('A10', 'Salomon Pro Link Equipe 4S', 'PR', 'SA');
INSERT INTO articles VALUES('A11', 'Salomon Pro Link Equipe 4S', 'PR', 'SA');
INSERT INTO articles VALUES('A21', 'Salomon 3V RACE JR+L10', 'PR', 'SA');

-- lignesFic

INSERT INTO lignesFic VALUES(1001, 1, 'F05', GETDATE()-15, GETDATE()-13);
INSERT INTO lignesFic VALUES(1001, 2, 'F50', GETDATE()-15, GETDATE()-14);
INSERT INTO lignesFic VALUES(1001, 3, 'F60', GETDATE()-13, DATEADD(HH,6,GETDATE()-13));
INSERT INTO lignesFic VALUES(1002, 1, 'A03', GETDATE()-13, GETDATE()-9);
INSERT INTO lignesFic VALUES(1002, 2, 'A04', GETDATE()-12, GETDATE()-7);
INSERT INTO lignesFic VALUES(1002, 3, 'S03', GETDATE()-8, NULL);
INSERT INTO lignesFic VALUES(1003, 1, 'F50', GETDATE()-12, GETDATE()-10);
INSERT INTO lignesFic VALUES(1003, 2, 'F05', GETDATE()-12, GETDATE()-10);
INSERT INTO lignesFic VALUES(1004, 1, 'P01', GETDATE()-6, NULL);
INSERT INTO lignesFic VALUES(1005, 1, 'F05', GETDATE()-10, GETDATE()-5);
INSERT INTO lignesFic VALUES(1005, 2, 'F10', GETDATE()-5, NULL);
INSERT INTO lignesFic VALUES(1006, 1, 'S01', GETDATE()-10, GETDATE()-9);
INSERT INTO lignesFic VALUES(1006, 2, 'S02', GETDATE()-10, GETDATE()-9);
INSERT INTO lignesFic VALUES(1006, 3, 'S03', GETDATE()-10, GETDATE()-9);
INSERT INTO lignesFic VALUES(1007, 1, 'F50', GETDATE()-3, GETDATE()-2);
INSERT INTO lignesFic VALUES(1007, 2, 'F60', GETDATE()-2, NULL);
INSERT INTO lignesFic VALUES(1007, 3, 'F05', GETDATE()-3, NULL);
INSERT INTO lignesFic VALUES(1007, 4, 'S02', DEFAULT, NULL);
INSERT INTO lignesFic VALUES(1008, 1, 'S01', DEFAULT, NULL);

