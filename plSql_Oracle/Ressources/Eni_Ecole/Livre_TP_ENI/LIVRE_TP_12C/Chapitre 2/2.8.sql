INSERT INTO exemplaires(isbn, numero, etat) VALUES (2203314168,4,'MA');
INSERT INTO exemplaires(isbn, numero, etat) VALUES (2746021285,3,'MA');
commit;
DELETE FROM exemplaires WHERE etat='MA';