declare
  vcli clients%rowtype;
begin
  -- renseigner les diff�rents champs de la variable structur�e
  vcli.nocli  :=100;
  vcli.nomcli :='MOORE';
  vcli.adrcli :='13 rue de la croissance';
  vcli.code_postal:='69004';
  vcli.ville:='LYON';

  -- ins�rer ces donn�es ds la table des clients
  insert into clients values vcli;
end;
/