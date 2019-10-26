declare
 b blob;
 c clob;
begin
  -- creation des élément temporaires
  dbms_lob.createtemporary(b, true);
  dbms_lob.createtemporary(c,true);
  -- test et suppression
  if (dbms_lob.istemporary(b)=1) then
    dbms_lob.freetemporary(b);
  end if;
  
  if (dbms_lob.istemporary(c)=1) then
    dbms_lob.freetemporary(c);
  end if;
end;
/