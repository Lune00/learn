Select avg(rendule-creele) as "Duree moyenne"
From emprunts inner join details ON  emprunts.numero=details.emprunt 
Where rendule is not null;
