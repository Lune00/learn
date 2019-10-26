insert into genres(code, libelle) values ('REC','Récit');
insert into genres(code, libelle) values ('POL','Policier');
insert into genres(code, libelle) values ('BD','Bande Dessinée');
insert into genres(code, libelle) values ('INF','Informatique');
insert into genres(code, libelle) values ('THE','Théâtre');
insert into genres(code, libelle) values ('ROM','Roman');

insert into ouvrages (isbn, titre, auteur, genre, editeur) 
values (2203314168, 'LEFRANC-L''ultimatum', 'Martin, Carin', 'BD', 'Casterman');
insert into ouvrages (isbn, titre, auteur, genre, editeur) 
values (2746021285, 'HTML entraînez-vous pour maîtriser le code source', 'Luc Van Lancker', 'INF', 'ENI');
insert into ouvrages (isbn, titre, auteur, genre, editeur) 
values (2746026090, ' Oracle 12c SQL, PL/SQL, SQL*Plus', 'J. Gabillaud', 'INF', 'ENI');
insert into ouvrages (isbn, titre, auteur, genre, editeur) 
values (2266085816, 'Pantagruel', 'François RABELAIS', 'ROM', 'POCKET');
insert into ouvrages (isbn, titre, auteur, genre, editeur) 
values (2266091611, 'Voyage au centre de la terre', 'Jules Verne', 'ROM', 'POCKET');
insert into ouvrages (isbn, titre, auteur, genre, editeur) 
values (2253010219, 'Le crime de l''Orient Express', 'Agatha Christie', 'POL', 'Livre de Poche');
insert into ouvrages (isbn, titre, auteur, genre, editeur) 
values (2070400816, 'Le Bourgeois gentilhomme', 'Moliere', 'THE', 'Gallimard');
insert into ouvrages (isbn, titre, auteur, genre, editeur) 
values (2070367177, 'Le curé de Tours', 'Honoré de Balzac', 'ROM', 'Gallimard');
insert into ouvrages (isbn, titre, auteur, genre, editeur) 
values (2080720872, 'Boule de suif', 'Guy de Maupassant', 'REC', 'Flammarion');
insert into ouvrages (isbn, titre, auteur, genre, editeur) 
values (2877065073, 'La gloire de mon père', 'Marcel Pagnol', 'ROM', 'Fallois');
insert into ouvrages (isbn, titre, auteur, genre, editeur) 
values (2020549522, ' L''aventure des manuscrits de la mer morte ', default, 'REC', 'Seuil');
insert into ouvrages (isbn, titre, auteur, genre, editeur) 
values (2253006327, ' Vingt mille lieues sous les mers ', 'Jules Verne', 'ROM', 'LGF');
insert into ouvrages (isbn, titre, auteur, genre, editeur) 
values (2038704015, 'De la terre à la lune', 'Jules Verne', 'ROM', 'Larousse');

insert into exemplaires(isbn, numero, etat) select isbn, 1,'BO' from ouvrages;
insert into exemplaires(isbn, numero, etat) select isbn, 2,'MO' from ouvrages;
delete from exemplaires where isbn=2746021285 and numero=2;
update exemplaires set etat='MO' where isbn=2203314168 and numero=1;
update exemplaires set etat='BO' where isbn=2203314168 and numero=2;
insert into exemplaires(isbn, numero, etat) values (2203314168,3,'NE');




