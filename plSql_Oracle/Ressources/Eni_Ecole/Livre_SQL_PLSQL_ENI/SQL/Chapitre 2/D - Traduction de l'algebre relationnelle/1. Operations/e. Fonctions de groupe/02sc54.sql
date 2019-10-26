select rtrim(ville), count(*)
from clients
group by rtrim(ville);
