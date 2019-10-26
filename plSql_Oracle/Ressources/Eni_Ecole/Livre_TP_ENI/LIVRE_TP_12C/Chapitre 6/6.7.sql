CREATE OR REPLACE FUNCTION analyseActivite(
    vnom in char default null, 
    vjour in date default null)
RETURN number IS
  vresultatDeparts number(6) :=0 ;
  vresultatRetours number(6) :=0 ;
BEGIN
  -- Traiter le cas ou l’analyse porte sur un utilisateur
  IF (vnom is not null AND vjour is null) THEN
    SELECT count(*) INTO vresultatDeparts 
      FROM emprunts
      WHERE ajoutePar=vnom ;
    SELECT count(*) INTO vresultatRetours
      FROM details
      WHERE modifiePar=vnom ;
    -- Retourner le resultat et quitter la fonction
    RETURN vresultatDeparts+vresultatRetours ;
  END IF;
  -- Traiter le cas ou l’analyse porte sur une journée 
  IF (vnom is null AND vjour is not null) THEN
    SELECT count(*) INTO vresultatDeparts 
      FROM emprunts
      WHERE ajouteLe=vjour ;
    SELECT count(*) INTO vresultatRetours
      FROM details
      WHERE modifieLe=vjour ;
    -- Retourner le résultat et quitter la fonction
    RETURN vresultatDeparts+vresultatRetours ;
  END IF;
  -- Traiter le cas ou l’analyse porte sur un utilisateur et une journée
  IF (vnom is not null AND vjour is not null) THEN
    SELECT count(*) INTO vresultatDeparts 
      FROM emprunts
      WHERE ajoutePar=vnom AND ajouteLe=vjour;
    SELECT count(*) INTO vresultatRetours
      FROM details
      WHERE modifiePar=vnom AND modifieLe=vjour;
    -- Retourner le resultat et quitter la fonction
    RETURN vresultatDeparts+vresultatRetours ;
  END IF;
  -- Pour le dernier cas restant le retour est 0
  RETURN 0 ;
END ;
/
