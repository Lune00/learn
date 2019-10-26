SELECT isbn, exemplaire, count(*)
  FROM details
  group by isbn, exemplaire;
  
SELECT * FROM
(SELECT isbn, exemplaire, count(*) as qte FROM details group by isbn, exemplaire)
PIVOT(sum(qte) FOR exemplaire in (1, 2));