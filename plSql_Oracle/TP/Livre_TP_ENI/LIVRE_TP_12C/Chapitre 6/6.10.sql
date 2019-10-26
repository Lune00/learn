alter table exemplaires
  drop constraint fk_exemplaires_ouvrages;
alter table exemplaires
  add constraint fk_exemplaires_ouvrages 
  foreign key(isbn) 
  references ouvrages(isbn)
  initially deferred;

  create table DenombreExemplaires (
	isbn number(10),
	qte number(5) default 0
);

insert into DenombreExemplaires (isbn, qte)
select isbn, count(*)
  from exemplaires 
  group by isbn;
  
CREATE OR REPLACE TRIGGER af_ins_exemplaires
  AFTER INSERT ON exemplaires
  FOR EACH ROW
BEGIN
  UPDATE DenombreExemplaires SET qte=qte+1 WHERE isbn=:new.isbn;
  IF (SQL%ROWCOUNT=0) THEN
    INSERT INTO DenombreExemplaires(isbn, qte) VALUES (:new.isbn, 1);
  END IF;
END;

CREATE or replace TRIGGER af_del_exemplaires 
  AFTER DELETE ON exemplaires 
  FOR EACH ROW
DECLARE
	vnbre number(3);
BEGIN
  select qte into vnbre from DenombreExemplaires where isbn=:old.isbn;
  if (vnbre=1) THEN
    DELETE FROM ouvrages WHERE isbn= :old.isbn ;
	DELETE FROM DenombreExemplaires WHERE isbn= :old.isbn ;
  else
    update DenombreExemplaires set qte=qte-1 where isbn=:old.isbn;
  end if;
END ;
/