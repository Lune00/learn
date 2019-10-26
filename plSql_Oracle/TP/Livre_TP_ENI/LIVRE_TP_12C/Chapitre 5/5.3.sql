CREATE PROCEDURE retourExemplaire
  (visbn in number, vnumero in number) AS
BEGIN
  UPDATE details SET rendule=sysdate 
  WHERE rendule is null
  AND isbn= visbn and exemplaire=vnumero;
END;
/
execute retourexemplaire(2266091611,1);
select * from details
  where isbn=2266091611 and exemplaire=1;