select * from nomenclature;
create synonym compose for nomenclature;
select compose.refart, compose.designation, nomenclature.nombre, nomenclature.designation
  from compose, nomenclature
  where nomenclature.composant=compose.refart
  order by compose.refart;