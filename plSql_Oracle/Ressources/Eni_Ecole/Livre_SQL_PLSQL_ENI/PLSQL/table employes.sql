create table employes (
numero number(3) constraint pk_emp primary key,
nom varchar2(30),
age number(2),
salaire number(7,2));
insert into employes values (1,'Marie',53,3500);
insert into employes values (2,'Paul',28,1200);
insert into employes values (4,'Jean',35,2300);
insert into employes values (7,'Luc',41,1800);
insert into employes values (5,'Anne',25,1100);
commit;
