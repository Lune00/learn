declare
  a integer;
  b integer;
  c integer;
begin
  a:=3;
  b:=4;
  c:=a+b;
  -- a=3, b=4 et c=7
  declare
    a integer;  -- la variable a du bloc supérieur est masquée
  begin
    a:=5;
    b:=10;
    c:=a+b;
    -- a=5, b=10 et c=15
  end;
  -- a=3, b=10 et c=15
end;
/