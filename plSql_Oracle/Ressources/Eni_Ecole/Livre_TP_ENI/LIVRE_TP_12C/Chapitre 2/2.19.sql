Create global temporary table SyntheseEmprunts (
Isbn char(10),
Exemplaire number(3),
nombreEmpruntsExemplaire number(10),
nombreEmpruntsOuvrage number(10))
on commit preserve rows;


Insert into SyntheseEmprunts(isbn, exemplaire, nombreEmpruntsExemplaire)
Select isbn, numero, count(*)
From details
Group by isbn, numero;


Update SyntheseEmprunts
Set nombreEmpruntsOuvrage=(select count(*) from details where details.isbn=SyntheseEmprunts.isbn);

COMMIT;

Delete from SyntheseEmprunts;