create or replace procedure afficheClob(chaine in out nocopy CLOB) is
  chaineXml varchar2(32767);
  ligne varchar2(2000);
begin
  -- copier le document CLOB dans un VARCHAR2
  chaineXml:=dbms_lob.SUBSTR(chaine, 32767);
  loop
    exit when chaineXml is null;
    -- A la recharehce des fins de ligne
    ligne:=substr(chaineXml,1,instr(chaineXml,chr(10))-1);
    dbms_output.put_line('| '||ligne);
    chaineXml:=substr(chaineXml, instr(chaineXml,chr(10))+1);
  end loop;
end;
/