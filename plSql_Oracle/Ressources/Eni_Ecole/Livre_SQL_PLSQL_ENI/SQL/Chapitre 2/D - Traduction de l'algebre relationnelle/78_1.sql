create table cli44 as
  select nocli, nomcli
  from clients
  where code_postal between 44000 and 44999;
select * from cli44;
desc cli44
drop table cli44;
