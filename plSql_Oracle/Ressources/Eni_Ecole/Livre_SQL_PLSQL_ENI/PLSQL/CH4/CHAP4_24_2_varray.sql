declare
  type calendrier is varray(366) of date;
  -- declare et initialise la collection
  annee calendrier:= calendrier(to_date('01/01/2002','DD/MM/YYYY'));
begin
  --changement de la valeur
  annee(1):=to_date('02/02/2002','DD/MM/YYYY');
end;
/