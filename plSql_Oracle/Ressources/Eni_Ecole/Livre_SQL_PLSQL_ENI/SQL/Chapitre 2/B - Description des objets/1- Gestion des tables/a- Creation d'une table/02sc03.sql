create table COMMANDES(
  NOCDE   number(6),
  NOCLI   number(4),
  DATECDE date,
  ETATCDE char(2),
  constraint PK_COMMANDES primary key (NOCDE),
  constraint FK_COMMANDES_CLIENTS foreign key(NOCLI)
    references CLIENTS(NOCLI),
  constraint CK_COMMANDES_ETAT check (ETATCDE in ('EC','LI','SO'))
);