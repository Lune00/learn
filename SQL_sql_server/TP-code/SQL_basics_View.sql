use dvd_location;

--On cree une view: masque la complexite d'une requete, gain de perf( le resulat est mis en cache et connu a l'avance), clean
CREATE VIEW my_view
AS
SELECT dvd.titre,clients.date_naissance AS 'Date de naissance du client', genres_film.signification AS 'Genre'
	FROM clients 
	INNER JOIN factures ON factures.code_client = clients.code_client
	INNER JOIN locations ON locations.num_facture = factures.num_facture
	INNER JOIN dvd ON locations.num_dvd = dvd.num_dvd
	INNER JOIN genres_film ON dvd.code_genre = genres_film.code_genre
	WHERE clients.titre = 'M.' 
		AND YEAR(clients.date_naissance) between 1960 AND 1969
		AND dvd.code_genre='AV';
GO

--Se manipule comme une table mais en LECTURE SEULEMENT (pas d'update ou de delete possible)
SELECT * FROM my_view;
--Se met automatiquement a jour lorsqu'une table sur laquelle elle opere est modifiée
UPDATE dvd set titre='Les4mousquetaires' WHERE titre='Les3moutquetaires';

-- Transactions:
BEGIN TRAN ma_transaction
	SELECT * FROM dvd where titre LIKE 'b%';;
	UPDATE dvd set titre='RIEN' where titre LIKE 'b%';
	SELECT * FROM dvd where titre LIKE 'RIEN';
ROLLBACK TRAN ma_transaction; --annule la transaction
-- On commit la transaction: pas de retour en arriere possible
COMMIT TRAN ma_transaction; -- a mettre a la place de rollback


--tester apres annulation de la transaction
SELECT * FROM dvd where titre='RIEN';


--Trigger :

CREATE TRIGGER mon_trigger
	--ecoute un evenement sur une table, si remplit une condition/type action (INSERT,UPDATE...) je fais une action
	--insertion est faite et apres je fais une action (BEFORE/AFTER avant ou apres la requete eecoutée)
	ON clients AFTER INSERT, UPDATE AS
		--SQL REQUEST
		UPDATE clients SET nom='Je te vois ' + (SELECT nom FROM inserted) + ' !';
GO

DROP TRIGGER mon_trigger

SELECT * FROM clients WHERE code_client='ALAK11' 

INSERT INTO clients
	VALUES('ALAK13','M.','Paul','Schuhmacher','Rue Morand','44000','Nantes','blablabla','1990-06-21',0);


