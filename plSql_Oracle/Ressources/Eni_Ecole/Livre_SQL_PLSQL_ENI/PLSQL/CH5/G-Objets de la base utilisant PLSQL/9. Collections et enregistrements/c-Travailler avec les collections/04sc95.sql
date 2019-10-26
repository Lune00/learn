CREATE TABLE depot(
  codedepot integer,
  nom varchar2(30),
  stock tabstock)
NESTED TABLE stock STORE AS stock_tab;