-- Création d'une table (simplifiée !) d'employés.
create table EMPLOYES (
numero number(3) generated as identity,
nom varchar2(30));
insert into EMPLOYES(nom) values ('Olivier');
insert into EMPLOYES(nom) values ('Valérie');
insert into EMPLOYES(nom) values ('David');
insert into EMPLOYES(nom) values ('Thomas');
insert into EMPLOYES(nom) values ('Anne');
insert into EMPLOYES(nom) values ('Philippe');
insert into EMPLOYES(nom) values ('Marie');
insert into EMPLOYES(nom) values ('Paul');
insert into EMPLOYES(nom) values ('Jean');
insert into EMPLOYES(nom) values ('Luc');
commit;
select * from EMPLOYES;

-- Sélection des 5 "premiers" employés
-- (classement sur le numéro de l'employé).
select * from EMPLOYES
order by NUMERO
fetch first 5 rows only;

-- Sélection des 5 employés suivants.
select * from EMPLOYES
order by NUMERO
offset 5 rows fetch next 5 rows only;

-- Sélection de 20% des employés
-- (classement sur le nom de l'employé).
select * from EMPLOYES
order by NOM
fetch first 20 percent rows only;

-- Avant la version 12

-- Sélection des 5 "premiers" employés
-- (classement sur le numéro de l'employé).
select
  NUMERO,
  NOM
from
  (
  select
    e.*,
    row_number() over(order by e.NUMERO) r
  from 
    EMPLOYES e
  )
where 
  r <= 5;
  
-- Sélection des 5 employés suivants.
select
  NUMERO,
  NOM
from
  (
  select
    e.*,
    row_number() over(order by e.NUMERO) r
  from 
    EMPLOYES e
  )
where 
  r <= 10
  AND r > 5;
