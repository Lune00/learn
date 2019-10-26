SELECT *
FROM exemplaires e
WHERE NOT EXISTS(
SELECT *
FROM details d
WHERE MONTHS_BETWEEN(sysdate,rendule)<3
AND d.isbn=e.isbn
AND d.exemplaire=e.numero);
