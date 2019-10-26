declare
  type rec_art_info is  record(
    refart char(4),
    prix number(8,2)
  );
  art_info rec_art_info;
  
begin
  update articles set prix=prix*1.1
    where refart='AB01'
    returning refart, prix into art_info;
  -- art_info contient les valeurs après mise à jour
end;
/