-- Liste des coureurs par équipe puis triés par nom
SELECT equipes.nom, coureurs.dossard, coureurs.nom, coureurs.prenom
FROM coureurs INNER JOIN equipes ON coureurs.equipe=equipes.code
order by equipes.code desc,coureurs.nom asc;
-- Liste de tous les coureurs de nationalité Française
SELECT *
FROM coureurs
WHERE nationalite='FRA';
-- Liste de tous les coureurs de nationalité française ou faisant partie d'une équipe de nationnalité française
SELECT coureurs.*
FROM coureurs INNER JOIN equipes ON coureurs.equipe=equipes.code
WHERE coureurs.nationalite='FRA' OR equipes.nationalite='FRA';
