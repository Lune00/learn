use dvd_location;

-- Requetes selection :

--1. Liste des clients (Nom,Prenom,Vill)
	--SELECT nom,prenom,ville FROM clients;

--2. Liste des clients avec tous les champs(*) et triée par Ville(croissant) puis par Nom(decroissant)
	--SELECT * FROM clients ORDER BY ville ASC;
	--SELECT * FROM clients ORDER BY nom DESC;

--3. Liste des dvds(Titre,annee) avec un tri sur le titre
	--SELECT titre,annee FROM dvd ORDER BY titre ASC;

--4. Liste des réalisateurs classés du plus agé au plus jeune (*)
	--SELECT * from realisateurs ORDER BY annee_naissance ASC;

--5. Liste des clients de Loire-Atlantique (*):
	--SELECT * FROM clients WHERE code_postal LIKE '44%';

--6. Liste des Clientes dont le prénom commence par 'a' (*)
	--SELECT * FROM clients WHERE ( (prenom LIKE 'a%') AND ( (titre='Mme') OR titre='Mlle') );

--7. Liste des Clients nés pendant les années 1970(*)
	--SELECT * FROM clients WHERE ( YEAR(date_naissance) between 1970 AND 1979); 

--8. Liste des Réalisateurs anglais et américains
	--SELECT * FROM realisateurs WHERE pays='USA' OR pays='ANGLETERRE';

--9. Liste des réalisateurs américains nés au 18e siecle dont le nom contien 'a' (*)
	--SELECT * FROM realisateurs WHERE (pays='USA') AND (YEAR(annee_naissance) BETWEEN 1700 AND 1799) AND nom LIKE'%a%';

--10. Listes des dvds de moins de 2h
	--SELECT * FROM dvd WHERE duree < 120;

-- Requetes avec calculs statistiques:

--1. Nombre de cliens par titre
	--SELECT titre,COUNT(*) FROM clients GROUP BY titre;

--2. Nombre de dvd par genre de film
	--SELECT code_genre,COUNT(*) FROM dvd GROUP BY code_genre;

--3. Nombre de réalisateurs par pays du plus grand nombre au plus petit
--	SELECT pays,compteur=COUNT(*) FROM realisateurs GROUP BY pays ORDER BY compteur DESC;

--4. Nombre de DVD concernant des films des années 70 par genre
--	SELECT COUNT(*) AS 'Nombre de fims des années 70',code_genre FROM dvd
--	 WHERE ( annee between 1970 AND 1979)
--	 GROUP BY code_genre; 

--5. 
--	SELECT code_genre, AVG(*) FROM dvd GROUP BY code_genre;

--6.
--	SELECT MAX(duree),code_genre FROM dvd WHERE ( annee between 1980 AND 1989) GROUP BY code_genre;

--7.
	--SELECT COUNT(*) AS 'Nb Clients',DATEPART(mm,date_naissance) AS 'Mois de Naissance' FROM clients
	--	GROUP BY DATEPART(mm,date_naissance)
	--	ORDER BY COUNT(*) DESC;


-- Requetes multitables (jointures):

--1. Liste des dvds avec leur Titre, et la signification de leur genre
SELECT titre, signification  FROM dvd 
	INNER JOIN genres_film ON dvd.code_genre = genres_film.code_genre;

--2. Liste des dvds avec leur titre, le nom, le prenom et la nationalié du réalisateur et signification du genre
SELECT titre, realisateurs.nom, realisateurs.pays, genres_film.signification  FROM dvd 
	INNER JOIN genres_film ON dvd.code_genre = genres_film.code_genre
	INNER JOIN realisateurs ON realisateurs.code_realisateur = dvd.code_realisateur;

--3. Liste des clients avec leur nom, le prenom, ayant loué les dvd en juin 2006
SELECT clients.nom, clients.prenom,factures.date_facture  FROM clients
	INNER JOIN factures ON clients.code_client = factures.code_client
	WHERE YEAR(factures.date_facture)=2006 AND MONTH(factures.date_facture)=6;
	-- alternative plus propre au type date : WHERE DATEPART(mm,factures.date_facture) = 6  AND DATEPART(yy,..)=2006

--4. Liste des dvds loués avec leur Titre et leur durée, et l'identité du client
SELECT dvd.duree AS 'Durée (min)', clients.nom + ' ' + clients.prenom + ' ' + dvd.titre,
		realisateurs.nom + ' ' + realisateurs.prenom FROM  locations
	INNER JOIN dvd ON locations.num_dvd = dvd.num_dvd
	INNER JOIN factures ON locations.num_facture = factures.num_facture
	INNER JOIN clients ON clients.code_client = factures.code_client
	INNER JOIN realisateurs ON dvd.code_realisateur = realisateurs.code_realisateur;

--5. Liste des clients ayant loué des dvd de réalisateur allemands pendant le mois de Juin 2006
SELECT * FROM clients 
	INNER JOIN factures ON factures.code_client = clients.code_client
	INNER JOIN locations ON locations.num_facture = factures.num_facture
	INNER JOIN dvd ON locations.num_dvd = dvd.num_dvd
	INNER JOIN realisateurs ON realisateurs.code_realisateur = dvd.code_realisateur
	WHERE realisateurs.pays = 'ALLEMAGNE' AND YEAR(factures.date_facture)=2006 AND MONTH(factures.date_facture)=6;

--6. Titres des dvds d'aventure loués par des clients de sexe masculin nés dans les années 60
SELECT dvd.titre,clients.date_naissance AS 'Date de naissance du client', genres_film.signification AS 'Genre'
	FROM clients 
	INNER JOIN factures ON factures.code_client = clients.code_client
	INNER JOIN locations ON locations.num_facture = factures.num_facture
	INNER JOIN dvd ON locations.num_dvd = dvd.num_dvd
	INNER JOIN genres_film ON dvd.code_genre = genres_film.code_genre
	WHERE clients.titre = 'M.' 
		AND YEAR(clients.date_naissance) between 1960 AND 1969
		AND dvd.code_genre='AV';

--7. Nombre de dvds loués par client pour connaitre le nom du meilleur - avec TOP(1)
SELECT TOP(3)  clients.nom, clients.prenom, COUNT(locations.num_dvd) AS 'Nombre de dvd loués'
	FROM clients 
	INNER JOIN factures ON factures.code_client = clients.code_client
	INNER JOIN locations ON locations.num_facture = factures.num_facture
	GROUP BY clients.nom, clients.prenom
	ORDER BY COUNT(locations.num_dvd) DESC;

--8. S'ajouter et se retrouver par code en recherchant les clients n'ayant effectué aucune location
INSERT INTO clients
	VALUES('ALAK10','M.','Paul','Schuhmacher','Rue Morand','44000','Nantes','blablabla','1990-06-21',0);
 
 
 -- Etant donné que je fais une jointure (je veux tous les cliens y compris ceux qui n'ont pas de facture)
 -- SQL me renvoie un record de facture NULL dans le cas d'absence de facture pour un client (structurellement obligé)
 SELECT * FROM clients 
	LEFT JOIN factures ON factures.code_client = clients.code_client
	WHERE factures.code_client IS NULL;

-- Equivalent (sauf dans l'ordre de retour) par symetrie
SELECT * FROM factures
	RIGHT JOIN clients ON factures.code_client = clients.code_client
	WHERE factures.code_client IS NULL;

SELECT * FROM clients WHERE code_client NOT IN (SELECT DISTINCT code_client from factures);


-- RAPPERL SUR GROUP BY:
-- Liste de groupe: colonne1,colonne2 -> group par (colonne1 && colonne2). Par exemple 
-- GROUP BY nom,prenom regroupe que les homonymes complets (nom et prenom identiques)
SELECT  COUNT(*), nom, prenom FROM clients GROUP BY nom, prenom -- = regroupement par (nom && prenom)
	ORDER BY nom,prenom ASC;



--Déclarer une table temporaire (scope : fin de connection)
SELECT * INTO #matable FROM dvd;
--Déclarer une table persistante (existera apres fin de connection)
SELECT * INTO matable FROM dvd;
SELECT * FROM #matable;
DROP TABLE matable;