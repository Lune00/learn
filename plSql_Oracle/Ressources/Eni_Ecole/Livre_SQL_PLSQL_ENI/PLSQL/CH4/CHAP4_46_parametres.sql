declare
  cursor c1(numero number) is
    select nocde, datecde
      from commandes
     where nocli=numero;
  vc1 c1%rowtype;
begin
  -- ouverture du curseur
  open c1(1);
  -- traitement des informations
  fetch c1 into vc1;
  -- fermeture du curseur
  close c1;
end;
/