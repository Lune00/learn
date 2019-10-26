create table depots(
code char(2), primary key,
adresse varchar2(60));
insert into depots values ('NA','Nantes');
insert into depots values ('PA','Paris');
insert into depots values ('LY','Lyon');
commit;
select code, refart from depots, articles;