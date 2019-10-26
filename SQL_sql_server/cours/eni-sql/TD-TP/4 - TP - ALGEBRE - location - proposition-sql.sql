-- a --
SELECT *
FROM clients
WHERE nom LIKE 'D%';

-- b --
SELECT nom, prenom
FROM clients;

-- c --
SELECT noFic, etat, nom, prenom
FROM clients c INNER JOIN fiches f ON c.noCli = f.noCli
WHERE convert(integer,cpo) IN (44000, 44100, 44200, 44300);

SELECT noFic, etat, nom, prenom
FROM clients c INNER JOIN fiches f ON c.noCli = f.noCli
WHERE cpo like '44%';

-- d --
SELECT	l.noFic [numéro de fiche],
		nom,
		prenom AS 'prénom',
		l.refart 'référence',
		designation [désignation],
		CONVERT(VARCHAR, depart, 103) 'départ',
		ISNULL(CONVERT(VARCHAR, retour, 103), '-') retour,
		prixJour AS [prix par jour],
		montant=prixJour*(DATEDIFF("DD", depart, ISNULL(retour, GETDATE()))+1)
FROM fiches f
	INNER JOIN clients c ON f.noCli = c.noCli
	INNER JOIN lignesFic l ON f.noFic = l.noFic
	INNER JOIN articles a ON l.refart = a.refart
	INNER JOIN grilleTarifs g ON a.codeCate = g.codeCate AND a.codeGam = g.codeGam
	INNER JOIN tarifs t	ON g.codeTarif = t.codeTarif
WHERE l.noFic = 1006;

-- e --

SELECT g.libelle AS Gamme, AVG(prixJour) [tarif journalier moyen]
FROM gammes g
INNER JOIN grilleTarifs gt ON g.codeGam = gt.codeGam
INNER JOIN tarifs t ON gt.codeTarif = t.codeTarif
GROUP BY g.libelle;


-- f --
SELECT l.refart, designation, COUNT(*) AS [nombre de locations]
FROM articles a
INNER JOIN lignesFic l ON l.refart = a.refart
GROUP BY l.refart, designation
HAVING COUNT(*)>=3;

-- g --
DROP TABLE #T1;
SELECT	l.noFic [numéro de fiche],
		SUM((DATEDIFF(DAY, depart, ISNULL(retour, GETDATE()))+1)*prixJour) as total
INTO #T1
FROM lignesFic l 
	INNER JOIN articles a ON l.refart = a.refart
	INNER JOIN grilleTarifs g ON a.codeCate = g.codeCate AND a.codeGam = g.codeGam
	INNER JOIN tarifs t	ON g.codeTarif = t.codeTarif
WHERE l.noFic = 1006
GROUP BY l.noFic;

SELECT	l.noFic [numéro de fiche],
		nom,
		prenom AS 'prénom',
		l.refart 'référence',
		designation [désignation],
		CONVERT(VARCHAR, depart, 103) 'départ',
		ISNULL(CONVERT(VARCHAR, retour, 103), '-') retour,
		prixJour AS [prix par jour],
		(DATEDIFF(DAY, depart, ISNULL(retour, GETDATE()))+1)*prixJour as montant,
		total		
FROM fiches f
	INNER JOIN clients c ON f.noCli = c.noCli
	INNER JOIN lignesFic l ON f.noFic = l.noFic
	INNER JOIN articles a ON l.refart = a.refart
	INNER JOIN grilleTarifs g ON a.codeCate = g.codeCate AND a.codeGam = g.codeGam
	INNER JOIN tarifs t	ON g.codeTarif = t.codeTarif
	CROSS JOIN #T1
WHERE l.noFic = 1006;

-- h --
SELECT c.libelle [Catégorie], g.libelle Gamme, t.libelle AS 'Nom du tarif', prixJour AS [Prix à la journée]
FROM grilleTarifs gt
INNER JOIN gammes g ON gt.codeGam = g.codeGam
INNER JOIN categories c ON gt.codeCate = c.codeCate
INNER JOIN tarifs t ON gt.codeTarif = t.codeTarif;

-- i --
SELECT *
FROM (
	SELECT DISTINCT l.refart 'référence',  designation 'désignation'
	FROM categories c
	INNER JOIN articles a ON c.codeCate = a.codeCate
	INNER JOIN lignesFic l ON a.refart = l.refart
	WHERE libelle = 'SURF'
) i1
CROSS JOIN
(
	SELECT COUNT(*) AS 'nombre de locations'
	FROM categories c
	INNER JOIN articles a ON c.codeCate = a.codeCate
	INNER JOIN lignesFic l ON a.refart = l.refart
	WHERE libelle = 'SURF'
) i2;

-- j --
SELECT AVG(nbloc) AS 'nombre d''articles loués en moyenne par fiche'
FROM (
	SELECT CONVERT(NUMERIC, COUNT(*)) nbloc
	FROM lignesFic
	GROUP BY noFic
) e;

-- k --
SELECT libelle 'catégorie', COUNT(*) 'nombre de location'
FROM lignesFic l
INNER JOIN articles a ON l.refart = a.refart
INNER JOIN categories c ON a.codeCate = c.codeCate
WHERE libelle IN ('Ski Alpin', 'Surf', 'Patinette')
GROUP BY libelle;

-- l --
SELECT CONVERT(NUMERIC(8,2),AVG(montant)) 'montant moyen d''une fiche de location'
FROM (
	SELECT montant=SUM((DATEDIFF(DAY, depart, ISNULL(retour, GETDATE()))+1)*prixJour)
	FROM lignesFic l
	INNER JOIN articles a ON l.refart = a.refart
	INNER JOIN grilleTarifs g ON a.codeCate = g.codeCate AND a.codeGam = g.codeGam
	INNER JOIN tarifs t ON g.codeTarif = t.codeTarif
	GROUP BY noFic
) a;