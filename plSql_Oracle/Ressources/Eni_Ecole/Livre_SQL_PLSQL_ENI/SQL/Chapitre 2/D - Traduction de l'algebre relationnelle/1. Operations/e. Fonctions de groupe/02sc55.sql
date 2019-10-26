select * from articles;
select substr(refart,1,2), max(prix), avg(qtestk)
from articles 
group by substr(refart,1,2);
