
-- quelle est la distance totale parcourue sur le tour ?
SELECT sum(distance) as distanceTotale FROM etapes;
--combien y a-t-il eu d'étapes qui se sont déroulées un dimanche ?
SELECT COUNT(*)  as nbetapes FROM etapes WHERE LOWER(TO_CHar(jour,'DAY'))  = 'dimanche';
-- Classement par équipe pour l'étape du 04/07
SELECT coureurs.equipe,SUM(to_char(temps,'HH24')*3600+	to_char(temps,'MI')*60+	to_char(temps,'SS'))as tempsEquipe 
FROM resultats INNER JOIN coureurs ON resultats.coureur=coureurs.dossard INNER JOIN ETAPES ON RESULTATS.ETAPE = ETAPES.code
WHERE To_CHAR(jour,'DD')='04' AND TO_CHAR(jour,'MM') = '07'
GROUP BY coureurs.equipe
ORDER BY 2 ASC;