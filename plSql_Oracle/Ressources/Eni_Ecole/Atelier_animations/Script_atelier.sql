drop table INSCRIPTION;
drop table ACTIVITE;
drop table ATELIER;
drop table ANIMATEUR;
drop table anc_anim;
drop table compteur;
drop table detail;
drop table facture;
drop table ADHERENT;
drop view v_animation;

drop table emp;
drop table dept;

CREATE TABLE DEPT
(DEPTNO NUMBER(4) Constraint PK_DEPT PRIMARY KEY,
 DNAME Varchar2(12) Constraint NN_NAME NOT NULL,
 LOC Varchar2(30)
);

CREATE TABLE EMP
(EMPNO Number(4)	Constraint PK_EMP	PRIMARY KEY,
 ENAME Varchar2(30)	Constraint NN_NOM_EMP	NOT NULL,
 JOB Varchar2(30),
 MGR Number(4),
 HIREDATE	DATE,
 SAL		Number(7,2),
 COMM		Number(7,2),
 DEPTNO		Number(4),
 Constraint FK_DEPT FOREIGN KEY(deptno) References DEPT(DEPTNO)
);

Insert into DEPT values (10,'ACCOUNTING','NEW YORK');
Insert into DEPT values (20,'RESEARCH','DALLAS');
Insert into DEPT values (30,'SALES','CHICAGO');
Insert into DEPT values (40,'OPERATIONS','BOSTON');

Insert into EMP values (7369,'SMITH','CLERK',7902,'17/12/80',800,null,20);
Insert into EMP values (7499,'ALLEN','SALESMAN',7698,'20/02/81',1600,300,30);
Insert into EMP values (7521,'WARD','SALESMAN',7698,'22/02/81',1250,500,30);
Insert into EMP values (7566,'JONES','MANAGER',7839,'02/04/81',2975,null,20);
Insert into EMP values (7654,'MARTIN','SALESMAN',7698,'28/09/81',1250,1400,30);
Insert into EMP values (7698,'BLAKE','MANAGER',7839,'01/05/81',2850,null,30);
Insert into EMP values (7782,'CLARK','MANAGER',7839,'09/06/81',2450,null,10);
Insert into EMP values (7788,'SCOTT','ANALYST',7566,'09/12/82',3000,null,20);
Insert into EMP values (7839,'KING','PRESIDENT',NULL,'17/11/81',5000,null,10);
Insert into EMP values (7844,'TURNER','SALESMAN',7698,'08/09/81',1500,0,30);
Insert into EMP values (7876,'ADAMS','CLERK',7788,'12/01/83',1100,null,20);
Insert into EMP values (7900,'JAMES','CLERK',7698,'03/12/81',950,null,30);
Insert into EMP values (7902,'FORD','ANALYST',7566,'03/12/81',3000,null,20);
Insert into EMP values (7934,'MILLER','CLERK',7782,'23/01/82',1300,null,10);

COMMIT;


CREATE TABLE ADHERENT (
	NO_ADHER 	NUMBER(4),
	NOM 		VARCHAR2(25), 
	PRENOM 		VARCHAR2(25), 
	RUE 		VARCHAR2(35), 
	CP 		CHAR(5), 
	VILLE 		VARCHAR2(25), 
	DATE_NAISSANCE 	DATE, 
	SEXE 		CHAR(1), 
CONSTRAINT CK_ADH_SEXE CHECK(sexe in ('F','M')), 
CONSTRAINT PK_ADH PRIMARY KEY(NO_ADHER));

CREATE TABLE ANIMATEUR (
	NO_ANIM 	NUMBER(4) ,
	NOM 		VARCHAR2(25) , 
	PRENOM 		VARCHAR2(25), 
	TEL 		CHAR(14), 
	NO_RESP 	NUMBER(4), 
	FONCTION 	VARCHAR2(9), 
	COUT_HEURE 	NUMBER(4), 
CONSTRAINT CK_ANI_FCT CHECK(Fonction in ('Agent','Cadre','Directeur')), 
CONSTRAINT PK_ANI PRIMARY KEY(NO_ANIM));

ALTER TABLE ANIMATEUR
ADD
CONSTRAINT FK_ANI_ANI FOREIGN KEY(NO_RESP) REFERENCES ANIMATEUR(NO_ANIM);

CREATE TABLE ATELIER (
	NO_ATEL 	NUMBER(4) , 
	INTITULE 	VARCHAR2(35), 
	GENRE 		VARCHAR2(9), 
	ILLUSTRATION 	BLOB,
	VENTE_HEURE 	NUMBER(4), 
	NO_ANIM 	NUMBER(4), 
CONSTRAINT CK_ATE_GENRE CHECK(genre in ('CULTURE','SCIENCES','SPORT','TNIC')), 
CONSTRAINT FK_ATE_ANI FOREIGN KEY(NO_ANIM) REFERENCES ANIMATEUR(NO_ANIM), 
CONSTRAINT PK_ATE PRIMARY KEY(NO_ATEL));

CREATE TABLE ACTIVITE (
	NO_ATEL 	NUMBER(4) NOT NULL ,
	JOUR 		CHAR(2) NOT NULL , 
	DUREE 		NUMBER(2), 
CONSTRAINT FK_ACT_ATE FOREIGN KEY(NO_ATEL) REFERENCES ATELIER(NO_ATEL), 
CONSTRAINT PK_ACT PRIMARY KEY(NO_ATEL, JOUR));

CREATE TABLE INSCRIPTION (
	NO_INSC 	NUMBER(4), 
	NO_ADHER 	NUMBER(4) NOT NULL, 
	NO_ATEL 	NUMBER(4) NOT NULL, 
	JOUR 		CHAR(2) NOT NULL, 
	DATE_INSCRIPTION DATE, 
	NOTE 		NUMBER(2), 
	DATE_SORTIE 	DATE,
CONSTRAINT CK_INSC_DATE CHECK (DATE_SORTIE>=DATE_INSCRIPTION),
CONSTRAINT FK_INS_ACT FOREIGN KEY(NO_ATEL, JOUR) REFERENCES ACTIVITE(NO_ATEL, JOUR), 
CONSTRAINT FK_INS_ADH FOREIGN KEY(NO_ADHER) REFERENCES ADHERENT(NO_ADHER), 
CONSTRAINT PK_INS PRIMARY KEY(NO_INSC));

create or replace view v_animation as
select t.no_atel,intitule,genre,vente_heure,t.no_anim,nom,prenom,tel
from atelier t, animateur m
where m.no_anim=t.no_anim;

create table facture (
no_fact     number(6),
trimestre   number(1),
data_facture    date,
no_adher    number(4),
total       number(9,2),
constraint pk_facture primary key(no_fact),
constraint fk_facture_adherent foreign key(no_adher)
references adherent(no_adher));

create table detail(
no_fact     number(6),
no_lig      number(1),
intitule    varchar2(35),
jour        char(2),
duree       number(2),
vente_heure number(4),
montant     number(9,2),
constraint pk_detail primary key(no_fact,no_lig),
constraint fk_detail_facture foreign key(no_fact)
references facture(no_fact));

create table compteur(
nom	 	varchar2(35),
valeur  	number(6));
insert into compteur values('FACTURE',0);
commit;

create table anc_anim(
nom		varchar2(15),
prenom		varchar2(15),
tel		varchar2(14),
util		varchar2(10));

insert into adherent values (20,'DE PIE','Denis','46, RUE DES HÉRONS CENDRÉS','44800','SAINT HERBLAIN','24/03/1956','M');
insert into adherent values (21,'ALLICARTE','Michèle','25 RUE DES MARRONNIERS','44000','NANTES','01/02/1965','F');
insert into adherent values (22,'ALMARANTE','Irène','22 RUE DES FRÊNES','35000','RENNES','12/10/1965','F');
insert into adherent values (23,'ALBIN','Marcel','10 RUE DU VÉLODROME','44100','NANTES','10/01/1958','M');
insert into adherent values (24,'AMITT','Gérald','25 RUE DE LA POSTE','44000','NANTES','10/05/1975','M');
insert into adherent values (25,'APPERT','Nicolas','25 RUE DE L''ÉLECTRICITÉ','35000','RENNES','25/12/1981','M');
insert into adherent values (26,'APPLIQUE','Isabelle','65 AVENUE DE LA CONCORDANCE','35000','RENNES','10/12/1984','F');
insert into adherent values (27,'AROBASQUE','Marcel','10 RUE DE L''ESPERLUETTE','44000','NANTES','10/11/1965','M');
insert into adherent values (28,'ATOS','Murielle','1 AVENUE ST ANDRÉ','44100','NANTES','12/10/1969','F');
insert into adherent values (29,'PARKER','Emilie','10 RUE DU CRIME','44000','NANTES','10/02/1965','F');
insert into adherent values (30,'CHALENDON','Albin','10 RUE DU MARGINAL','35000','RENNES','10/05/1946','M');
insert into adherent values (31,'MICHEL','Andre','10 RUE FABLE','44000','NANTES','10/02/1965','M');
insert into adherent values (32,'LAVILLE','Adrienne','25 AVENUE LONGE','44000','NANTES','10/02/1985','F');
insert into adherent values (33,'PEREZ','Amapola','10 RUE DE LA POSTE','44100','NANTES','02/05/1948','F');
insert into adherent values (34,'BONNEAU','Jean','31, RUE DES COLOMBES','79000','NIORT','11/04/1969','M');
insert into adherent values (35,'BOSAPIN','Edmond','21, AVENUE DES PEUPLIERS','49000','ANGERS','14/02/1945','M');
insert into adherent values (36,'COMILFO','Juste','39, RUE DES BOULANGERS','44000','NANTES','17/01/1968','M');
insert into adherent values (37,'DABITUDE','Côme','1, RUE CLAUDE FRANÇOIS','44700','ORVAULT','14/09/1967','M');
insert into adherent values (38,'DASSAULT','Richard','12, RUE DE LA GRANDE ARMÉE','49000','ANGERS','13/07/1963','M');
insert into adherent values (39,'DE CAJOU','Benoît','96, RUE DES OLIVIERS','44400','REZE','12/05/1966','M');
insert into adherent values (40,'DE RADIS','Stéphane','72, RUE DES MARAÎCHERS','44980','SAINTE LUCE SUR LOIRE','29/07/1947','M');
insert into adherent values (41,'DE VOUVOIR','Honoré','5, RUE DE LAMITIÉ','44300','NANTES','01/05/1962','M');
insert into adherent values (42,'DINARAVELO','Ferdinand','25, RUE POULIDOR','44700','ORVAULT','14/05/1968','M');
insert into adherent values (43,'GONZOLA','Igor','5, PLACE DES FROMAGERS','49000','ANGERS','13/06/1957','M');
insert into adherent values (47,'HOCHET','Eric','11, RUE DU LAC','49240','AVRILLE','04/09/1965','M');
insert into adherent values (50,'MONFILS','Thibault','15, AVENUE DALGÉRIE','49240','AVRILLE','14/10/1967','M');
insert into adherent values (52,'OPOSTE','Fidèle','12, AVENUE DE LA CASERNE','49000','ANGERS','03/04/1969','M');
insert into adherent values (58,'SWITAUME','Guillaume','8, AVENUE DANGLETERRE','44000','NANTES','04/12/1968','M');
insert into adherent values (59,'TACHAMBRE','Béranger','10, AVENUE DU CHÂTEAU','49000','ANGERS','03/07/1967','M');
insert into adherent values (61,'TERRIEUR','Alex','27, IMPASSE DU PONT','49000','ANGERS','21/04/1968','M');
insert into adherent values (62,'TINIQUE','Aymar','45, RUE DES ANTILLES','44980','SAINTE LUCE SUR LOIRE','29/07/1962','M');
insert into adherent values (63,'TINE','Clément','33, RUE DES JARDINS','49240','AVRILLE','24/09/1964','M');
insert into adherent values (64,'TINE','Constant','25, AVENUE LOUIS XVI','49300','CHOLET','30/10/1967','M');
insert into adherent values (65,'TOURNE','Sylvan','12, RUE DES ALIZÉES','44300','NANTES','08/05/1963','M');
insert into adherent values (66,'TOULETEMPS','Isidore','72, ROUTE DE LA PLAGE','44340','BOUGUENAIS','29/06/1961','M');
insert into adherent values (67,'ABONDIEU','Elisabeth','5, PLACE DE LA CATHÉDRALE','44000','NANTES','01/01/1956','F');
insert into adherent values (68,'AIMONE','Anne','3, PLACE DE LA RÉPUBLIQUE','49000','ANGERS','12/02/1932','F');
insert into adherent values (69,'MALALANICHE','Mélanie','14, RUE DU CHENIL','44700','ORVAULT','15/06/1964','F');
insert into adherent values (70,'DE JEU','Odette','45, RUE DU CASINO','44000','NANTES','25/04/1963','F');
insert into adherent values (71,'ENERBE','Eugénie','15, AVENUE DES FACULTÉS','44000','NANTES','10/09/1949','F');
insert into adherent values (1,'MARTIN','HENRI','10 rue du velodrome','35000','RENNES','12/10/1959','M');
insert into adherent values (2,'MICHELET','ISABELLE','52 rue des ormes','35000','RENNES','05/02/1970','F');
insert into adherent values (3,'ALENVERS','MICHEL','23 rue des peupliers','44000','NANTES','25/03/1962','M');
insert into adherent values (4,'ROUGER','REMY','52 rue longue','44000','NANTES','08/08/1959','M');
insert into adherent values (5,'GERMAIN','BRUNO','45 rue des fleurs','35000','RENNES','25/06/1965','M');
insert into adherent values (6,'MICHELIN','ANDRE','2 place des bancs','44000','NANTES','25/12/1965','M');
insert into adherent values (7,'LAJOINIE','MARTINE','5 rue des arbres en fleurs','44000','NANTES','10/09/1970','F');
insert into adherent values (8,'LEMERCIER','VALENTINE','5 rue des feuilles mortes','35000','RENNES','10/11/1975','F');
insert into adherent values (9,'PRIN','RENEE','6 rue des mangues','44000','NANTES','05/05/1962','F');
insert into adherent values (10,'VIALLE','GISELE','65 rue des tilleuls','44000','NANTES','07/08/1969','F');
insert into adherent values (11,'BONNIN','ANDRE','10 rue du muguet','44000','NANTES','24/03/1965','M');
insert into adherent values (12,'BIROT','MARCELLE','10 rue du regiment','35000','RENNES','12/01/1976','F');
commit;

alter table animateur disable constraint FK_ANI_ANI;
insert into animateur values (1,'BEGUIN','ARMEL','02.40.25.25.25',4,'Cadre',180);
insert into animateur values (2,'POIRIER','JEAN','02.99.65.65.65',5,'Agent',150);
insert into animateur values (3,'FOLIOT','YOLANDE','02.99.45.45.45',4,'Cadre',180);
insert into animateur values (4,'ADAMI','SYLVIE','02.40.85.85.85',null,'Directeur',220);
insert into animateur values (5,'PARDON','EMILE','02.99.85.36.63',4,'Cadre',180);
insert into animateur values (6,'LEBORGNE','ALAIN','02.99.52.25.52',7,'Agent',150);
insert into animateur values (7,'LAVILLE','MARIE','02.40.25.25.36',4,'Cadre',180);
insert into animateur values (8,'LEDLUZ','MICHEL','02.40.69.96.36',5,'Agent',150);
insert into animateur values (9,'MERCIER','ALAIN','02.99.65.65.45',1,'Agent',150);
insert into animateur values (10,'PLUCHON','LIONEL','02.40.25.85.15',7,'Agent',150);
insert into animateur values (11,'BILLARD','MARTIN','02.40.58.58.25',3,'Agent',150);
insert into animateur values (12,'COCHIN','SYLVAIN','02.99.63.63.52',1,'Agent',150);
insert into animateur values (13,'MAGNIN','MARTINE','02.40.25.36.36',5,'Agent',150);
insert into animateur values (14,'BILLON','ADRIEN','02.40.52.15.45',7,'Agent',150);
insert into animateur values (15,'SAULNIER','LUC','02.40.74.47.14',5,'Agent',150);
insert into animateur values (16,'BUCHER','MÉLANIE','02.51.58.56.65',7,'Agent',150);
insert into animateur values (17,'VIVIER','LUCIEN','02.99.65.65.65',7,'Agent',150);
insert into animateur values (18,'MICHELET','JACQUES','02.51.25.36.36',5,'Agent',150);
commit;
alter table animateur enable constraint FK_ANI_ANI;

insert into atelier values (1,'ASTRONOMIE','SCIENCES',empty_blob(),350,12);
insert into atelier values (2,'BADMINTON','SPORT',empty_blob(),350,8);
insert into atelier values (3,'BUREAUTIQUE','TNIC',empty_blob(),350,11);
insert into atelier values (4,'DANSEJAZZ','CULTURE',empty_blob(),350,14);
insert into atelier values (5,'DENTELLE','CULTURE',empty_blob(),350,16);
insert into atelier values (6,'DESSIN','CULTURE',empty_blob(),350,7);
insert into atelier values (7,'ECHECS','SPORT',empty_blob(),350,13);
insert into atelier values (8,'ECOLOGIE','SCIENCES',empty_blob(),350,1);
insert into atelier values (9,'ESCRIME MEDIEVAL','SPORT',empty_blob(),350,18);
insert into atelier values (10,'GYMNASTIQUE','SPORT',empty_blob(),350,5);
insert into atelier values (11,'INTERNET','TNIC',empty_blob(),350,3);
insert into atelier values (12,'JUDO','SPORT',empty_blob(),350,2);
insert into atelier values (13,'PEINTURE','CULTURE',empty_blob(),350,10);
insert into atelier values (14,'PLANEUR','SCIENCES',empty_blob(),350,9);
insert into atelier values (15,'POTERIE','CULTURE',empty_blob(),350,17);
insert into atelier values (16,'PROGRAMMATION','TNIC',empty_blob(),350,11);
commit;

insert into activite values (1,'MA',2);
insert into activite values (1,'SA',2);
insert into activite values (1,'VE',2);
insert into activite values (2,'LU',1);
insert into activite values (2,'ME',2);
insert into activite values (2,'SA',2);
insert into activite values (3,'LU',2);
insert into activite values (3,'ME',1);
insert into activite values (3,'VE',2);
insert into activite values (4,'LU',2);
insert into activite values (4,'ME',1);
insert into activite values (4,'VE',2);
insert into activite values (5,'LU',2);
insert into activite values (5,'ME',1);
insert into activite values (5,'VE',2);
insert into activite values (6,'MA',2);
insert into activite values (6,'JE',2);
insert into activite values (7,'MA',2);
insert into activite values (7,'JE',2);
insert into activite values (8,'MA',2);
insert into activite values (8,'JE',2);
insert into activite values (8,'SA',1);
insert into activite values (9,'MA',2);
insert into activite values (9,'JE',2);
insert into activite values (9,'SA',1);
insert into activite values (10,'MA',2);
insert into activite values (10,'ME',2);
insert into activite values (10,'VE',2);
insert into activite values (11,'MA',2);
insert into activite values (11,'SA',1);
insert into activite values (12,'MA',2);
insert into activite values (12,'SA',1);
insert into activite values (13,'MA',2);
insert into activite values (13,'SA',1);
insert into activite values (14,'LU',1);
insert into activite values (14,'DI',2);
insert into activite values (14,'SA',2);
insert into activite values (15,'LU',1);
insert into activite values (15,'DI',2);
insert into activite values (15,'VE',3);
insert into activite values (15,'SA',2);
insert into activite values (16,'LU',1);
insert into activite values (16,'DI',2);
insert into activite values (16,'VE',3);
insert into activite values (16,'SA',2);
commit;

insert into inscription values (1,22,16,'VE','01/02/2000',9,null);
insert into inscription values (2,66,16,'SA','01/02/2000',10,null);
insert into inscription values (3,62,16,'VE','01/02/2000',6,null);
insert into inscription values (4,68,16,'VE','01/02/2000',13,null);
insert into inscription values (5,65,16,'VE','01/02/2000',18,null);
insert into inscription values (6,67,15,'SA','01/02/2000',16,null);
insert into inscription values (7,71,15,'LU','01/02/2000',17,null);
insert into inscription values (8,23,16,'SA','01/02/2000',12,null);
insert into inscription values (9,43,16,'DI','01/02/2000',14,null);
insert into inscription values (10,61,15,'VE','01/02/2000',15,null);
insert into inscription values (11,62,2,'LU','01/02/2000',10,null);
insert into inscription values (12,64,2,'ME','01/02/2000',11,null);
insert into inscription values (13,68,2,'SA','01/02/2000',12,null);
insert into inscription values (14,21,1,'SA','01/02/2000',10,null);
insert into inscription values (15,24,1,'VE','01/02/2000',11,null);
insert into inscription values (16,42,2,'LU','01/02/2000',12,null);
insert into inscription values (17,63,2,'ME','01/02/2000',13,null);
insert into inscription values (18,66,2,'SA','01/02/2000',14,null);
insert into inscription values (19,69,3,'LU','01/02/2000',15,null);
insert into inscription values (20,25,1,'MA','01/02/2000',7,null);
insert into inscription values (21,65,1,'VE','01/02/2000',9,null);
insert into inscription values (22,70,2,'LU','01/02/2000',10,null);
insert into inscription values (23,22,1,'SA','01/02/2000',8,null);
insert into inscription values (24,41,16,'LU','01/02/2000',13,null);
insert into inscription values (25,26,4,'ME','12/01/2000',12,null);
insert into inscription values (26,26,10,'ME','12/01/2000',13,null);
insert into inscription values (27,28,10,'ME','12/01/2000',13,null);
insert into inscription values (28,28,14,'DI','12/01/2000',13,null);
insert into inscription values (29,31,7,'MA','15/01/2000',8,null);
insert into inscription values (30,31,9,'JE','15/01/2000',10,null);
insert into inscription values (31,34,6,'MA','10/02/2000',10,null);
insert into inscription values (32,40,9,'JE','09/02/2000',8,null);
insert into inscription values (33,34,15,'DI','12/03/2000',12,null);
insert into inscription values (34,47,5,'ME','10/12/1999',12,null);
insert into inscription values (35,47,13,'MA','01/02/2000',7,null);
insert into inscription values (36,50,11,'SA','12/12/1999',18,null);
insert into inscription values (37,50,12,'SA','12/02/2000',15,null);
insert into inscription values (38,50,13,'SA','12/03/2000',16,null);
insert into inscription values (39,52,3,'VE','01/02/2000',12,null);
insert into inscription values (40,52,4,'VE','12/11/1999',12,null);
insert into inscription values (41,52,9,'SA','03/02/2000',15,null);
insert into inscription values (42,59,12,'MA','10/10/1999',13,null);
insert into inscription values (43,58,10,'MA','12/03/2000',16,null);
insert into inscription values (44,1,3,'ME','10/12/1999',12,null);
insert into inscription values (45,1,5,'VE','15/10/1999',15,null);
insert into inscription values (46,1,11,'SA','15/01/1999',8,null);
insert into inscription values (47,2,6,'JE','10/10/1999',11,null);
insert into inscription values (48,2,13,'SA','25/10/1999',12,null);
insert into inscription values (49,3,4,'LU','15/10/1999',18,null);
insert into inscription values (50,4,8,'JE','10/10/1999',5,null);
insert into inscription values (51,4,13,'SA','15/10/1999',12,null);
insert into inscription values (52,6,5,'ME','01/02/2000',15,null);
insert into inscription values (53,6,8,'SA','01/02/2000',14,null);
insert into inscription values (54,6,14,'DI','01/02/2000',12,null);
insert into inscription values (55,7,8,'MA','15/09/1999',16,null);
insert into inscription values (56,7,14,'SA','06/10/1999',10,null);
insert into inscription values (57,8,6,'MA','10/10/1999',13,null);
insert into inscription values (58,8,10,'ME','10/10/1999',12,null);
insert into inscription values (59,8,13,'SA','10/10/1999',9,null);
insert into inscription values (60,9,3,'VE','15/12/1999',17,null);
insert into inscription values (61,10,3,'ME','04/10/1999',12,null);
insert into inscription values (62,10,5,'VE','06/11/1999',15,null);
commit;
