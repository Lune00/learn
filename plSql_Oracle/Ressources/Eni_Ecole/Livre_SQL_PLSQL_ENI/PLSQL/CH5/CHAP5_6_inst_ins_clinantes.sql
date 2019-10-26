create or replace trigger inst_ins_clinantes
  instead of insert 
  on clinantes for each row
begin
  insert into clients (nocli, nomcli, adrcli, code_postal, ville)
  values (:new.nocli, :new.nomcli, :new.adrcli, 44000,'Nantes');
end;
/