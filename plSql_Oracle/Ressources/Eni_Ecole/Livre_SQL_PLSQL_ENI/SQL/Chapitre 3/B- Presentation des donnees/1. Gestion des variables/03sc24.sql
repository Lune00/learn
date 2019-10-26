var ncli number
variable
begin
  select count(*) into :ncli
    from clients;
end;
/
print ncli
