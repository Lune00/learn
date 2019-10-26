declare
  type TCLIREC is record(
    nocli   number(4),
    nom	    char(20),
    adr     char(20),
    codpost number(5));
  unclient tclirec;
begin
  -- instructions
  unclient.nocli:=1024;
  -- instructions
end;
/