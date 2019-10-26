  select membres.*, ouvrages.titre, sysdate - creele as "durée en jours"
from membres inner join emprunts on emprunts.membre=membres.numero 
  inner join details on details.emprunt=emprunts.numero
  inner join ouvrages on details.isbn=ouvrages.isbn
where sysdate - creele > 14
  and details.rendule is null;