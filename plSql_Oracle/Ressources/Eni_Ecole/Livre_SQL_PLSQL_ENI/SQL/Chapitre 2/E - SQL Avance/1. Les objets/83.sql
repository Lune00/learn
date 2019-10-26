create or replace view v_cli44 as
  select nocli, nomcli, code_postal, ville
  from clients
  where code_postal between 44000 and 44999
  with check option;

select nocli, substr(nomcli,1,12), code_postal, substr(ville,1,12)
  from v_cli44;

insert into v_cli44 values (255,'ALAMBERT S.A.',22000,'ST BRIEUC');
insert into v_cli44 values (176,'Ets GAZONAV'  ,44500,'ST NAZAIRE');

select nocli, substr(nomcli,1,12), code_postal, substr(ville,1,12)
  from v_cli44;

select nocli, substr(nomcli,1,12), code_postal, substr(ville,1,12)
  from clients;
