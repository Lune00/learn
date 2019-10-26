create table CLIENTS(
  NOCLI	        number(4)
                constraint CLIENTS_PK primary key
                constraint CLIENTS_NOCLI_CK check (NOCLI>0),
  NOMCLI        varchar2(30)
                constraint CLIENTS_NOMCLI_NN not null,
  ADRCLI        varchar2(60),
  CODE_POSTAL   number(5)
                constraint CLIENTS_CODE_POSTAL_CK 
                check(CODE_POSTAL between 1000 and 99999),
  VILLE         char(30) 
);