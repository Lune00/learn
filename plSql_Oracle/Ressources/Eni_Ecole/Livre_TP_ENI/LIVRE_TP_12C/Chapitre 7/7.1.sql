CREATE TABLE equipes(
code char(3) constraint pk_equipes primary key,
nom varchar(80) not null,
nationalite char(3) not null,
directeur varchar(80) not null,
constraint ck_equipes_code check(code=upper(code)),
constraint ck_equipes_nationalite check(nationalite=upper(nationalite)));

CREATE TABLE coureurs(
dossard number(6) generated always as identity constraint pk_coureurs primary key,
nom varchar2(80) not null,
prenom varchar2(80) not null,
nationalite char(3) not null,
equipe char(3) constraint fk_courreurs_equipes references equipes(code),
constraint ck_coureurs_nationalite check( nationalite=upper(nationalite))
);

CREATE TABLE etapes(
code char(8) constraint pk_etapes primary key,
jour date not null,
villeDepart varchar2(80) not null,
villeArrivee varchar2(80) not null,
distance number(5,2) not null);

CREATE TABLE resultats(
coureur number(6) constraint fk_resultats_coureurs references coureurs(dossard),
etape char(8) constraint fk_resultats_etapes references etapes(code),
temps date,
constraint pk_resultats primary key(coureur, etape));
