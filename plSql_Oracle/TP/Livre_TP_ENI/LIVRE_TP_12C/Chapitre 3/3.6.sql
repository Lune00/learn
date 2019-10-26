SELECT isbn, titre, CASE genre
WHEN 'BD' THEN 'Jeunesse'
WHEN 'INF' THEN 'Professionnel'
WHEN 'POL' THEN 'Adulte'
WHEN 'REC' THEN 'Tous'
WHEN 'ROM' THEN 'Tous'
WHEN 'THE' THEN 'Tous'
END AS "Public"
FROM ouvrages
