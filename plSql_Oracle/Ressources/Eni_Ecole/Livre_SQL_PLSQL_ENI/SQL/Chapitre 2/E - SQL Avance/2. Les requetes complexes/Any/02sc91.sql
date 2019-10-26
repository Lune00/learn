select refart, designation, prix, qtestk from articles
where prix=ANY(select prix from articles
               where refart='ZZ01');
