variable x number
define t= clients
begin
  select count(*) into :x from &t;
end;
/
print x
