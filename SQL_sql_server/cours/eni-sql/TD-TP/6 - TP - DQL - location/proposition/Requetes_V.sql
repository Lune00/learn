-- Option. Suppression des fiches en cours sans lignes de location

begin tran;
insert into fiches values(9999,1,GETDATE(),null,'EC');

DELETE FROM fiches 
	WHERE nofic NOT IN 
		(SELECT distinct f.nofic 
			FROM fiches f
				inner join lignesFic l on f.noFic = l.noFic
			WHERE f.etat = 'EC'
		)
		and etat = 'EC';
		
rollback tran;	
			


-- 12.	Liste de tous les articles et le nombre de fois qu’ils ont été loués triés du plus loué à ceux qui
--      n’ont jamais été loués.
SELECT a.refart, designation, nbloc=COUNT(l.refart)
FROM lignesFic l
RIGHT OUTER JOIN articles a ON l.refart = a.refart
GROUP BY a.refart, designation
ORDER BY nbloc DESC;

-- 13.	Liste des clients qui ne possèdent aucune fiche de location.
SELECT nom, prenom, ville
FROM clients c
LEFT OUTER JOIN fiches f ON c.noCli = f.noCli
WHERE f.noCli IS NULL;

-- 14.	Liste des fiches (noFic, nom, refart, designation) qui possèdent des articles en cours de location
--      depuis au moins 5 jours.
SELECT f.noFic, nom, l.refart, designation
FROM clients c
INNER JOIN fiches f ON c.noCli = f.noCli
INNER JOIN lignesFic l ON f.noFic = l.noFic
INNER JOIN articles a ON l.refart = a.refart
WHERE retour IS NULL and DATEDIFF(DAY, depart, GETDATE())>=5

-- 15.	Prix facturé par jour en moyenne pour la location d’une paire de ski.
--		(chiffre d'affaire global des locations de ski/nombre de jours cumulés de location)
SELECT T1.ca, T1.nbjours, T1.ca/T1.nbjours AS [prix moyen location]
	FROM (SELECT sum((datediff(day,depart,coalesce(retour,getdate())) +1)*prixjour) AS ca,
				sum(datediff(day,depart,coalesce(retour,getdate())) +1) AS nbjours
			FROM lignesfic l
				inner join articles a ON a.refart=l.refart
				inner join grilletarifs g ON g.codecate=a.codecate and g.codeGam=a.codeGam
				inner join tarifs t ON t.codetarif=g.codetarif
			WHERE a.codeCate = 'SA') T1;


-- 16.	Liste des articles n’ayant été loués (éventuellement plusieurs fois) qu’à une seule personne.
SELECT a.refart, COUNT(distinct f.nocli)
	FROM fiches f 
	INNER JOIN lignesFic l ON f.noFic = l.noFic
	INNER JOIN articles a ON l.refart = a.refart
	GROUP BY a.refart
	HAVING COUNT(distinct f.nocli) = 1;

--jeu de test
begin tran	
insert into fiches values (7777,46,GETDATE(),null,'EC');
insert into lignesFic values (7777,1,'F20',GETDATE(),null);

insert into fiches values (7778,46,GETDATE(),null,'EC');
insert into lignesFic values (7778,1,'F20',GETDATE(),null);
rollback tran
	

-- 17.	Établir la liste des clients fidèles (au moins 450€ de chiffre d’affaire au cours des 12 derniers mois)
--      qui sont des skieurs alpin (la catégorie ski alpin représente plus de 60% du montant total de l’ensemble de leurs locations).

--Version 1 : Utilisation des tables temporaires

--nocli des clients dont le CA est > à 450 sur les 12 derniers mois
select nocli into #cliplus450
	from fiches f, lignesfic l, articles a, grilletarifs g, tarifs t
	where l.nofic=f.nofic and a.refart=l.refart and g.codecate=a.codecate 
		and g.codeGam=a.codeGam and t.codetarif=g.codetarif
		and datediff(month,depart,getdate()) < 12
	group by nocli
	having sum((datediff(day,depart,coalesce(retour,getdate())) +1) * prixjour) > 450;

--ca par client et par categorie
select nocli, g.codecate, sum((datediff(day,depart,coalesce(retour,getdate())) +1)*prixjour) as ca
	into #cacatecli
	from fiches f, lignesfic l, articles a, grilletarifs g, tarifs t
	where l.nofic=f.nofic and a.refart=l.refart and g.codecate=a.codecate 
		and g.codeGam=a.codeGam and t.codetarif=g.codetarif
		and datediff(month,depart,getdate()) < 12
	group by nocli,g.codecate;

--ca dans la categorie ski
select nocli, ca
	into #caski_cli
	from #cacatecli
	where codecate='SA';

--ca d'un client toute categories confondues
select nocli, sum(ca) as ca
	into #caclient
	from #cacatecli
	group by nocli;

--Le resultat
select cli.nocli
	from #caclient cli, #caski_cli ski
	where cli.nocli=ski.nocli
			and ski.ca > (0.6*cli.ca) 
			and cli.nocli in (select nocli from #cliplus450);
  
drop table #cliplus450;
drop table #cacatecli;
drop table #caski_cli;
drop table #caclient;
  
  
--Version 2 : Utilisation des sous requetes


select nocli,nom,prenom,adresse,cpo,ville
	from clients
	where nocli in	(
						select ski.nocli
							from	(
										-- ca categorie ski
										select
											f.nocli,sum(prixjour * (datediff(day,depart,coalesce(retour,getdate())) +1)) as montant
										from
											fiches f,lignesfic l,articles a,grilletarifs g,tarifs t
										where
											f.nofic=l.nofic and
											l.refart=a.refart and
											a.codecate=g.codecate and a.codeGam=g.codeGam and
											g.codetarif=t.codetarif and a.codecate='SA' and
											l.depart >= dateadd(month,-12,getdate())
										group by
											f.nocli,f.nofic
									) ski,
									(
										-- ca toute catégorie confondue
										select
											f.nocli,sum(prixjour * (datediff(day,depart,coalesce(retour,getdate())) +1)) as montant
										from
											fiches f,lignesfic l,articles a,grilletarifs g,tarifs t
										where
											f.nofic=l.nofic and
											l.refart=a.refart and
											a.codecate=g.codecate and a.codeGam=g.codeGam and
											g.codetarif=t.codetarif and
											l.depart >= dateadd(month,-12,getdate())
										group by
											f.nocli,f.nofic
									) divers
						where 
							ski.nocli = divers.nocli and 
							ski.montant >= (0.6 * divers.montant) and
							divers.montant >= 450
					)
;
go



--Version 3 : Operateur INTERSECT


SELECT noCli --,SUM((DATEDIFF(DAY, depart, ISNULL(retour, GETDATE()))+1)*prixJour) montantTotal
FROM fiches f
INNER JOIN lignesFic l ON f.noFic = l.noFic
INNER JOIN articles a ON l.refart = a.refart
INNER JOIN grilleTarifs g ON a.codeCate = g.codeCate AND a.codeGam = g.codeGam
INNER JOIN tarifs t ON g.codeTarif = t.codeTarif
WHERE l.depart >= dateadd(month,-12,getdate())--dateCrea > DATEADD(YEAR, -1, GETDATE())
GROUP BY noCli
HAVING SUM((DATEDIFF(DAY, depart, ISNULL(retour, GETDATE()))+1)*prixJour)>=450
INTERSECT
SELECT t.nocli
FROM (
	SELECT noCli, SUM((DATEDIFF(DAY, depart, ISNULL(retour, GETDATE()))+1)*prixJour) montantTotal
	FROM fiches f
	INNER JOIN lignesFic l ON f.noFic = l.noFic
	INNER JOIN articles a ON l.refart = a.refart
	INNER JOIN grilleTarifs g ON a.codeCate = g.codeCate AND a.codeGam = g.codeGam
	INNER JOIN tarifs t ON g.codeTarif = t.codeTarif
	GROUP BY noCli
) t INNER JOIN (
	SELECT noCli, SUM((DATEDIFF(DAY, depart, ISNULL(retour, GETDATE()))+1)*prixJour) montantSki
	FROM fiches f
	INNER JOIN lignesFic l ON f.noFic = l.noFic
	INNER JOIN articles a ON l.refart = a.refart
	INNER JOIN grilleTarifs g ON a.codeCate = g.codeCate AND a.codeGam = g.codeGam
	INNER JOIN tarifs t ON g.codeTarif = t.codeTarif
	INNER JOIN categories c ON g.codeCate = c.codeCate
	WHERE c.codeCate = 'SA'
	GROUP BY noCli
) s ON t.noCli = s.noCli
WHERE montantSki > 0.6 * montantTotal;
go



--Version 4 : stockage des requetes complexes dans une vue

-- cette requête est écrite dans la syntaxe courante des jointures, afin que vous soyez capable de la reconnaitre
create view ClientsFideles
	as
	select nocli,nom,prenom,adresse,cpo,ville
	from clients
	where nocli in	(
						select ski.nocli
							from	(
										-- ca categorie ski
										select
											f.nocli,sum(prixjour * (datediff(day,depart,coalesce(retour,getdate())) +1)) as montant
										from
											fiches f,lignesfic l,articles a,grilletarifs g,tarifs t
										where
											f.nofic=l.nofic and
											l.refart=a.refart and
											a.codecate=g.codecate and a.codeGam=g.codeGam and
											g.codetarif=t.codetarif and a.codecate='SK' and
											l.depart >= dateadd(month,-12,getdate())
										group by
											f.nocli,f.nofic
									) ski,
									(
										-- ca toute catégorie confondue
										select
											f.nocli,sum(prixjour * (datediff(day,depart,coalesce(retour,getdate())) +1)) as montant
										from
											fiches f,lignesfic l,articles a,grilletarifs g,tarifs t
										where
											f.nofic=l.nofic and
											l.refart=a.refart and
											a.codecate=g.codecate and a.codeGam=g.codeGam and
											g.codetarif=t.codetarif and
											l.depart >= dateadd(month,-12,getdate())
										group by
											f.nocli,f.nofic
									) divers
						where 
							ski.nocli = divers.nocli and 
							ski.montant >= (0.6 * divers.montant) and
							divers.montant >= 450
					)
;
go

select * from ClientsFideles;


-- 18.	Tableau de bord des chiffres d'affaire par catégorie
---------------------------------------------------------

--Version 1 : Utilisation des sous requetes + union

select 
	c.libelle as Categories,
	sum(Mois1) as Mois1,sum(Mois2) as Mois2,sum(Mois3) as Mois3,
	sum(Mois4) as Mois4,sum(Mois5) as Mois5,sum(Mois6) as Mois6,
	sum(coalesce(Mois1,0)+coalesce(Mois2,0)+coalesce(Mois3,0)+coalesce(Mois4,0)+coalesce(Mois5,0)+coalesce(Mois6,0)) as Total
from 
	categories c,
	(
		select
			a.codecate,null as Mois1,null as Mois2,null as Mois3,null as Mois4,null as Mois5,sum(prixjour * (datediff(day,depart,coalesce(retour,getdate())) +1)) as Mois6
		from
			fiches f,lignesfic l,articles a,grilletarifs g,tarifs t
		where
			f.nofic=l.nofic and
			l.refart=a.refart and
			a.codecate=g.codecate and a.codeGam=g.codeGam and
			g.codetarif=t.codetarif and f.etat!='EC' and
			month(l.depart) = month(dateadd(month,-5,getdate()))
		group by
			a.codecate
	union
		select
			a.codecate,null as Mois1,null as Mois2,null as Mois3,null as Mois4,sum(prixjour * (datediff(day,depart,coalesce(retour,getdate())) +1)) as Mois5,null as Mois6
		from
			fiches f,lignesfic l,articles a,grilletarifs g,tarifs t
		where
			f.nofic=l.nofic and
			l.refart=a.refart and
			a.codecate=g.codecate and a.codeGam=g.codeGam and
			g.codetarif=t.codetarif and f.etat!='EC' and
			month(l.depart) = month(dateadd(month,-4,getdate()))
		group by
			a.codecate
	union
		select
			a.codecate,null as Mois1,null as Mois2,null as Mois3,sum(prixjour * (datediff(day,depart,coalesce(retour,getdate())) +1)) as Mois4,null as Mois5,null as Mois6
		from
			fiches f,lignesfic l,articles a,grilletarifs g,tarifs t
		where
			f.nofic=l.nofic and
			l.refart=a.refart and
			a.codecate=g.codecate and a.codeGam=g.codeGam and
			g.codetarif=t.codetarif and f.etat!='EC' and
			month(l.depart) = month(dateadd(month,-3,getdate()))
		group by
			a.codecate
	union
		select
			a.codecate,null as Mois1,null as Mois2,sum(prixjour * (datediff(day,depart,coalesce(retour,getdate())) +1)) as Mois3,null as Mois4,null as Mois5,null as Mois6
		from
			fiches f,lignesfic l,articles a,grilletarifs g,tarifs t
		where
			f.nofic=l.nofic and
			l.refart=a.refart and
			a.codecate=g.codecate and a.codeGam=g.codeGam and
			g.codetarif=t.codetarif and f.etat!='EC' and
			month(l.depart) = month(dateadd(month,-2,getdate()))
		group by
			a.codecate
	union
		select
			a.codecate,null as Mois1,sum(prixjour * (datediff(day,depart,coalesce(retour,getdate())) +1)) as Mois2,null as Mois3,null as Mois4,null as Mois5,null as Mois6
		from
			fiches f,lignesfic l,articles a,grilletarifs g,tarifs t
		where
			f.nofic=l.nofic and
			l.refart=a.refart and
			a.codecate=g.codecate and a.codeGam=g.codeGam and
			g.codetarif=t.codetarif and f.etat!='EC' and
			month(l.depart) = month(dateadd(month,-1,getdate()))
		group by
			a.codecate
	union
		select
			a.codecate,sum(prixjour * (datediff(day,depart,coalesce(retour,getdate())) +1)) as Mois1,null as Mois2,null as Mois3,null as Mois4,null as Mois5,null as Mois6
		from
			fiches f,lignesfic l,articles a,grilletarifs g,tarifs t
		where
			f.nofic=l.nofic and
			l.refart=a.refart and
			a.codecate=g.codecate and a.codeGam=g.codeGam and
			g.codetarif=t.codetarif and f.etat!='EC' and
			month(l.depart) = month(getdate())
		group by
			a.codecate
	) a
where a.codecate=c.codecate
group by c.libelle with rollup;


-- Version 2 : table CTE + Pivot (RI page 134)


WITH CaCategParMois1 (Codecate, mois, ca) as
(
	select		coalesce(a.codeCate,' Total mois'),coalesce(datediff(month,datecrea,getdate()),7) as mois,
				sum((datediff(day,depart,isnull(retour,GETDATE())) + 1)*prixjour) as ca
		from	fiches f, lignesfic l, articles a, grilletarifs g, tarifs t
		where	l.nofic=f.nofic and a.refart=l.refart and g.codecate=a.codecate 
				and g.codeGam=a.codeGam and t.codetarif=g.codetarif
				and etat != 'EC'
		group by a.codeCate,datediff(month,datecrea,getdate())
		--faire les totaux généraux par mois et par catégorie
		with cube
)
-- select * from CaCategParMois1

-- pivoter les infos par rapport au mois et faire les totaux par ligne
select Codecate, [1] as mois1, [2] as mois2,[3] as mois3, [4] as mois4,
		[5] as mois5, [6] as mois6, [7] as 'Total categorie' 
from CaCategParMois1
	pivot(sum(ca) for mois in ([1],[2],[3],[4],[5],[6],[7])) as pvt
order by 1 desc;