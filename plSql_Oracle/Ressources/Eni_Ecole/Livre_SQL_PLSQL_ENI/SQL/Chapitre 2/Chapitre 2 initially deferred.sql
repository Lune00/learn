create table abonnements(
numero number(5),
membre number(5),
constraint pk_abonnements primary key(numero)
);

create table membres(
numero number(5),
nom varchar2(40),
prenom varchar2(40),
abonnement number(5),
constraint pk_membres primary key(numero)
);

alter table abonnements
add constraint fk_abonnements_membres
foreign key(membre)
references membres(numero)
initially deferred;


insert into abonnements(numero, membre) 
values(1,100);
insert into membres(numero, nom, prenom, abonnement) 
values(100,'ALBERT','Anatole',1);
commit;

