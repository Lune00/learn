declare
  vnocde commandes.nocde%type;
begin
  vnocde:=100;
  -- la commande possède t elle des lignes ?
  -- si oui alors les supprimer
  declare
    vnbre integer;
  begin
    select count(*) into vnbre
    from commandes where nocde = vnocde;
    -- vnbre contient le nombre de lignes de la commande
    if vnbre>0 then
      -- lever une exception prédéfionie
      raise too_many_rows;
    end if;
  exception
    when too_many_rows then
      -- supprimer les lignes de commandes
      delete from ligcdes where nocde=vnocde;
      -- lever une exception pour la communiquer au bloc supérieur
      raise no_data_found;
  end;
exception
  when no_data_found then
    delete from commandes where nocde=vnocde;
end;
/