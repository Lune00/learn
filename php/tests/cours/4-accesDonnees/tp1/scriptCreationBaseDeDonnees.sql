use tp;
CREATE TABLE `proprietaires` (
`id_pers` mediumint(8) unsigned NOT NULL auto_increment,
`nom` varchar(30) NOT NULL default '',
`prenom` varchar(30) NOT NULL default '',
`adresse` varchar(50) NOT NULL default '',
`ville` varchar(40) NOT NULL default '',
`codepostal` mediumint(5) unsigned NOT NULL default '0',
PRIMARY KEY (`id_pers`));

CREATE TABLE `cartesgrises` (
`id_pers` mediumint(8) unsigned NOT NULL default '0',
`immat` varchar(7) NOT NULL default '',
`datecarte` date NOT NULL,
PRIMARY KEY (`id_pers`,`immat`));

CREATE TABLE `voitures` (
`immat` varchar(7) NOT NULL default '',
`id_modele` varchar(10) NOT NULL default '',
`couleur` enum('CL','MO','FO') NOT NULL default 'CL',
`datevoiture` date NOT NULL,
PRIMARY KEY (`immat`));

CREATE TABLE `modeles` (
`id_modele` varchar(10) NOT NULL default '',
`marque` varchar(30) NOT NULL default '',
`modele` varchar(30) NOT NULL default '',
`carburant` enum('essence','diesel','gpl','electrique') NOT NULL
default 'essence',
PRIMARY KEY (`id_modele`));

INSERT INTO modeles(id_modele, marque, modele) VALUES('REN_MEG_ES', 'Renault', 'Mégane');
INSERT INTO modeles(id_modele, marque, modele) VALUES('POR_911_ES', 'Porsche', '911 GT3 Cup');
INSERT INTO modeles VALUES('TESLA_S_EL', 'Tesla', 'Model S', 'electrique');

INSERT INTO voitures VALUES('AB123CD', 'REN_MEG_ES', 'MO', '1996-01-31');
INSERT INTO voitures VALUES('AB987BA', 'POR_911_ES', DEFAULT, '2018-03-15');

INSERT INTO proprietaires(nom, prenom, adresse, ville, codepostal) VALUES('MARTIN', 'Julie', '34 rue de la plage', 'Plougrescant', 22820);
INSERT INTO proprietaires(nom, prenom, adresse, ville, codepostal) VALUES('LEGALL', 'Erwan', '142 boulevard Gambetta', 'Brest', 29200);
