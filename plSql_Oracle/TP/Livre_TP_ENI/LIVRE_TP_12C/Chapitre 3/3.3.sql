SELECT *
FROM ouvrages
WHERE isbn not in (SELECT isbn 
FROM exemplaires 
WHERE etat='NE');
