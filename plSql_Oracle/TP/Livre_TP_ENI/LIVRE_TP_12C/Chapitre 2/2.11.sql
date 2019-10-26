Select genre, count(*) as nombre 
from exemplaires inner join ouvrages
on ouvrages.isbn=exemplaires.isbn
group by genre;
