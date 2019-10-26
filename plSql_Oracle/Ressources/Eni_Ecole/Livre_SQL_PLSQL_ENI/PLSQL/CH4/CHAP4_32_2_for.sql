begin
  for n in 1..100 loop
    insert into clients(nocli) values(n);
  end loop;
end;
/