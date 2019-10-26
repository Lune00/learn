SELECT exemplaires.isbn
FROM emprunts inner join details on details.emprunt=emprunts.numero
inner join exemplaires on details.exemplaire=exemplaires.numero
                    AND  details.isbn=exemplaires.isbn
WHERE MONTHS_BETWEEN(emprunts.creele, sysdate)<12
GROUP BY exemplaireS.isbn
HAVING count(*)>10;

