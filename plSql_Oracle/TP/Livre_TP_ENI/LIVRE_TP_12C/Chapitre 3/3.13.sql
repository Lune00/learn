SELECT ouvrages.isbn, ouvrages.titre, CASE count(*)
WHEN 0 THEN 'Aucun'
WHEN 1 THEN 'Peu'
WHEN 2 THEN 'Peu'
WHEN 3 THEN ' Normal'
WHEN 4 THEN ' Normal'
WHEN 5 THEN 'Normal'
ELSE 'Beaucoup'
END as "Nombre Exemplaires"
FROM ouvrages inner join exemplaires on  ouvrages.isbn=exemplaires.isbn
GROUP BY ouvrages.isbn, ouvrages.titre;
