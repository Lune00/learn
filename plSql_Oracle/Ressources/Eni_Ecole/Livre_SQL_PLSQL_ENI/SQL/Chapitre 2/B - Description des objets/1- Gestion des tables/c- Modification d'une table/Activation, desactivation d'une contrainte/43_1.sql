alter table CLIENTS
disable constraint CLIENTS_CODE_POSTAL_CK;

insert into clients (nocli, nomcli,code_postal, ville) 
values (150,'MARTIN Jean',999,'MURUROA');

alter table CLIENTS
enable validate constraint CLIENTS_CODE_POSTAL_CK;
