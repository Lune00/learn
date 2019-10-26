declare
  cursor cart is
    select refart, prix from articles
    for update of prix;
  vart cart%rowtype;
begin
  open cart;
  loop
    fetch cart into vart;
    exit when cart%notfound;
    update articles set prix=prix*2
      where current of cart;
  end loop;
  close cart;
end;
/