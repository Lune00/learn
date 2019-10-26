select refart, prix, 
       FIRST_VALUE(refart) 
       OVER(order by prix asc rows unbounded preceding) as moins_cher
from articles
where upper(substr(refart,1,2))='AB';
