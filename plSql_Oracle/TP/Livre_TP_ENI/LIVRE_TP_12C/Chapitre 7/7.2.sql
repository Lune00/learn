ALTER TABLE resultats
  ADD bonification number(6) null;
ALTER TABLE resultats
  ADD points number(3) null;
ALTER TABLE etapes 
  ADD CONSTRAINT un_resultats_jour UNIQUE (jour);
