create table employes(
  noemp	 number(5) 
    constraint pk_employes primary key,
  nom	 char(30),
  poste	 char(15),
  nochef number(5));