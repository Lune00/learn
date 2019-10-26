SELECT ouvrages.*, exemplaires.numero
FROM ouvrages left outer join exemplaires on
ouvrages.isbn=exemplaires.isbn;