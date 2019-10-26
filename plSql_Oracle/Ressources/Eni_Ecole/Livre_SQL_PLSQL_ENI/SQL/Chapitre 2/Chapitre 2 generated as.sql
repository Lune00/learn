drop table ARTICLES purge;

create table ARTICLES (
  REFART       char(4) primary key,
  DESIGNATION  varchar2(30),
  PRIXHT       number(8,2),
  TAUXTVA      number(4,2),
  PRIXTTC      number(8,2) 
    AS ( PRIXHT + round(PRIXHT * TAUXTVA/100,2) )
);

insert into ARTICLES (REFART,DESIGNATION,PRIXHT,TAUXTVA)
values ('XT10','Lot de 10 crayons',10,19.6);
insert into ARTICLES (REFART,DESIGNATION,PRIXHT,TAUXTVA)
values ('RI23','Les Trois Mousquetaires',10,5.5);

select DESIGNATION,PRIXHT,PRIXTTC from ARTICLES;

