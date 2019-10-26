-- tests sur les clés primaires

INSERT INTO clients VALUES(9, 'Moustard', 'Robert', 'Rue des hortensias', '44800', 'Saint-Herblain');
INSERT INTO fiches VALUES(1007, 14, GETDATE(), NULL, 'EC');
INSERT INTO lignesFic VALUES(1002, 3, 'A21', GETDATE(), NULL);
INSERT INTO articles VALUES('F64', 'Fischer RCS CARBOLITE Skating', 'PR', 'FOP');
INSERT INTO grilleTarifs VALUES('EG', 'FOA', 'T2');
INSERT INTO tarifs VALUES('T3', 'Moyen', 23);
INSERT INTO categories VALUES('PA', 'Patin à galce');
INSERT INTO gammes VALUES('EG', 'Bas de gamme');

-- tests sur les contraintes d'intégrité référentielle (clés étrangères)

INSERT INTO fiches VALUES(1009, 10, GETDATE(), NULL, 'EC');
INSERT INTO lignesFic VALUES(1009, 1, 'A11', GETDATE()-2, NULL);
INSERT INTO lignesFic VALUES(1008, 2, 'A99', GETDATE()-2, NULL);
INSERT INTO articles VALUES('M99', 'Monoski Dynamic', 'PR', 'MONO');
INSERT INTO grilleTarifs VALUES('BG', 'SA', 'T1');
INSERT INTO grilleTarifs VALUES('EG', 'SKI', 'T1');
INSERT INTO grilleTarifs VALUES('HG', 'MONO', 'T0');

-- tests sur les contraintes d'unicité

INSERT INTO gammes VALUES('MP', 'Matériel Professionnel');
INSERT INTO categories VALUES('SU', 'Surf');
INSERT INTO tarifs VALUES('T7', 'Platine', 120);

-- tests sur les contraintes de vérification

INSERT INTO clients VALUES(19, 'DIRSTEL', 'Christelle', 'Rue Jean Meyer', '999', 'Sélestat');
INSERT INTO clients VALUES(19, 'DIRSTEL', 'Christelle', 'Rue Jean Meyer', '96000', 'Sélestat');
INSERT INTO fiches VALUES(1009, 1, GETDATE(), NULL, 'AA');
INSERT INTO tarifs VALUES('T0', 'Promo', -10);
INSERT INTO fiches VALUES(1009, 1, GETDATE(), GETDATE()-2, 'SO');
INSERT INTO lignesFic VALUES(1008, 2, 'P11', GETDATE(), GETDATE()-2);

-- test sur la non nullité

INSERT INTO articles VALUES('F99', 'Fischer Cruiser', 'EG', NULL);
INSERT INTO articles VALUES('F99', 'Fischer Cruiser', NULL, 'FOA');
INSERT INTO grilleTarifs VALUES('HG', 'MONO', NULL);
INSERT INTO clients VALUES(20, 'Schneider', 'Raymond', 'Route du Rhin', NULL, 'Illkirch-Graffenstaden');
INSERT INTO fiches VALUES(1009, 6, NULL, NULL, 'EC');
INSERT INTO lignesFic VALUES(1008, 2, 'A01', NULL, NULL);
INSERT INTO articles VALUES('A22', NULL, 'PR', 'SA');
INSERT INTO fiches VALUES(1009, 6, GETDATE(), NULL, NULL);
INSERT INTO gammes VALUES('OC', NULL);
INSERT INTO categories VALUES('BA', NULL);
INSERT INTO tarifs VALUES('T0', NULL, 5);
INSERT INTO fiches VALUES(1009, NULL, GETDATE(), NULL, 'EC');
INSERT INTO clients VALUES(20, NULL, 'Raymond', 'Route du Rhin', '67400', 'Illkirch-Graffenstaden');
INSERT INTO tarifs VALUES('T0', 'PROMO', NULL);
INSERT INTO lignesFic VALUES(1008, 2, NULL, GETDATE(), NULL);
INSERT INTO clients VALUES(20, 'Schneider', 'Raymond', 'Route du Rhin', '67400', NULL);