create table abonnements(
  numero number(5) constraint pk_abonnements primary key,
  membre number(5) not null ,
  editee_le date);

create table membres(
  numero number(5) constraint pk_commandes primary key,
  abonnement number(5),
  incription date);

alter table abonnements 
	add constraint fk_abonnements_membres 
	foreign key(membre)
	references membres (numero);
alter table membres     
	add constraint fk_membres_abonnements 
	forign key(abonnement)
	references membres (numero);