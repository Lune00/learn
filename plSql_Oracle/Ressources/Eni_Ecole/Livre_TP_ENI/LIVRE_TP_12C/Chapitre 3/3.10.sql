ALTER TABLE emprunts DROP CONSTRAINT fk_emprunts_membres;
ALTER TABLE emprunts ADD
CONSTRAINT fk_emprunts_membres 
FOREIGN KEY (membre) REFERENCES membres(numero)
INITIALLY DEFERRED;
-- le test
-- ajouter un nouveau membre
INSERT INTO membres(numero, nom, prenom, adresse, adhesion, duree, mobile)
VALUES (100,'KARLINA','Karine','48 rue Kily', sysdate,2,'0607080910');
-- ajouter une nouvelle fiche d'emprunt
INSERT INTO emprunts(numero, membre, creele)
VALUES (21, 100, sysdate);
-- valider les modifications
commit;