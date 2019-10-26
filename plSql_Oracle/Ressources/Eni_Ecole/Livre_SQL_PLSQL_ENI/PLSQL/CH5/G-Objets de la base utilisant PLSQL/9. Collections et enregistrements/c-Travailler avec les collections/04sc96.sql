BEGIN
  INSERT INTO depot
    VALUES (1,'Paris',
       Tabstock(Typestock('ZZ01',250),
                        Typestock('AB01',500)));
  INSERT INTO depot
    VALUES (2,'LYON',
       Tabstock(Typestock('ZZ01',100),
                        Typestock('AB01',300)));
END;