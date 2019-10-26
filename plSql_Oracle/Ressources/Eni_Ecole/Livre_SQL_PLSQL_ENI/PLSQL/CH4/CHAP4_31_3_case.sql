declare
  departement number:=44;
  region varchar2(40);
begin
  case 
    when departement in (18,28,36,37,41,45) 
      then region:='Centre';
    when departement in (75,77,78,91,92,93,94,95)
      then region:='Ile de France';
    when departement in (44,49,53,72,85) 
      then region:='Pays de la loire';
  end case;
end;
/