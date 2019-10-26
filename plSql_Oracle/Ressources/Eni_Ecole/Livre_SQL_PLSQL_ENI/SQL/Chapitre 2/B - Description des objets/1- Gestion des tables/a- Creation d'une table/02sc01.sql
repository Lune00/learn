create table ARTICLES(
  REFART	char(4) primary key,
  DESIGNATION	varchar2(30),
  PRIX		number(8,2),
  CODETVA	number(1),
  CATEGORIE	char(10),
  QTESTK	number(5)
);