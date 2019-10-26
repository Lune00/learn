USE gestion_employe;

SELECT * FROM employe;


-- UPDATE : si aucune condition (WHERE) s'applique a tous les champs désignés
-- UPDATE table SET attribut = ' ' WHERE condition1 AND | OR condition2 ...
UPDATE employe SET prenom='Andrée';
UPDATE employe SET salaire=3000 where salaire=2000 AND nom='Picasso' ;


-- DELETE : si aucune condition, s'applique a tous les champs
DELETE FROM employe WHERE code_service='RESHU' AND code_chef IS NULL;
DELETE FROM employe WHERE code_service='RESHU';

UPDATE employe SET code_chef=NULL ;

SELECT * FROM employe;