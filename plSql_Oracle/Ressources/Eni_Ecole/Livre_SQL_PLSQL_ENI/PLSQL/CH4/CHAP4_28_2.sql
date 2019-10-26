-- script pour la mise à jour à partir d'une variable structuré
declare
  vcli clients%rowtype;
begin
  -- initialiser la variable vcli
  select * into vcli
  from clients
  where nocli=100;
  -- mettre à jour les données
  vcli.nomcli:='Newton';
  -- mise à jour des informations dans la abse
  update clients
    set row=vcli
    where nocli=100;
end;
/
