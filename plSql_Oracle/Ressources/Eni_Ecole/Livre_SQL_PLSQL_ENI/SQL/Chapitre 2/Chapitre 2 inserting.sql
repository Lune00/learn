create or replace trigger af_ins_delete
  after insert or delete
  on commandes for each row
declare
  vnbre stat_util.nombre%type;
  vutil stat_util.utilisateur%type;
begin
  select user into vutil from dual;
  -- connaitre le nombre atuel pour l'utilisateur courant
  select nombre into vnbre
  from stat_util
  where utilisateur=vutil;
  --mettre à jour la valeur
  if (inserting) then
    vnbre:=vnbre+1;
  end if;
  if (deleting) then
    vnbre:=vnbre-1;
  end if;
  update stat_util
    set nombre=vnbre
    where utilisateur=vutil;
exception
  when no_data_found then
    if (inserting) then
      insert into stat_util(utilisateur, nombre)
      values (vutil,1);
    else
      null;
    end if;
end;
/
