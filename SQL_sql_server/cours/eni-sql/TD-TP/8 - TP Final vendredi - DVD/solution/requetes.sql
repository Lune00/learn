



/*Requêtes sélection*/
--1
select nom, prenom, ville from clients
--2
select * from clients order by ville asc,nom desc
--3
select titre, annee from dvd order by titre
--4
select * from realisateurs order by annee_naissance
--5
select * from clients
where code_postal like '44%'
--6
select * from clients where titre != 'M.' and upper(prenom) like 'A%'
--7
select *, datepart(year,date_naissance) from clients where datepart(year,date_naissance) between 1970 and 1979
--8
select * from realisateurs where pays IN ('ANGLETERRE', 'USA')
--9
select * from realisateurs where pays = 'USA' and substring(convert(char(4),annee_naissance),1,2)='18' and lower(nom) like '%a%'
--ou
select * from realisateurs where pays = 'USA' and annee_naissance<1900 and lower(nom) like '%a%'
--10
select * from dvd where duree < 120

/*Calculs statistiques*/
--1
select count(*) , titre from  clients group by titre
--2
 select count(*), code_genre from dvd group by code_genre
--3
select nb=count(*), pays from realisateurs group by pays order by nb desc
--4
 select count(*), code_genre from dvd where annee between 1970 and 1979 group by code_genre
--5
 select avg(duree), code_genre from dvd group by code_genre
--6
 select max(duree), code_genre from dvd where annee < 1990 and annee >= 1980 group by code_genre
--7
select nb= count(*) , datepart(month,date_naissance) as 'mois' from clients group by datepart(month,date_naissance)

/*Jointures*/
--1
select d.titre, signification from dvd d, genres_film g where d.code_genre=g.code_genre

select d.titre, signification from dvd d
	INNER JOIN genres_film g ON d.code_genre=g.code_genre
	
    
--2
select d.titre, signification , realisateur = r.nom + ' ' + r.prenom + ' de ' + r.pays from dvd d, genres_film g , realisateurs r 
where d.code_genre=g.code_genre and r.code_realisateur= d.code_realisateur

select d.titre, signification , r.nom ,r.prenom , r.pays from dvd d, genres_film g , realisateurs r 
where d.code_genre=g.code_genre and r.code_realisateur= d.code_realisateur

select d.titre, signification , r.nom ,r.prenom , r.pays 
	from dvd d 
	INNER JOIN genres_film g ON d.code_genre=g.code_genre
	INNER JOIN realisateurs r  ON r.code_realisateur = d.code_realisateur


--3
select c.nom, c.prenom ,f.date_facture from clients c, factures f 
where c.code_client = f.code_client and
datepart(year,f.date_facture)= 2006 and datepart(month,f.date_facture)= 06

select c.nom, c.prenom ,f.date_facture from clients c
 INNER JOIN factures f ON c.code_client = f.code_client 
 WHERE
datepart(year,f.date_facture)= 2006 and datepart(month,f.date_facture)= 06


--4
select d.titre, d.duree, 'client' = c.titre + ' ' + c.nom + ' ' + c.prenom , 'rea' = r.nom + ' ' + r.prenom
from dvd d,clients c, factures f, locations l , realisateurs r
where c.code_client = f.code_client and
f.num_facture = l.num_facture and
l.num_dvd=d.num_dvd and r.code_realisateur = d.code_realisateur
order by d.titre

select d.titre, d.duree, 'client' = c.titre + ' ' + c.nom + ' ' + c.prenom , 'rea' = r.nom + ' ' + r.prenom
from dvd d
INNER JOIN locations l ON l.num_dvd=d.num_dvd
INNER JOIN factures f ON f.num_facture = l.num_facture
INNER JOIN clients c ON c.code_client = f.code_client
INNER JOIN realisateurs r ON r.code_realisateur = d.code_realisateur
order by d.titre

--5
select c.nom, c.prenom ,f.date_facture, r.nom from dvd d,clients c, factures f, locations l , realisateurs r
where c.code_client = f.code_client and
datepart(year,f.date_facture)= 2006 and datepart(month,f.date_facture)= 06 and
f.num_facture = l.num_facture and
l.num_dvd=d.num_dvd and r.code_realisateur = d.code_realisateur and
r.pays = 'ALLEMAGNE'

select c.nom, c.prenom ,f.date_facture, r.nom 
from dvd d
INNER JOIN locations l ON l.num_dvd=d.num_dvd
INNER JOIN factures f ON f.num_facture = l.num_facture
INNER JOIN clients c ON c.code_client = f.code_client
INNER JOIN realisateurs r ON r.code_realisateur = d.code_realisateur
where datepart(year,f.date_facture)= 2006 and datepart(month,f.date_facture)= 06 and r.pays = 'ALLEMAGNE'


--6
select d.titre, c.nom from dvd d,locations l, factures f, clients c where d.code_genre = 'AV'
and c.code_client = f.code_client and f.num_facture = l.num_facture and l.num_dvd=d.num_dvd and
c.titre = 'M.' and datepart(year, c.date_naissance) between 1960 and 1969

select d.titre, c.nom 
from dvd d
INNER JOIN locations l ON l.num_dvd=d.num_dvd
INNER JOIN factures f ON f.num_facture = l.num_facture
INNER JOIN clients c ON c.code_client = f.code_client
where d.code_genre = 'AV' and
c.titre = 'M.' and datepart(year, c.date_naissance) between 1960 and 1969


--7
select top 1 count(l.num_dvd),c.nom from clients c, factures f, locations l
where c.code_client = f.code_client and f.num_facture = l.num_facture
group by c.nom order by count(l.num_dvd) desc

select top 1 count(l.num_dvd),c.nom 
from clients c
INNER JOIN factures f ON f.code_client = c.code_client
INNER JOIN locations l ON l.num_facture = f.num_facture
group by c.nom order by count(l.num_dvd) desc


--8
insert into clients values('LAC001','M.','GSI','GSI','rue franklin','44800','st herblain','0202020202',null,1)
select * from clients c where c.code_client not in (select distinct code_client from factures)

/*Analyse croisée*/

--1
select nb = count(titre), pays , signification from dvd d, realisateurs r, genres_film g
where d.code_realisateur = r.code_realisateur and g.code_genre = d.code_genre
group by pays,signification
with rollup
--2
select  titre, departement = substring(code_postal,1,2),nombre = count(code_client) from clients
group by 
titre, substring(code_postal,1,2) 
with cube
--3
select  pays , signification, 'durée moyenne' = avg(duree) from dvd d, realisateurs r, genres_film g
where d.code_realisateur = r.code_realisateur and g.code_genre = d.code_genre
group by pays,signification
with cube

/*action*/
--1
/*create table Clients44 as (
select titre, nom, prenom, 'age' = datediff(year,date_naissance, getdate()) 
from clients
where code_postal like '44%')
select * from clients44*/
select count(*) from clients

select titre, nom, prenom, 'age' = datediff(year,date_naissance, getdate()) into CLI44
from clients
where code_postal like '44%' 
--2
delete from CLI44 where age >= 40
select * from cli44
select count(*) from cli44
drop table cli44


