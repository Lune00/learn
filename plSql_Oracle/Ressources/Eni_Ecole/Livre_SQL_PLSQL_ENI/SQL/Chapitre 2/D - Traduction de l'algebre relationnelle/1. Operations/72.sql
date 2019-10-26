select substr(refart,1,2), max(prix), min(prix)
from articles 
group by substr(refart,1,2)
having min(prix)>300;