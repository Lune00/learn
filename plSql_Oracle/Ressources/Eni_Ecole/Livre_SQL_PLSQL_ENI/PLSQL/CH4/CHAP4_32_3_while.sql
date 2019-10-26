declare
  x number;
begin
  x:=200;
  
  while (x<=210) loop
    insert into clients(nocli) values(x);
    x:=x+1;
  end loop;
end;
/