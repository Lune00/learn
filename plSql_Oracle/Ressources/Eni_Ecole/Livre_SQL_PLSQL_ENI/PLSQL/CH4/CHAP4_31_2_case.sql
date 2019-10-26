declare
  departement number:=44;
  libelle varchar2(40);
begin
  case departement
    when 44 then libelle:='Loire Atlantique';
    when 49 then libelle:='Maine et Loire';
    when 53 then libelle:='Mayenne';
    when 72 then libelle:='Sarthe';
    when 85 then libelle:='Vendée';
    else libelle:='Hors Region';
  end case;
end;
/