create table employe 
(noemp  number(6),
  salaire      number(8,2)
);


insert into employe (noemp,salaire) values (1,1200);

insert into employe (noemp,salaire) values (2,1800);




create or replace trigger trace_modification_salaire

  for update of salaire on employe

  compound trigger

    cumul number := 0;

    procedure affiche(texte varchar2)
    is

    begin
 
     dbms_output.put_line(texte);

    end affiche;

  after each row is

    delta number;

  begin
 
   delta := :new.salaire - :old.salaire;

    affiche(:new.noemp || ' : ' || delta);
    cumul := cumul + delta;

  end after each row;

  after statement is

  begin

    affiche('Total : ' || cumul);
  
  end after statement;

end trace_modification_salaire;

/


set serveroutput on

select NOEMP,SALAIRE from EMPLOYE;

update EMPLOYE set SALAIRE = SALAIRE * 1.01;
 


drop table employe purge;
