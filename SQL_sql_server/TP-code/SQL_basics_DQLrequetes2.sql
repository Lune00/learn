--DQL : 

USE gestion_employe;

--	SELECT * from employe;

-- Demander une liste d'attributs
--	SELECT prenom,nom FROM employe;

--AS : alias, juste parametrer la présentation
--	SELECT prenom AS 'Prénom', nom FROM employe;

-- Trier resulat de la requete dans un certain ordre avec ORDER BY name_attribute ASC|DESC (ascendant ou descendant)
--	SELECT prenom AS 'Prénom', nom FROM employe ORDER BY date_embauche ASC;

-- Rechercher tous les noms qui commencent par R avec 'R%'. Le % est quiv a \* en bash, echappe les caracteres.
-- ex: 'B%s' commence , par B et finit par s
--	SELECT * FROM employe WHERE nom LIKE 'D%' OR nom NOT LIKE 'D%' ORDER BY date_embauche ASC;

-- DISTINCT : retourne seulement les champs distincts les uns des autres
--SELECT code_service FROM employe;
--SELECT DISTINCT code_service FROM employe;
--SELECT * FROM employe;
--SELECT DISTINCT code_service,nom FROM employe;

-- Calcul dans une requete :
--	SELECT nom, (1*1) AS 'Salairex10' from employe;

-- Faire la moyenne des champs d'un attribut: AVG(attribut)
--	SELECT AVG(salaire) FROM employe;

--UPDATE employe SET salaire=200 WHERE code_emp=11;

-- Faire la moyenne (calcul sur toute la table) sur un group avec GROUP BY . Moyenne sur tous les gens du meme nom ici
SELECT nom,AVG(salaire) FROM employe GROUP BY nom;

-- COUNT(code_emp) : compte le nombre de code_emp dans le groupe qui a le meme nom. COUNT le nombre d'element figurant
-- un groupe.
SELECT COUNT(code_emp),nom, AVG(salaire), SUM(salaire) 
	FROM employe 
	GROUP BY nom;

SELECT nom, MAX(salaire) FROM employe WHERE code_service='INFOR' GROUP BY nom;

SELECT GETDATE();