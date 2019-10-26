declare
  subtype datenaissance is date;
  ne_le datenaissance;
begin
  -- mettre la date du jour dans la variable ne_le
  select sysdate 
    into ne_le
    from dual;
end;
/