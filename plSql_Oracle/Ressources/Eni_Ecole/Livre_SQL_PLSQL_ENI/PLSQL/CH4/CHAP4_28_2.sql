-- script pour la mise � jour � partir d'une variable structur�
declare
  vcli clients%rowtype;
begin
  -- initialiser la variable vcli
  select * into vcli
  from clients
  where nocli=100;
  -- mettre � jour les donn�es
  vcli.nomcli:='Newton';
  -- mise � jour des informations dans la abse
  update clients
    set row=vcli
    where nocli=100;
end;
/
