Select genre,avg(rendule-creele) as "Duree moyenne"
From emprunts inner join  details on emprunts.numero=details.emprunt 
inner join ouvrages on details.isbn=ouvrages.isbn
Where   rendule is not null
Group by genre;