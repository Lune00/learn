SELECT genre, count(*)
FROM details inner join ouvrages on details.isbn=ouvrages.isbn
WHERE rendule is not null
AND months_between(trunc(sysdate,'MM'), trunc(rendule,'MM'))=0
GROUP BY genre;

SELECT genre, count(*)as mois1, 0 as mois2, 0 as mois3
FROM details inner join ouvrages on details.isbn=ouvrages.isbn
WHERE rendule is not null
AND months_between(trunc(sysdate,'MM'), trunc(rendule,'MM'))=0
GROUP BY genre;

SELECT genre, 0 as mois1, count(*) as mois2,0 as mois3
FROM details inner join  ouvrages on details.isbn=ouvrages.isbn
WHERE rendule is not null
AND months_between(trunc(sysdate,'MM'), trunc(rendule,'MM'))=1
GROUP BY genre;

SELECT genre, 0 as mois1, 0 as mois2, count(*) as mois3
FROM details inner join  ouvrages on details.isbn=ouvrages.isbn
WHERE rendule is not null
AND months_between(trunc(sysdate,'MM'), trunc(rendule,'MM'))=2
GROUP BY genre;

SELECT genre, count(*)as mois1, 0 as mois2, 0 as mois3
FROM details inner join ouvrages on details.isbn=ouvrages.isbn
WHERE rendule is not null
AND months_between(trunc(sysdate,'MM'), trunc(rendule,'MM'))=0
GROUP BY genre
UNION
SELECT genre, 0 as mois1, count(*) as mois2,0 as mois3
FROM details inner join  ouvrages on details.isbn=ouvrages.isbn
WHERE rendule is not null
AND months_between(trunc(sysdate,'MM'), trunc(rendule,'MM'))=1
GROUP BY genre
UNION
SELECT genre, 0 as mois1, 0 as mois2, count(*) as mois3
FROM details inner join  ouvrages on details.isbn=ouvrages.isbn
WHERE rendule is not null
AND months_between(trunc(sysdate,'MM'), trunc(rendule,'MM'))=2
GROUP BY genre;

CREATE VIEW UnionDetail3Mois AS
SELECT genre, count(*)as mois1, 0 as mois2, 0 as mois3
FROM details inner join ouvrages on details.isbn=ouvrages.isbn
WHERE rendule is not null
AND months_between(trunc(sysdate,'MM'), trunc(rendule,'MM'))=0
GROUP BY genre
UNION
SELECT genre, 0 as mois1, count(*) as mois2,0 as mois3
FROM details inner join  ouvrages on details.isbn=ouvrages.isbn
WHERE rendule is not null
AND months_between(trunc(sysdate,'MM'), trunc(rendule,'MM'))=1
GROUP BY genre
UNION
SELECT genre, 0 as mois1, 0 as mois2, count(*) as mois3
FROM details inner join  ouvrages on details.isbn=ouvrages.isbn
WHERE rendule is not null
AND months_between(trunc(sysdate,'MM'), trunc(rendule,'MM'))=2
GROUP BY genre;

SELECT genre, SUM(mois1) as mois1, SUM(mois2) as mois2, SUM(mois3) as mois3
FROM UnionDetail3Mois
GROUP BY genre;

