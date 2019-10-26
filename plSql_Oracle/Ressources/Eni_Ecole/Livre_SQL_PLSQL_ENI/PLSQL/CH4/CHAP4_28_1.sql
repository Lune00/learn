declare
  vcli clients%rowtype;
begin
  -- renseigner les différents champs de la variable structurée
  vcli.nocli  :=100;
  vcli.nomcli :='MOORE';
  vcli.adrcli :='13 rue de la croissance';
  vcli.code_postal:='69004';
  vcli.ville:='LYON';

  -- insérer ces données ds la table des clients
  insert into clients values vcli;
end;
/