drop table ligces
drop view v_clicdelig

create schema authorization JEROME

  create table ARTICLES(
  REFART	char(4) primary key,
  DESIGNATION	varchar2(30),
  PRIX		number(8,2),
  CODETVA	number(1),
  CATEGORIE	char(10),
  QTESTK	number(5))

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
  VILLE         char(30))

  create table COMMANDES(
  NOCDE   number(6),
  NOCLI   number(4),
  DATECDE date,
  ETATCDE char(2),
  constraint PK_COMMANDES primary key (NOCDE),
  constraint FK_COMMANDES_CLIENTS foreign key(NOCLI)
    references CLIENTS(NOCLI),
  constraint CK_COMMANDES_ETAT check (ETATCDE in ('EC','LI','SO')))


  create table LIGCDES(
  NOCDE  number(6)
         constraint fk_ligcdes_commandes references commandes(nocde),
  NOLIG  number(2)
         constraint ck_ligcdes_nolig check (nolig>0),
  REFART char(4)
         constraint fk_ligcdes_articles references articles(refart),
  QTECDE number(5),
         constraint pk_ligcdes primary key(nocde,nolig))

  create view v_clicdelig (noclient, nomcli, nocde, datecde, nolig, refart, qtecde) as
    select noclient, nomcli, nocde, datecde, nolig, refart, qtecde
    from v_cdecli, ligcdes
    where v_cdecli.nocde=ligcdes.nocd
;
