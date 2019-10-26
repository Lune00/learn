
-- 1) Supprimer le client « boutaud sabine »
DELETE FROM clients WHERE nom='boutaud' AND prenom='sabine';
DELETE FROM clients WHERE noCli=14;

-- 2) Supprimer toutes les fiches avec une date de payée non renseignée
DELETE FROM fiches WHERE datePaye IS NULL;
DELETE FROM fiches WHERE etat <> 'SO';

-- 3) Supprimer les articles avec le codeGam EG
DELETE FROM articles WHERE codeGam = 'EG';

-- 4) Vite le fisc. arrive! Supprimer la totalité des clients!
DELETE FROM clients;

-- 5) Observer la table FICHE : pourquoi?
SELECT * FROM fiches;