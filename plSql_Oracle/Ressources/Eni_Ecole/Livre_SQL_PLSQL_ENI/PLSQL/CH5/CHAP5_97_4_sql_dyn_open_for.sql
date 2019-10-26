declare
  type CliCurTyp is ref cursor;
  ccli CliCurTyp;  -- variable curseur
  vno clients.nocli%type;
  vville clients.ville%type:='Nantes';
begin
  open ccli for 'Select nocli, ville from clients where ville=:v' 
    using vville;
  loop
    fetch ccli into vno, vville; --ramener la ligne suivante
    exit when ccli%notfound; --quitter la boucle si plus de lignes
    --traiter les informations
  end loop;
  close ccli;
end;
/