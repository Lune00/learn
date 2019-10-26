create or replace view NombreEmpruntsParOuvrage as
SELECT isbn, count(*) as NombreEmprunts
FROM  details
GROUP BY  isbn;
