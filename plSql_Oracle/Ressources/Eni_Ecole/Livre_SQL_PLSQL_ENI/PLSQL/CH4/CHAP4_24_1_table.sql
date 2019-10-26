declare
  -- la collection de type nested table
  type grille is table of number;
  -- la collection de type index by table
  type rendezvous is table of date index by binary_integer;
  -- les variables
  lotto grille;
  agenda rendezvous;
begin
  -- les numeros à jouer
  lotto:=grille(44,37,25,17);
  -- ajouter un rendez vous
  agenda(2):=to_date('27/05/2001 11:30','DD/MM/YYYY HH24:MI');
end;
/