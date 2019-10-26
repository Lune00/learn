create or replace trigger bf_ins_commandes
  before insert
  on commandes 
  referencing new as nouvelle
  for each row
begin
  select user into :nouvelle.utilisateur from dual;
end;
/