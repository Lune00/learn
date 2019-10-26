SELECT DISTINCT auteur
FROM ouvrages
WHERE REGEXP_LIKE( auteur, '^[[:alpha:]]*[[:space:]]de[[:space:]][[:alpha:]]+$');

