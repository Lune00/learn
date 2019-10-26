declare
  -- declaration d'une variable pouvant recevoir une ligne entière de la table articles
  ligart articles%rowtype;
begin
  -- instructions
  select * into ligart
  from articles 
  where refart='AB01';

  ligart.prix=ligart.prix*1.1;

end;
/