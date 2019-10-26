create table LIGCDES(
  NOCDE	 number(6)
         constraint FK_LIGCDES_COMMANDES 
         references COMMANDES(NOCDE),
  NOLIG	 number(2)
         constraint CK_LIGCDES_NOLIG check (NOLIG>0),
  REFART char(4)
         constraint FK_LIGCDES_ARTICLES 
         references ARTICLES(REFART),
  QTECDE number(5),
  constraint PK_LIGCDES primary key(NOCDE,NOLIG)
);