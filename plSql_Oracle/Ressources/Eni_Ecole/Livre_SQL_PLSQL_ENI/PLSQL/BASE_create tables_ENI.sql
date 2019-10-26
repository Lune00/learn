drop table articles cascade constraints;
drop table clients cascade constraints;
drop table commandes cascade constraints;
drop table ligcdes cascade constraints;
drop table membres cascade constraints;
drop table abonnements cascade constraints;
drop table nomenclature cascade constraints;
drop table employes cascade constraints;

drop sequence seq_cli;

create table articles(
refart char(4) primary key,
designation varchar2(30),
prix number(8,2),
codetva number(1),
categorie char(10),
qtestk number(5));

create table clients(
nocli 	number(4)	constraint clients_pk primary key
	constraint clients_nocli_ck check (nocli>0),
nomcli	varchar2(30)
	constraint clients_nomcli_nn not null,
adrcli	varchar2(60),
code_postal number(5)
	constraint clients_code_postal_ck check (code_postal between 1000 and 99999),
ville char(30));

create table commandes(
  nocde	  number(6),
  nocli   number(4),
  datecde date,
  etatcde char(2),
  constraint pk_commandes primary key (nocde),
  constraint fk_commandes_clients foreign key(nocli) references clients(nocli),
  constraint ck_commandes_etat check (etatcde in ('EC','LI','SO'))
);

create table ligcdes(
  nocde number (6) constraint fk_ligcdes_commandes references commandes(nocde),
  nolig number(2) constraint ck_ligcdes_nolig check(nolig>0),
  refart char(4) constraint fk_ligcdes_articles references articles(refart),
  qtecde number(5),
  constraint pk_ligcdes primary key(nocde, nolig)
);

create index I_LIGART on LIGCDES (REFART);
create index I_CLID on CLIENTS (NOMCLI, ADRCLI);

create sequence seq_cli;

insert into articles (refart, designation, prix, codetva,categorie, qtestk) 
              values ('AB22','Tapîs Persan',1250.1,2,'IMPORT',5);
insert into articles (refart, codetva,categorie, qtestk)
              values ('CD50',2,'IMPORT',7);
insert into articles (refart,designation, prix, codetva,categorie, qtestk)
              values ('CD21','Platine laser',500,2,'IMPORT',20);
insert into articles (refart, designation,categorie, qtestk)
              values ('ZZZZ','Article bidon','DIVERS',25);
insert into articles (refart,designation, codetva,categorie, qtestk)
              values ('AA00','Cadeau',0,'DIVERS',8);
insert into articles (refart, designation, prix, codetva,categorie, qtestk)
              values ('AB03','Carpette',150,2,'SOLDES',116);
insert into articles (refart, designation, codetva,categorie, qtestk)
              values ('AB','Tapis',2,'DIVERS',2);
insert into articles (refart, designation, prix, codetva,categorie, qtestk)
              values ('ZZ01','Lot de tapis',500,2,'DIVERS',0);
insert into articles (refart, designation, prix, codetva,categorie, qtestk)
              values ('AB10','Tapis de chine',1500,2,'IMPORT',10);


insert into clients (nocli, nomcli,adrcli, code_postal, ville) values (1,'PANISSE Voiles','rue des carmes','35000','RENNES');
insert into clients (nocli, nomcli, code_postal, ville) values (15,'DUPONT S.A.','44000','NANTES');
insert into clients (nocli, nomcli, code_postal, ville) values (20,'Etb LABICHE','44100','NANTES');
insert into clients (nocli, nomcli, code_postal, ville) values (35,'DUBOIS Jean','44200','NANTES');
insert into clients (nocli, nomcli,adrcli, code_postal, ville ) values (36,'Bernard S.A.','rue des carmes','75000','PARIS');
insert into clients (nocli, nomcli) values (37,'Ets LAROCHE');
insert into clients (nocli, nomcli, code_postal, ville) values (138,'DUBOIS Jean','37000','TOURS');
insert into clients (nocli, nomcli, code_postal, ville) values (152,'LAROCHE','72000','LE MANS');

insert into commandes (nocde, nocli, datecde, etatcde) values (101,35,sysdate,'EC');
insert into commandes (nocde, nocli, datecde, etatcde) values (100,15,sysdate,'EC');
insert into commandes (nocde, nocli, datecde, etatcde) values (1301,15,sysdate-1,'EC');
insert into commandes (nocde, nocli, datecde, etatcde) values (1210,15,sysdate-3,'SO');
insert into commandes (nocde, nocli, datecde, etatcde) values (1250,35,sysdate-4,'EC');
insert into commandes (nocde, nocli, datecde, etatcde) values (1230,35,sysdate-5,'SO');

insert into ligcdes(nocde, nolig, refart, qtecde) values (1210,1,'AB10',3);
insert into ligcdes(nocde, nolig, refart, qtecde) values (1210,2,'CD50',4);

create table abonnements(
  numero number(5) constraint pk_abonnements primary key,
  membre number(5) not null ,
  editee_le date);

create table membres(
  numero number(5) constraint pk_com primary key,
  abonnement number(5),
  incription date);

alter table abonnements 
	add constraint fk_abonnements_membres 
	foreign key(membre)
	references membres (numero);
alter table membres     
	add constraint fk_membres_abonnements 
	foreign key(abonnement)
	references membres (numero);

create table nomenclature(
  refart char(4) constraint pk_nomenclature primary key,
  designation varchar2(30),
  composant char(4) constraint fk_nomenclature_refart references nomenclature(refart),
  nombre number);

insert into nomenclature (refart, designation) values ('XX55','VELO');
insert into nomenclature  values ('X133','Roues','XX55',2);
insert into nomenclature  values ('X520','Cadre','XX55',1);
insert into nomenclature  values ('X456','Guidon','XX55',1);
insert into nomenclature (refart, designation) values ('QD24','Lot de tapis');
insert into nomenclature values ('AB03','Carpettes','QD24',10);

create table employes (
numero number(3) constraint pk_emploi primary key,
nom varchar2(30),
age number(2),
salaire number(7,2));
insert into employes values (1,'Marie',53,3500);
insert into employes values (2,'Paul',28,1200);
insert into employes values (4,'Jean',35,2300);
insert into employes values (7,'Luc',41,1800);
insert into employes values (5,'Anne',25,1100);
commit;


