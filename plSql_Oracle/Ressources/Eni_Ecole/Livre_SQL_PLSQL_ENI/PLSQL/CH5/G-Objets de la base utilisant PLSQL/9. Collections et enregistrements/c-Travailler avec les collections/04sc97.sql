DECLARE
  nouveau_stock Tabstock:=Tabstock(
    Typestock('ZZ21',200),
    Typestock('AB01',100));
BEGIN
  UPDATE depot 
    SET stock=nouveau_stock WHERE codedepot=1;
END;