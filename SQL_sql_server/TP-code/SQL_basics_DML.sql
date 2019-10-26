-- Inserer un service
INSERT INTO gestion_employe.dbo.service(libelle, code_service) VALUES('za','monco');

SELECT * FROM gestion_employe.dbo."service";

SELECT * FROM employe;

-- Inserer un employe
INSERT INTO employe( code_emp , nom , prenom, date_embauche, salaire, code_service , code_chef )
			 VALUES( 6 , 'Jean-Michel', null , '22/03/2019' , 2500,  'COMPT' , 1 ) ;

-- Est ce qu'il ne pourrait pas nous generer un code_emp basée sur l'index ou que sais je ? pas manuel
-- Ne pas externaliser la generation de clef

--Declaration de variable

DECLARE @myid INT;
SET @myid = 11 ;


INSERT INTO employe(code_emp, nom , date_embauche, salaire, code_service , code_chef )
			 VALUES(@myid, 'Jean-Michel' , GETDATE() , 2500,  'COMPT' , 1 ) ;