use gestion_employe;

--Jointures :
--deprecated:
--SELECT * FROM service,employe;

SELECT * FROM employe;

--now:
SELECT * FROM service CROSS JOIN employe;

--Selectionner les services avec leurs employes : Jointure sur services.PK -> employes.fk
-- La requete ne selectionne que les services qui ont des employes
SELECT * FROM service INNER JOIN employe ON service.code_service = employe.code_service;

-- LEFT JOIN : retourne tous les services avec leurs employes (meme si un service n'a pas d'employe cd condition)
SELECT * FROM service LEFT JOIN employe ON service.code_service = employe.code_service;

-- RIGHT JOIN : retourn tous les employes avec le service (meme si un employe n'en a pas)
SELECT * FROM service RIGHT JOIN employe ON service.code_service = employe.code_service;

-- Resolution de conflit ne noms d'attributs apres jointure : 
--SELECT em.code_service AS'Code service' FROM service serv
--	INNER JOIN employe em ON serv.code_service = em.code_service
--	WHERE em.code_emp = 3;

-- Multiples jointure:
SELECT  em.code_service,em.nom FROM service serv
	INNER JOIN employe em ON serv.code_service = em.code_service
	INNER JOIN conge c ON em.code_emp = c.code_emp
	WHERE em.code_emp = 3;