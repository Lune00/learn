CREATE OR REPLACE PACKAGE pkg_test IS
  mesAmis Noms:=Noms('Dupont',
	'Durand',
	'Martin');
  sesAmis Noms:=Noms('Dupont',
	'Dupond',
	'Sansos',
	'Lefevre',
	'Merault');
  procedure affiche(liste in Noms);
end;
