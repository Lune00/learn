declare
  cursor c1 is select * from articles;
  vart c1%rowtype;
  depassement exception;
  nvprix number;
begin

  open c1;
  fetch c1 into vart;

  while c1%found loop
    nvprix:=vart.prix*2;
    if nvprix>2000 then
      raise depassement;
    end if;
    update articles set prix=nvprix where refart=vart.refart;
    fetch c1 into vart;
  end loop;
  close c1;

exception
  when depassement then
    rollback;
end;
/