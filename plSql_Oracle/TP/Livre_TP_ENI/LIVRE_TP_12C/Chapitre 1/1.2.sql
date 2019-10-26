
create table genres(
code char(5) constraint pk_genres primary key,
libelle varchar2(80) not null);

create table ouvrages(
isbn number(10) constraint pk_ouvrages primary key,
titre varchar2(200)not null,
auteur varchar2(80),
genre char(5) not null constraint fk_ouvrages_genres references genres(code),
editeur varchar2(80));


create table exemplaires(
isbn number(10),
numero number(3),
etat char(5),
constraint pk_exemplaires primary key(isbn, numero),
constraint fk_exemplaires_ouvrages foreign key(isbn) references ouvrages(isbn),
constraint ck_exemplaires_etat check (etat in('NE','BO','MO','MA')) );


create table membres(
numero number(6) constraint pk_membres primary key,
nom varchar2(80) not null,
prenom varchar2(80) not null,
adresse varchar2(200) not null,
telephone char(10) not null,
adhesion date not null,
duree number(2) not null,
constraint ck_membres_duree check (duree>=0));


create table emprunts(
numero number(10) constraint pk_emprunts primary key,
membre number(6) constraint fk_emprunts_membres references membres(numero),
creele date default sysdate);


create table detailsemprunts(
emprunt number(10) constraint fk_details_emprunts references emprunts(numero),
numero number(3),
isbn number(10),
exemplaire number(3),
rendule date,
constraint pk_detailsemprunts primary key (emprunt, numero),
constraint fk_detailsemprunts_exemplaires foreign key(isbn, exemplaire) references exemplaires(isbn, numero));
