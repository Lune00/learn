merge into employes e
  using (select numero, age from tinfo) t
  on (t.numero=e.numero)
  WHEN MATCHED THEN UPDATE SET salaire=salaire*1.04 
    WHERE (t.age>40)
  DELETE WHERE (t.age>65);