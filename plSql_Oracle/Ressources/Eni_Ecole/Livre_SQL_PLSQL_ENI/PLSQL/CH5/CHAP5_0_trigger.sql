create or replace trigger post_majprix
  after update of prix
  on articles
  for each row
  when (old.prix>new.prix)
begin
  raise_application_error(-20001,'Impossible de réduire');
end;