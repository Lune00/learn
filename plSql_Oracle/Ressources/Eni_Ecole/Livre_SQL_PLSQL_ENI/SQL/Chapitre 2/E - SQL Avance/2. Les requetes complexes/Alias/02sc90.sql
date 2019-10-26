update articles a
  set qtestk=(select max (qtestk) from articles b
              where substr(a.refart,1,2)=substr(b.refart,1,2));
select refart, designation, prix, qtestk
  from articles;