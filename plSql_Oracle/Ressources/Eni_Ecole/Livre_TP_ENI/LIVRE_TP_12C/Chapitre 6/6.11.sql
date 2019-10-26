DROP TRIGGER bf_ins_emprunts;
DROP TRIGGER af_ins_emprunts;

CREATE OR REPLACE TRIGGER tr_ins_emprunts
  FOR INSERT 
  ON emprunts
  COMPOUND TRIGGER
  Vfinvalidite date ;
  BEFORE EACH ROW IS
	BEGIN
		-- récupérer le nom de l’utilisateur Oracle
		:new.ajoutePar :=user() ;
		-- récupérer la date et heure courante du serveur
		:new.ajouteLe :=sysdate() ;
	END BEFORE EACH ROW;
  AFTER EACH ROW IS
	BEGIN
		-- calcul de la date de fin de validité d’un adhesion
		SELECT adhesion INTO vfinvalidite
		FROM membres
		WHERE numero= :new.membre ;
		-- comparer la date de fin de validité avec la date du jour
		IF (vfinvalidite<sysdate) THEN
		  -- lever une exception 
		  RAISE_APPLICATION_ERROR(-20200,'Adhesion non valide') ;
		END IF;
	END AFTER EACH ROW;
END;


