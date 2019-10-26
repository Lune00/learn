SELECT isbn, exemplaire, COUNT(*) as nombre
FROM details
GROUP BY ROLLUP(isbn, exemplaire);

SELECT isbn, 
DECODE(GROUPING(exemplaire),1,'Tous exemplaires',exemplaire) as exemplaire, COUNT(*) as nombre
FROM details
GROUP BY ROLLUP(isbn, exemplaire);