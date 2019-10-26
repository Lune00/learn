create table table1(col1 number, col2 char(30));
create table table2(col1 number, col2 char(30));

declare
  type tableauRec is table of table1%rowtype;
  type tableauNumerique is table of number;
  type tableauCaracteres is table of char(30);
  cursor ctable2 is select col1, col2 from table2;

  tabrec 	tableauRec;
  tabnum 	tableauNumerique:=tableauNumerique(2,3,5);
  tabCar	tableauCaracteres:=tableauCaracteres('Godel','Escher','Bach');
begin
  -- jaouter des donn�es dans la table1
  forall i in 1..3
    insert into table1 values (tabnum(i), tabcar(i));

  -- ajouter des donn�es dans le tableau des enregistrements
  select col1, col2 bulk collect into tabrec from table1;

  -- ins�rer des donn�es dans la table2
  forall i in tabrec.first..tabrec.last
    insert into table2 values tabrec(i);

  -- mettre � jour les donn�es dans le tableau des enregistrements
  for i in tabrec.first..tabrec.last loop
    tabrec(i).col1:=tabrec(i).col1*2;
  end loop;

  -- utilisation du curseur
  open ctable2;
  fetch ctable2 bulk collect into tabrec;
  close ctable2;

end;
/
select * from table1;
select * from table2;
drop table table1;
drop table table2;