USE Location;
go

-- 1.	Liste des clients (nom, prénom, adresse, code postal, ville) ayant au moins une fiche de
--      location en cours.
SELECT nom, prenom, adresse, cpo, ville
FROM clients c
INNER JOIN fiches f ON c.noCli = f.noCli
WHERE etat = 'EC';

-- 2.	Détails de la fiche de location de M. Dupond Jean de Paris (avec la désignation des articles
--      loués, la date de départ et de retour)
SELECT f.noFic AS 'n° fiche', designation, depart, retour
FROM clients c
INNER JOIN fiches f ON c.noCli = f.noCli
INNER JOIN lignesFic l ON f.noFic = l.noFic
INNER JOIN articles a ON l.refart = a.refart
WHERE nom = 'Dupond' AND prenom = 'Jean' AND ville = 'Paris';
    -- avec mise en forme :
    SELECT f.noFic AS 'n° fiche', designation, CONVERT(VARCHAR,depart, 103) AS 'départ', ISNULL(CONVERT(VARCHAR,retour, 103), '-') AS 'retour'
    FROM clients c
    INNER JOIN fiches f ON c.noCli = f.noCli
    INNER JOIN lignesFic l ON f.noFic = l.noFic
    INNER JOIN articles a ON l.refart = a.refart
    WHERE nom = 'Dupond' AND prenom = 'Jean' AND ville = 'Paris';

-- 3.	Afficher tous les articles (référence, désignation et libellé de la catégorie) dont le libellé de la catégorie contient ski.
SELECT refart, designation, libelle
FROM articles a
INNER JOIN categories c ON a.codeCate = c.codeCate
WHERE libelle LIKE '%ski%';

-- 4.	Calcul du montant de chaque fiche soldée et du montant total des fiches.
SELECT SUM((DATEDIFF(DAY, depart, retour)+1)*PrixJour) total
FROM fiches f
INNER JOIN lignesFic l ON f.noFic = l.noFic
INNER JOIN articles a ON l.refart = a.refart
INNER JOIN grilleTarifs g ON a.codeCate = g.codeCate AND a.codeGam = g.codeGam
INNER JOIN tarifs t ON g.codeTarif = t.codeTarif
WHERE etat = 'SO';

    -- expert avec request imbriquée
    SELECT f.noFic [n° de fiche], SUM((DATEDIFF(DAY, depart, retour)+1)*PrixJour) [total fiche],
        (SELECT SUM((DATEDIFF(DAY, depart, retour)+1)*PrixJour) total
        FROM fiches f
        INNER JOIN lignesFic l ON f.noFic = l.noFic
        INNER JOIN articles a ON l.refart = a.refart
        INNER JOIN grilleTarifs g ON a.codeCate = g.codeCate AND a.codeGam = g.codeGam
        INNER JOIN tarifs t ON g.codeTarif = t.codeTarif
        WHERE etat = 'SO') as total
    FROM fiches f
    INNER JOIN lignesFic l ON f.noFic = l.noFic
    INNER JOIN articles a ON l.refart = a.refart
    INNER JOIN grilleTarifs g ON a.codeCate = g.codeCate AND a.codeGam = g.codeGam
    INNER JOIN tarifs t ON g.codeTarif = t.codeTarif
    WHERE etat = 'SO'
    GROUP BY f.noFic;

    -- expert avec creation d'un table temporaire
    drop table #TotalFichesSoldees;
    SELECT SUM((DATEDIFF(DAY, depart, retour)+1)*PrixJour) total
    INTO #TotalFichesSoldees
    FROM fiches f
    INNER JOIN lignesFic l ON f.noFic = l.noFic
    INNER JOIN articles a ON l.refart = a.refart
    INNER JOIN grilleTarifs g ON a.codeCate = g.codeCate AND a.codeGam = g.codeGam
    INNER JOIN tarifs t ON g.codeTarif = t.codeTarif
    WHERE etat = 'SO';

    drop table #FichesSoldees;
    SELECT f.noFic [n° de fiche], SUM((DATEDIFF(DAY, depart, retour)+1)*PrixJour) [total fiche]
    INTO #FichesSoldees
    FROM fiches f
    INNER JOIN lignesFic l ON f.noFic = l.noFic
    INNER JOIN articles a ON l.refart = a.refart
    INNER JOIN grilleTarifs g ON a.codeCate = g.codeCate AND a.codeGam = g.codeGam
    INNER JOIN tarifs t ON g.codeTarif = t.codeTarif
    WHERE etat = 'SO'
    GROUP BY f.noFic;

    SELECT * FROM
        #FichesSoldees CROSS JOIN #TotalFichesSoldees;

-- 5.	Calcul du nombre d’articles actuellement en cours de location.
SELECT COUNT(*) 'nombre d''articles en cours de location'
FROM lignesFic inner join fiches on lignesFic.noFic = fiches.noFic
WHERE retour IS NULL and etat='EC';

-- 6.	Nombre d’articles loués par client.
SELECT nom, prenom, COUNT(*) AS 'nombre de location effectuées'
FROM clients c
INNER JOIN fiches f ON c.noCli = f.noCli
INNER JOIN lignesFic l ON f.noFic = l.noFic
GROUP BY c.noCli, nom, prenom;

-- 7.	Affichage des clients qui ont effectué (ou sont en train d’effectuer) plus de 200€ de location.
SELECT nom, prenom, SUM((DATEDIFF(DAY, depart, ISNULL(retour, GETDATE()))+1)*prixJour) AS total
FROM clients c
INNER JOIN fiches f ON c.noCli = f.noCli
INNER JOIN lignesFic l ON f.noFic = l.noFic
INNER JOIN articles a ON l.refart = a.refart
INNER JOIN grilleTarifs g ON a.codeCate = g.codeCate AND a.codeGam = g.codeGam
INNER JOIN tarifs t ON g.codeTarif = t.codeTarif
GROUP BY c.noCli, nom, prenom
HAVING SUM((DATEDIFF(DAY, depart, ISNULL(retour, GETDATE()))+1)*prixJour) >= 200;

-- 8.	Liste des articles loués et le nombre de fois qu’ils ont été loués.
SELECT l.refart, designation, nbloc=COUNT(*)
FROM lignesFic l
INNER JOIN articles a ON l.refart = a.refart
GROUP BY l.refart, designation
ORDER BY nbloc DESC;

    --garder les articles non loués (jointure externe de articles vers lignesfic)
        select a.refart, designation, COUNT(l.refart)
        from articles a
            inner join gammes g on a.codeGam = g.codeGam
            left outer join lignesFic l on a.refart = l.refart
        group by a.refart, designation
    --
    select a.refart, designation, g.libelle, c.libelle, COUNT(l.refart)
        from articles a
            inner join gammes g on a.codeGam = g.codeGam
            inner join categories c on a.codeCate = c.codeCate
            left outer join lignesFic l on a.refart = l.refart
        group by a.refart, designation, g.libelle, c.libelle;
		

-- 9.	Liste des fiches (n°, nom, prénom) de moins de 150€
SELECT f.nofic, nom, prenom, total=SUM((DATEDIFF(DAY, depart, ISNULL(retour, GETDATE()))+1)*prixJour)
FROM clients c
INNER JOIN fiches f ON c.noCli = f.noCli
INNER JOIN lignesFic l ON f.noFic = l.noFic
INNER JOIN articles a ON l.refart = a.refart
INNER JOIN grilleTarifs g ON a.codeCate = g.codeCate AND a.codeGam = g.codeGam
INNER JOIN tarifs t ON g.codeTarif = t.codeTarif
GROUP BY f.noFic, nom, prenom
HAVING SUM((DATEDIFF(DAY, depart, ISNULL(retour, GETDATE()))+1)*prixJour)< 150;

-- 10.	Moyenne des recettes de 'SURF'
SELECT moyenne=AVG((DATEDIFF(DAY, depart, ISNULL(retour, GETDATE()))+1)*prixJour)
FROM lignesFic l 
INNER JOIN articles a ON l.refart = a.refart
INNER JOIN grilleTarifs g ON a.codeCate = g.codeCate AND a.codeGam = g.codeGam
INNER JOIN tarifs t ON g.codeTarif = t.codeTarif
WHERE a.codeCate = 'SURF';

-- 11.	Durée moyenne d'une location d'une paire de ski (en journées entières).
SELECT [Duree Moyenne]=AVG((DATEDIFF(DAY, depart, ISNULL(retour, GETDATE()))+1))
FROM lignesFic l 
INNER JOIN articles a ON l.refart = a.refart
INNER JOIN grilleTarifs g ON a.codeCate = g.codeCate AND a.codeGam = g.codeGam
INNER JOIN tarifs t ON g.codeTarif = t.codeTarif
WHERE a.codeCate = 'SA';