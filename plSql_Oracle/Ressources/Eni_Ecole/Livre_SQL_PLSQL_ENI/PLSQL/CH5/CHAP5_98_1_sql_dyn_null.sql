declare
  c_null char(1); --la variable est initialis�e � NULL
begin
  execute immediate 'UPDATE clients set ville=:x' using c_null;
end;