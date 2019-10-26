DECLARE
  stock_temoin TabStock:=Tabstock(
    TypeStock('AB21',200),
    TypeStock('ZZ01',300),
    TypeStock('VELO',550));
  ecart integer;
BEGIN
  SELECT count(*) INTO ecart
  FROM TABLE(CAST(stock_temoin AS TabStock)) as temoin,
               TABLE(SELECT stock FROM depot WHERE nom='LYON') as test
  WHERE temoin.refart!=test.refart;
END;
/