-- Classement individuel à l'issue du prologue
SELECT coureurs.*
FROM resultats INNER JOIN coureurs  ON resultats.coureur=coureurs.dossard
INNER JOIN etapes ON etapes.code = RESULTATS.ETAPE
WHERE jour = (select MIN(jour) from ETAPES)
order by temps ASC;
-- combien y a-t-il de coureurs par équipe ?
select code, count(dossard) from equipes LEFT OUTER join coureurs on equipes.code = coureurs.equipe group by code;
-- quel est le meilleur temps réalisé pour chaque étape ayant une distance comprise entre 5 et 50 km ?
select MIN(TO_CHAR(temps,'HH:MI:SS')) ,etape from resultats where etape IN (select code from etapes where distance between 5 and 50) group by etape
--quels sont les coureurs qui n'ont pas de résultats ?
select * from coureurs left outer join  resultats on coureurs.dossard = resultats.coureur WHERE etape IS NULL
-- le nombre de nationalités différentes par équipe
SELECT count(distinct coureurs.nationalite) ,equipe  from equipes inner join coureurs on equipes.code = coureurs.equipe group by equipe

-- Fonction pour extraire le temps de parcours en seconde
CREATE OR REPLACE FUNCTION tempsEnSeconde(vtemps in date) return number IS
 vnombreSecondes number(6);
BEGIN
  vnombreSecondes:=to_char(vtemps,'HH24')*3600+
	to_char(vtemps,'MI')*60+
	to_char(vtemps,'SS');
  RETURN vnombreSecondes;
END;
/

-- Fonction pour convertir un temps en secondes vers une chaine de caractère Heurs:minuyes:secondes
CREATE OR REPLACE FUNCTION tempsHHMISS(vsecondes in number) return CHAR IS
  vseconde number;
  vheure number:=0;
  vminute number:=0;
  vretour varchar(200);
BEGIN
  vseconde:=vsecondes;
  while (vseconde>=3600) loop
    vheure:=vheure+1;
    vseconde:=vseconde-3600;
  end loop;
  while (vseconde>=60) loop
    vminute:=vminute+1;
    vseconde:=vseconde-60;
  end loop;
  vretour:=vheure||':'||vminute||':'||vseconde;
  return vretour;
END;
/
-- Liste des disqualifiés
select dossard
from coureurs
where dossard not in (
	select coureur
		from resultats
		where etape=(select code FROM ETAPES where jour = (SELECT MAX(jour) FROM ETAPES))
  );
-- Classement général individuel
SELECT coureurs.dossard, coureurs.nom
  FROM  resultats INNER JOIN coureurs
  ON resultats.coureur=coureurs.dossard
    WHERE coureurs.dossard NOT IN(select dossard
	from coureurs
	where dossard not in (
		select coureur
			from resultats
			where etape=(select code FROM ETAPES where jour = (SELECT MAX(jour) FROM ETAPES))))
GROUP BY coureurs.dossard, coureurs.nom
ORDER BY sum(tempsEnSeconde(temps)) ASC;


-- Classement général par équipe
SELECT coureurs.equipe
FROM resultats INNER JOIN coureurs
ON resultats.coureur=coureurs.dossard
GROUP BY coureurs.equipe
ORDER BY sum(tempsEnSeconde(temps)) ASC;

-- La "lanterne rouge"
SELECT coureurs.dossard, coureurs.nom
  FROM  resultats INNER JOIN coureurs
  ON resultats.coureur=coureurs.dossard
    WHERE coureurs.dossard NOT IN(select dossard
		from coureurs
		where dossard not in (
			select coureur
				from resultats
				where etape=(select code FROM ETAPES where jour = (SELECT MAX(jour) FROM ETAPES))))
GROUP BY coureurs.dossard, coureurs.nom
ORDER BY sum(tempsEnSeconde(temps)) DESC;
