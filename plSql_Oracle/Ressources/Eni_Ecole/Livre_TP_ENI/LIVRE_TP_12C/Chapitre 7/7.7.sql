CREATE OR REPLACE VIEW disqualifies AS
  SELECT dossard
	FROM coureurs
	WHERE dossard NOT IN (
		SELECT coureur
		FROM resultats
		WHERE etape=(select code FROM ETAPES where jour = (SELECT MAX(jour) FROM ETAPES))
	);

	
CREATE OR REPLACE VIEW jaune AS
SELECT coureurs.dossard, coureurs.nom,sum(tempsEnSeconde(temps)) as temps
  FROM  resultats INNER JOIN coureurs
  ON resultats.coureur=coureurs.dossard
    WHERE coureurs.dossard NOT IN(SELECT * FROM disqualifies)
  GROUP BY coureurs.dossard, coureurs.nom
  ORDER BY 3 ASC;


CREATE OR REPLACE VIEW pois AS
  SELECT coureurs.dossard, coureurs.nom, sum(points) as points
    FROM resultats INNER JOIN coureurs
    ON resultats.coureur=coureurs.dossard
    WHERE coureurs.dossard NOT IN(SELECT * FROM disqualifies)
    GROUP BY coureurs.dossard, coureurs.nom
	ORDER BY 3 DESC;

CREATE OR REPLACE VIEW vert AS
  SELECT coureurs.dossard, coureurs.nom, sum(bonification) as bonification
    FROM resultats INNER JOIN coureurs
    ON resultats.coureur=coureurs.dossard
    WHERE coureurs.dossard NOT IN(SELECT * FROM disqualifies)
    GROUP BY coureurs.dossard, coureurs.nom
	ORDER BY 3 DESC;



