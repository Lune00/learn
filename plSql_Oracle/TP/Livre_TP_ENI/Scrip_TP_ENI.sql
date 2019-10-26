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

create sequence seq_membre start with 1 increment by 1;
alter table membres add constraint uq_membres unique (nom, prenom, telephone);
alter table membres add mobile char(10);
alter table membres add constraint ck_membres_mobile check (mobile like '06%' or mobile like '07%');
alter table membres drop constraint uq_membres;
alter table membres set unused (telephone);
alter table membres drop unused columns;
alter table membres add constraint uq_membres unique (nom, prenom, mobile);
create index idx_ouvrages_genre on ouvrages(genre);
create index idx_emplaires_isbn on exemplaires(isbn);
create index idx_emprunts_membre on emprunts(membre);
create index idx_details_emprunt on detailsemprunts(emprunt);
create index idx_details_exemplaire on detailsemprunts(isbn, exemplaire);
alter table detailsemprunts drop constraint fk_details_emprunts;
alter table detailsemprunts add constraint fk_details_emprunts foreign key(emprunt)references emprunts(numero) on delete cascade;


alter table exemplaires modify (etat char(2) default 'NE');
create synonym abonnes for membres;
rename detailsemprunts to details;
insert into genres(code, libelle) values ('REC','Récit');
insert into genres(code, libelle) values ('POL','Policier');
insert into genres(code, libelle) values ('BD','Bande Dessinée');
insert into genres(code, libelle) values ('INF','Informatique');
insert into genres(code, libelle) values ('THE','Théâtre');
insert into genres(code, libelle) values ('ROM','Roman');
commit;
insert into ouvrages (isbn, titre, auteur, genre, editeur) 
values (2203314168, 'LEFRANC-L''ultimatum', 'Martin, Carin', 'BD', 'Casterman');
insert into ouvrages (isbn, titre, auteur, genre, editeur) 
values (2746021285, 'HTML entraînez-vous pour maîtriser le code source', 'Luc Van Lancker', 'INF', 'ENI');
insert into ouvrages (isbn, titre, auteur, genre, editeur) 
values (2746026090, ' Oracle 12c SQL, PL/SQL, SQL*Plus', 'J. Gabillaud', 'INF', 'ENI');
insert into ouvrages (isbn, titre, auteur, genre, editeur) 
values (2266085816, 'Pantagruel', 'François RABELAIS', 'ROM', 'POCKET');
insert into ouvrages (isbn, titre, auteur, genre, editeur) 
values (2266091611, 'Voyage au centre de la terre', 'Jules Verne', 'ROM', 'POCKET');
insert into ouvrages (isbn, titre, auteur, genre, editeur) 
values (2253010219, 'Le crime de l''Orient Express', 'Agatha Christie', 'POL', 'Livre de Poche');
insert into ouvrages (isbn, titre, auteur, genre, editeur) 
values (2070400816, 'Le Bourgeois gentilhomme', 'Moliere', 'THE', 'Gallimard');
insert into ouvrages (isbn, titre, auteur, genre, editeur) 
values (2070367177, 'Le curé de Tours', 'Honoré de Balzac', 'ROM', 'Gallimard');
insert into ouvrages (isbn, titre, auteur, genre, editeur) 
values (2080720872, 'Boule de suif', 'Guy de Maupassant', 'REC', 'Flammarion');
insert into ouvrages (isbn, titre, auteur, genre, editeur) 
values (2877065073, 'La gloire de mon père', 'Marcel Pagnol', 'ROM', 'Fallois');
insert into ouvrages (isbn, titre, auteur, genre, editeur) 
values (2020549522, ' L''aventure des manuscrits de la mer morte ', default, 'REC', 'Seuil');
insert into ouvrages (isbn, titre, auteur, genre, editeur) 
values (2253006327, ' Vingt mille lieues sous les mers ', 'Jules Verne', 'ROM', 'LGF');
insert into ouvrages (isbn, titre, auteur, genre, editeur) 
values (2038704015, 'De la terre à la lune', 'Jules Verne', 'ROM', 'Larousse');
commit;
insert into exemplaires(isbn, numero, etat) select isbn, 1,'BO' from ouvrages;
insert into exemplaires(isbn, numero, etat) select isbn, 2,'MO' from ouvrages;
delete from exemplaires where isbn=2746021285 and numero=2;
update exemplaires set etat='MO' where isbn=2203314168 and numero=1;
update exemplaires set etat='BO' where isbn=2203314168 and numero=2;
insert into exemplaires(isbn, numero, etat) values (2203314168,3,'NE');
commit;
insert into membres (numero, nom, prenom, adresse, mobile, adhesion, duree) values (seq_membre.nextval, 'ALBERT', 'Anne', '13 rue des alpes', '0601020304', sysdate-60, 1);
insert into membres (numero, nom, prenom, adresse, mobile, adhesion, duree) values (seq_membre.nextval, 'BERNAUD', 'Barnabé', '6 rue des bécasses', '0602030105', sysdate-10, 3);
insert into membres (numero, nom, prenom, adresse, mobile, adhesion, duree) values (seq_membre.nextval, 'CUVARD', 'Camille', '52 rue des cerisiers', '0602010509', sysdate-100, 6);
insert into membres (numero, nom, prenom, adresse, mobile, adhesion, duree) values (seq_membre.nextval, 'DUPOND', 'Daniel', '11 rue des daims', '0610236515', sysdate-250, 12);
insert into membres (numero, nom, prenom, adresse, mobile, adhesion, duree) values (seq_membre.nextval, 'EVROUX', 'Eglantine', '34 rue des elfes', '0658963125', sysdate-150, 6);
insert into membres (numero, nom, prenom, adresse, mobile, adhesion, duree) values (seq_membre.nextval, 'FREGEON', 'Fernand', '11 rue des Francs', '0602036987', sysdate-400, 6);
insert into membres (numero, nom, prenom, adresse, mobile, adhesion, duree) values (seq_membre.nextval, 'GORIT', 'Gaston', '96 rue de la glacerie ', '0684235781', sysdate-150, 1);
insert into membres (numero, nom, prenom, adresse, mobile, adhesion, duree) values (seq_membre.nextval, 'HEVARD', 'Hector', '12 rue haute', '0608546578', sysdate-250, 12);
insert into membres (numero, nom, prenom, adresse, mobile, adhesion, duree) values (seq_membre.nextval, 'INGRAND', 'Irène', '54 rue des iris', '0605020409', sysdate-50, 12);
insert into membres (numero, nom, prenom, adresse, mobile, adhesion, duree) values (seq_membre.nextval, 'JUSTE', 'Julien', '5 place des Jacobins', '0603069876', sysdate-100, 6);
commit;
insert into emprunts(numero, membre, creele) values(1,1,sysdate-200);
insert into emprunts(numero, membre, creele) values(2,3,sysdate-190);
insert into emprunts(numero, membre, creele) values(3,4,sysdate-180);
insert into emprunts(numero, membre, creele) values(4,1,sysdate-170);
insert into emprunts(numero, membre, creele) values(5,5,sysdate-160);
insert into emprunts(numero, membre, creele) values(6,2,sysdate-150);
insert into emprunts(numero, membre, creele) values(7,4,sysdate-140);
insert into emprunts(numero, membre, creele) values(8,1,sysdate-130);
insert into emprunts(numero, membre, creele) values(9,9,sysdate-120);
insert into emprunts(numero, membre, creele) values(10,6,sysdate-110);
insert into emprunts(numero, membre, creele) values(11,1,sysdate-100);
insert into emprunts(numero, membre, creele) values(12,6,sysdate-90);
insert into emprunts(numero, membre, creele) values(13,2,sysdate-80);
insert into emprunts(numero, membre, creele) values(14,4,sysdate-70);
insert into emprunts(numero, membre, creele) values(15,1,sysdate-60);
insert into emprunts(numero, membre, creele) values(16,3,sysdate-50);
insert into emprunts(numero, membre, creele) values(17,1,sysdate-40);
insert into emprunts(numero, membre, creele) values(18,5,sysdate-30);
insert into emprunts(numero, membre, creele) values(19,4,sysdate-20);
insert into emprunts(numero, membre, creele) values(20,1,sysdate-10);
commit;
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(1,1,2038704015,1,sysdate-195);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(1,2,2070367177,2,sysdate-190);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(2,1,2080720872,1,sysdate-180);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(2,2,2203314168,1,sysdate-179);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(3,1,2038704015,1,sysdate-170);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(4,1,2203314168,2,sysdate-155);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(4,2,2080720872,1,sysdate-155);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(4,3,2266085816,1,sysdate-159);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(5,1,2038704015,1,sysdate-140);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(6,1,2266085816,2,sysdate-141);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(6,2,2080720872,2,sysdate-130);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(6,3,2746021285,1,sysdate-133);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(7,1,2070367177,2,sysdate-100);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(8,1,2080720872,1,sysdate-116);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(9,1,2038704015,1,sysdate-100);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(10,1,2080720872,2,sysdate-107);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(10,2,2746026090,1,sysdate-78);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(11,1,2746021285,1,sysdate-81);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(12,1,2203314168,1,sysdate-86);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(12,2,2038704015,1,sysdate-60);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(13,1,2070367177,1,sysdate-65);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(14,1,2266091611,1,sysdate-66);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(15,1,2070400816,1,sysdate-50);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(16,1,2253010219,2,sysdate-41);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(16,2,2070367177,2,sysdate-41);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(17,1,2877065073,2,sysdate-36);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(18,1,2070367177,1,sysdate-14);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(19,1,2746026090,1,sysdate-12);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(20,1,2266091611,1,default);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(20,2,2253010219,1,default);
commit;
Insert into ouvrages (isbn, titre, auteur, genre, editeur) values (2080703234, 'Cinq semaines en ballon', 'Jules Verne', 'ROM', 'Flammarion');

alter table membres enable row movement;
alter table details enable row movement;
alter table emprunts add(etat char(2) default 'EC');
alter table emprunts add constraint ck_emprunts_etat check (etat in ('EC','RE'));

Update emprunts set etat='RE' where etat='EC' and numero not in (select emprunt from details where rendule is null);
commit;
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(7,2,2038704015,1,sysdate-136);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(8,2,2038704015,1,sysdate-127);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(11,2,2038704015,1,sysdate-95);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(15,2,2038704015,1,sysdate-54);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(16,3,2038704015,1,sysdate-43);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(17,2,2038704015,1,sysdate-36);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(18,2,2038704015,1,sysdate-24);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(19,2,2038704015,1,sysdate-13);
insert into details(emprunt, numero, isbn, exemplaire, rendule) values(20,3,2038704015,1,sysdate-3);
UPDATE exemplaires SET etat='NE' WHERE isbn=2038704015 and numero=1;
commit;

Create table tempoExemplaires as select isbn, exemplaire, count(*) as locations 
from details group by isbn, exemplaire;

Merge into exemplaires e 
using (select isbn, exemplaire, locations from tempoexemplaires) t
on (t.isbn=e.isbn and t.exemplaire=e.numero)
when matched then
  update set etat='BO' where t.locations between 11 and 25
 delete where t.locations>60;

Drop table tempoExemplaires;
INSERT INTO exemplaires(isbn, numero, etat) VALUES (2203314168,4,'MA');
INSERT INTO exemplaires(isbn, numero, etat) VALUES (2746021285,3,'MA');
commit;
DELETE FROM exemplaires WHERE etat='MA';

create or replace view ouvragesEmpruntes as
select emprunts.membre, count(*) as NombreEmprunts
from emprunts inner join details on 
 emprunts.numero=details.emprunt 
 where details.rendule is null
group by emprunts.membre;

create or replace view NombreEmpruntsParOuvrage as
SELECT isbn, count(*) as NombreEmprunts
FROM  details
GROUP BY  isbn;

Create global temporary table SyntheseEmprunts (
Isbn char(10),
Exemplaire number(3),
nombreEmpruntsExemplaire number(10),
nombreEmpruntsOuvrage number(10))
on commit preserve rows;


Insert into SyntheseEmprunts(isbn, exemplaire, nombreEmpruntsExemplaire)
Select isbn, numero, count(*)
From details
Group by isbn, numero;


Update SyntheseEmprunts
Set nombreEmpruntsOuvrage=(select count(*) from details where details.isbn=SyntheseEmprunts.isbn);

COMMIT;

Delete from SyntheseEmprunts;
COMMENT ON TABLE membres 
IS 'Descriptifs des membres. Possède le synonyme Abonnes';
COMMENT ON TABLE genres 
IS 'Définition des genres possible des ouvrages';
COMMENT ON TABLE ouvrages 
IS 'Description des ouvrages référencés par la bibliothèque';
COMMENT ON TABLE exemplaires 
IS 'Définition précise des livres présents dans la bibliothèque';
COMMENT ON TABLE emprunts 
IS 'Fiche d''emprunt de livres, toujours associée à un et un seul membre';
COMMENT ON TABLE details 
IS 'Chaque ligne correspond à un livre emprunté';


ALTER TABLE membres DROP constraint ck_membres_mobile; 

create table exceptions(row_id rowid,
	                owner varchar2(30),
	                table_name varchar2(30),
		        constraint varchar2(30));

-- la suite de la correction de l'exercice
ALTER TABLE membres add constraint ck_membres_mobile check (regexp_like (mobile, '^(06|07) [[:digit:]]{2} [[:digit:]]{2} [[:digit:]]{2} [[:digit:]]{2}$')) EXCEPTIONS INTO EXCEPTIONS;

SELECT * FROM membres WHERE rowid IN (SELECT row_id FROM exceptions WHERE constraint='CK_MEMBRES_MOBILE');

DELETE FROM exceptions WHERE constraint ='CK_MEMBRES_MOBILE';

ALTER TABLE emprunts DROP CONSTRAINT fk_emprunts_membres;
ALTER TABLE emprunts ADD
CONSTRAINT fk_emprunts_membres 
FOREIGN KEY (membre) REFERENCES membres(numero)
INITIALLY DEFERRED;
-- le test
-- ajouter un nouveau membre
INSERT INTO membres(numero, nom, prenom, adresse, adhesion, duree, mobile)
VALUES (100,'KARLINA','Karine','48 rue Kily', sysdate,2,'0607080910');
-- ajouter une nouvelle fiche d'emprunt
INSERT INTO emprunts(numero, membre, creele)
VALUES (21, 100, sysdate);
-- valider les modifications
commit;

ALTER TABLE MEMBRES ADD(finAdhesion date as (ADD_MONTHS(adhesion,duree)));
commit;