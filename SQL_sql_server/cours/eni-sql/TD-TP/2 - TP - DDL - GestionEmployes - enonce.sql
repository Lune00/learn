delete from employe;
delete from "service";

insert into service values ('RESHU','Ressources humaines')

-- 1 employé (un peu de procédural, déclaration de variables)
DECLARE @myid int
SET @myid = 1

insert into employe (code_emp,nom,prenom,date_embauche,salaire,code_service,code_chef)
	values (@myid,'Raimbaud','Arthur','25/01/2012',3500.20,'RESHU',null)
-- ses congés
insert into conge values (@myid,2013,default)

-- son détail pour l'année
insert into conge_mens values (@myid,2013,1,5)
insert into conge_mens values (@myid,2013,5,5)
insert into conge_mens values (@myid,2013,7,15)
insert into conge_mens values (@myid,2013,12,5)

--Completer le jeu d'essai
insert into service values ('DIRGE','Direction Générale')
insert into service values ('INFOR','Informatique')
insert into service values ('COMPT','Comptabilité')
insert into service values ('ACHAT','Achat')
insert into service values ('TECHN','Technique')

--Raimbaud (suite)
insert into conge values (@myid,2014,default)
insert into conge_mens values (@myid,2014,1,5)
insert into conge_mens values (@myid,2014,7,10)
insert into conge_mens values (@myid,2014,8,10)
insert into conge_mens values (@myid,2014,12,2)

insert into conge values (@myid,2015,default)
insert into conge_mens values (@myid,2015,1,2)
insert into conge_mens values (@myid,2015,3,2)
insert into conge_mens values (@myid,2015,7,3)
insert into conge_mens values (@myid,2015,8,20)
insert into conge_mens values (@myid,2015,12,3)

insert into conge values (@myid,2016,35)
insert into conge_mens values (@myid,2016,1,2)
insert into conge_mens values (@myid,2016,4,5)
insert into conge_mens values (@myid,2016,6,10)

SET @myid = @myid + 1;
insert into employe (code_emp,nom,prenom,date_embauche,salaire,code_service,code_chef)
	values (@myid,'Picasso',null,'12/03/2015',2000,'RESHU',null);
insert into conge values (@myid,2016,20)
insert into conge_mens values (@myid,2016,4,1)
insert into conge_mens values (@myid,2016,8,10)

SET @myid = @myid + 1;
insert into employe (code_emp,nom,prenom,date_embauche,salaire,code_service,code_chef)
	values (@myid,'BigBoss',null,'01/01/2012',5000,'DIRGE',null);
insert into conge values (@myid,2013,30)
insert into conge_mens values (@myid,2013,2,10)
insert into conge_mens values (@myid,2013,8,20)
insert into conge values (@myid,2014,30)
insert into conge_mens values (@myid,2014,1,5)
insert into conge_mens values (@myid,2014,8,20)
insert into conge_mens values (@myid,2014,12,5)
insert into conge values (@myid,2015,30)
insert into conge_mens values (@myid,2015,6,30)
insert into conge values (@myid,2016,30)
insert into conge_mens values (@myid,2016,2,10)
insert into conge_mens values (@myid,2016,9,10)

SET @myid = @myid + 1;
insert into employe (code_emp,nom,prenom,date_embauche,salaire,code_service,code_chef)
	values (@myid,'Michel',null,'01/09/2015',2500,'INFOR',null);
insert into conge values (@myid,2016,10)
insert into conge_mens values (@myid,2016,8,5)

SET @myid = @myid + 1;
insert into employe (code_emp,nom,prenom,date_embauche,salaire,code_service,code_chef)
	values (@myid,'Regis',null,'01/10/2015',2000,'INFOR',null);
insert into conge values (@myid,2016,8)
insert into conge_mens values (@myid,2016,8,5)


update employe set code_chef = (select code_emp from employe where upper(nom) like 'BIGBOSS')
	where upper(nom) in ('MICHEL','RAIMBAUD')
update employe set code_chef = (select code_emp from employe where upper(nom) like 'MICHEL')
	where upper(nom) in ('REGIS')
update employe set code_chef = (select code_emp from employe where upper(nom) like 'RAIMBAUD')
	where upper(nom) in ('PICASSO')

