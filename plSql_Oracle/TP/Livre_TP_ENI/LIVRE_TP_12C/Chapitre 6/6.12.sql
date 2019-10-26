alter table ouvrages
modify isbn number(13) not null;
alter table exemplaires 
modify isbn number(13) not null;
alter table details
modify isbn number(13);

alter table DenombreExemplaires
modify isbn number(13);
alter table SyntheseEmprunts
modify isbn number(13);

alter table ouvrages
add ean13 number(13) null;

create or replace
function isbn10VersEan13(isbn number) return number as
  vean13 number(13);
  vSommeControle number(10);
  vCoefficient number(1);
  vNombre number(13);
  vDiviseur number(13);
  vChiffre number(1);
  i number(1);
begin
	vean13:=978;
	vDiviseur:=1000000000;
	vNombre:=isbn;
	vSommeControle:=9+3*7+8;
	vCoefficient:=3;
	for i in 1..9 loop
		vChiffre:=floor(vNombre/vDiviseur);
		vean13:=vean13*10+vChiffre;
		vNombre:=mod(isbn,vDiviseur);
		vDiviseur:=vDiviseur/10;
		vSommeControle:=vSommeControle+vCoefficient*vChiffre;
		if (vCoefficient=1) then vCoefficient:=3;
		else vCoefficient:=1;
    end if;
	end loop;
  if (mod (vsommecontrole,10)=0) then
    vchiffre:=0;
  else
    vChiffre:=10-MOD(vSommecontrole,10);
  end if;
	vean13:=vean13*10+vChiffre;
	return  vean13;
end;
/


create or replace trigger bf_ins_ouvrages
  before insert on ouvrages 
  for each row
declare 
	vtest number(10);
begin
	vtest:=:new.isbn;
	if (:new.ean13 is null) then
		:new.ean13:=isbn10VersEan13(:new.isbn);
	end if;
exception
	when value_error then
		:new.ean13:=:new.isbn;
end;  
/
