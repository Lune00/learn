drop table CATEGORIES purge;

-- Création d'une table avec une colonne invisible.
create table CATEGORIES (
  NOCAT        number(3),
  DESIGNATION  varchar2(30),
  RESPONSABLE  varchar2(30) invisible
);

-- Un INSERT sans liste explicite de colonnes fonctionne
-- comme si la colonne n'existait pas.
insert into CATEGORIES
values (1,'Informatique');
-- Mais la colonne peut être explicitement mentionnée
-- dans un INSERT (ou un UPDATE).
insert into CATEGORIES (NOCAT,DESIGNATION,RESPONSABLE)
values (2,'Livres','Olivier');

-- Un SELECT * ne voit pas la colonne invisible.
select * from CATEGORIES;

-- Il faut la sélectionner explicitement pour la voir.
select NOCAT,DESIGNATION,RESPONSABLE from CATEGORIES;
