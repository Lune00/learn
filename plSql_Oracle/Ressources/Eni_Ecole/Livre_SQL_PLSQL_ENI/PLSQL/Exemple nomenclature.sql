create table nomenclature(
  refart char(4) constraint pk_nomenclature primary key,
  designation varchar2(30),
  composant char(4) constraint fk_nomenclature_refart references nomenclature(refart),
  nombre number);

insert into nomenclature (refart, designation) values ('XX55','VELO');
insert into nomenclature  values ('X133','Roues','XX55',2);
insert into nomenclature  values ('X520','Cadre','XX55',1);
insert into nomenclature  values ('X456','Guidon','XX55',1);
insert into nomenclature (refart, designation) values ('QD24','Lot de tapis');
insert into nomenclature values ('AB03','Carpettes','QD24',10);