select refart, prix
from articles
order by substr(refart,1,2), prix desc;