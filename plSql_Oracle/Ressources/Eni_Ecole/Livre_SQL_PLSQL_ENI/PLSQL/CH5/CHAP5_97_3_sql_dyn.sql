DECLARE
  bloc_pl varchar2(200);
  vnocde commandes.nocde%type;
  vnocli commandes.nocli%type;
BEGIN
  bloc_pl:='BEGIN ajout_cde(:a,:b); END;';
  EXECUTE IMMEDIATE bloc_pl
    USING IN OUT vnocde, vnocli;
END;
/