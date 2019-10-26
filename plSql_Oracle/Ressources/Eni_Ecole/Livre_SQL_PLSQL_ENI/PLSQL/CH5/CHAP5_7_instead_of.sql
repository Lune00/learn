create or replace view vcdelig (nocde, datecde, nolig, refart, qtecde) as
  select l.nocde, datecde, nolig, refart, qtecde
  from commandes c, ligcdes l
  where c.nocde=l.nocde;
create or replace trigger inst_del_vcdelig
  instead of delete
  on vcdelig
  for each row
  declare
    vbidon number(5);
  begin
    delete from ligcdes
      where nocde=:old.nocde
      and nolig=:old.nolig;
    -- si dernière ligne alors suprimer la commande
    select count(*) into vbidon
      from ligcdes
      where nocde=:old.nocde;
  exception
    when no_data_found then
      delete from commandes where nocde=:old.nocde;
  end;
/