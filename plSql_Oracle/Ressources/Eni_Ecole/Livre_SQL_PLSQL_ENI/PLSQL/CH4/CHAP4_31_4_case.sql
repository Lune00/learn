set serveroutput on
declare 
  departement number:=44;
  region varchar2(80);
  libelle varchar2(80);
begin
  case 
	when departement in (18,28,36,37,41,45) then 
		region:='Centre';
	when departement in (75,77,78,91,92,93,94,95) then 
		region:='Ile de France';
	when departement in (44,49,53,72,85) then 
		region:='Pays de la loire';
		case departement
		  when 44 then libelle:='Loire Atlantique';
		  when 49 then libelle:='Maine et Loire';
		  when 53 then libelle:='Mayenne';
		  when 72 then libelle:='Sarthe';
		  when 85 then libelle:='Vendée';
		  else libelle:='Hors Region';
		end case;
  end case;
  dbms_output.put_line('region:'||region);
end;
/