DELETE FROM membres
WHERE numero IN (SELECT DISTINCT membre
FROM emprunts
GROUP BY membre
HAVING MAX(creele)<add_months(sysdate,-36));
