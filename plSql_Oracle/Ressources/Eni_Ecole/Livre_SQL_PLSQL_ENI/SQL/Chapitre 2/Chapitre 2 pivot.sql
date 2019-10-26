create table VENTES (
  CODEPAYS  char(2),
  CODEPROD  char(4),
  ANNEE     number(4),
  MONTANT   NUMBER(8)
);
--
insert into VENTES(CODEPAYS,ANNEE,MONTANT)
values('FR',2006,1254781);
insert into VENTES(CODEPAYS,ANNEE,MONTANT)
values('FR',2007,1435278);
insert into VENTES(CODEPAYS,ANNEE,MONTANT)
values('FR',2008,1451245);
--
insert into VENTES(CODEPAYS,ANNEE,MONTANT)
values('US',2007,835789);
insert into VENTES(CODEPAYS,ANNEE,MONTANT)
values('US',2008,1236745);
--
insert into VENTES(CODEPAYS,ANNEE,MONTANT)
values('IT',2006,1004852);
insert into VENTES(CODEPAYS,ANNEE,MONTANT)
values('IT',2007,986354);
insert into VENTES(CODEPAYS,ANNEE,MONTANT)
values('IT',2008,1034572);

desc VENTES

select ANNEE,CODEPAYS,sum(MONTANT) 
from VENTES
group by ANNEE,CODEPAYS
order by ANNEE,CODEPAYS;

select * from (
   select ANNEE,CODEPAYS,MONTANT
   from VENTES
)
pivot 
(
   sum(MONTANT)
   for CODEPAYS in ('FR','US','IT')
)
order by ANNEE;

select * from (
   select ANNEE,CODEPAYS,MONTANT
   from VENTES
)
pivot 
(
   sum(MONTANT)
   for CODEPAYS in ('FR' AS FRANCE,'US' AS USA,'IT' AS ITALIE)
)
order by ANNEE;

create table VENTES_MATRICE AS
select * from (
   select ANNEE,CODEPAYS,MONTANT
   from VENTES
)
pivot 
(
   sum(MONTANT)
   for CODEPAYS in ('FR' AS FRANCE,'US' AS USA,'IT' AS ITALIE)
)
order by ANNEE;

drop table VENTES purge;
rename VENTES_MATRICE to VENTES;

desc VENTES

select * from VENTES;

select * from VENTES
unpivot
(
  MONTANT
  for CODEPAYS in (FRANCE,USA,ITALIE)
)
order by ANNEE,CODEPAYS;

select * from VENTES
unpivot include nulls
(
  MONTANT
  for CODEPAYS in (FRANCE,USA,ITALIE)
)
order by ANNEE,CODEPAYS;

drop table VENTES purge;
