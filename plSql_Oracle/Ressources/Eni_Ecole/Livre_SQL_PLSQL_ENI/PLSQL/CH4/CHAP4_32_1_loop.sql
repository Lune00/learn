declare
  x number;
begin
  x:=0;
  <<incrementation>>
  loop
    x:=x+1;
    exit incrementation when x>10;
    insert into clients(nocli) values(x);
  end loop incrementation;
end;
/