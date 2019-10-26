-- Lister les articles
SELECT * FROM articles;

-- 1) Modifier la désignation du premier article en « Ecran Samsung »
UPDATE articles SET designation='Ecran Sam' WHERE refart='A01';

-- 2) Les articles avec le codeGam EG doivent être au format « EG désignation »
UPDATE articles SET designation = codeGam + '-' + designation WHERE codeGam='EG';

-- 3) Modifier le codeGam EG en ER d’une gamme <-- IMPOSSIBLE ICI.
UPDATE gammes SET codeGam='ER' WHERE codeGam='EG';
