SELECT isbn, titre
FROM ouvrages
WHERE lower(titre) LIKE '%mer%';
