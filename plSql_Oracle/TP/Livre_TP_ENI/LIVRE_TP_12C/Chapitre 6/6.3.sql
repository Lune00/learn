CREATE OR REPLACE TRIGGER af_upd_details
  AFTER UPDATE ON details
  FOR EACH ROW
  WHEN ((old.isbn !=new.isbn) OR (old.exemplaire !=new.exemplaire))
BEGIN
  IF ( :old.isbn != :new.isbn) THEN
      RAISE_APPLICATION_ERROR(-20400,
        'impossible de changer d''ouvrage') ;
  ELSE
      RAISE_APPLICATION_ERROR(-20401,
        'impossible de changer d''exemplaire') ;
    END IF;
END ;
/
