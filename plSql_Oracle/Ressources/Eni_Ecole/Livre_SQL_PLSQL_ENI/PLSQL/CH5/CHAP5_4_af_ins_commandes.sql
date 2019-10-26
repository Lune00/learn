create or replace trigger af_ins_commandes
  after insert
  on commandes for each row
declare
  vnbre stat_util.nombre%type;
begin
  -- connaitre le nombre actuel pour l'utlisateur courant
  select nombre into vnbre
  from stat_util
  where utilisateur=:new.utilisateur;
  -- mettre à jour la valeur
  update stat_util
  set nombre=vnbre+1
  where utilisateur=:new.utilisateur;
exception
  when no_data_found then
    insert into stat_util (utilisateur, nombre)
    values (:new.utilisateur,1);
end;
/