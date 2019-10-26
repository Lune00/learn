USE location;
GO

--SELECT * FROM client;
--SELECT * FROM ligne_fiche;

--DELETE FROM client WHERE no_client=14;

--SELECT * FROM client;
--SELECT * FROM ligne_fiche;


--SELECT * FROM article;
--UPDATE article SET designation='Ecran Samsung' WHERE refart='F01';
--SELECT * FROM article;

--UPDATE article SET designation='EG - ' + designation WHERE code_gam='EG';
--SELECT * FROM article;

SELECT * from grille_tarifs;
SELECT * from gamme;

--Pour modifier une clef primaire il faut que toutes les references vers cette clef(les FK) soit en mode ON UPDATE CASCADE
-- On  ne peut pas ajouter ON DELETE CASCADE a une contrainte avec ALTER, on doit d'abord la DROP et la refaire avec ADD

--Pas recommandé !! Ou alors seulement du coté DBA !!
ALTER TABLE grille_tarifs DROP CONSTRAINT fk_grille_tarifs_code_gam;
ALTER TABLE grille_tarifs ADD CONSTRAINT fk_grille_tarifs_code_gam_2 FOREIGN KEY(code_gam) 
	REFERENCES gamme(code_gam) ON UPDATE CASCADE;


ALTER TABLE article DROP CONSTRAINT fk_article;
ALTER TABLE article ADD CONSTRAINT fk_article FOREIGN KEY(code_gam) 
	REFERENCES gamme(code_gam) ON UPDATE CASCADE;


UPDATE gamme SET code_gam='ER' WHERE code_gam='EG';