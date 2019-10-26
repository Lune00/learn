ALTER TABLE membres MODIFY(mobile char(14));

DECLARE
  --- traiter les membres un par un
  CURSOR cLesMembres IS 
    SELECT mobile FROM membres 
    FOR UPDATE OF mobile;
  vnouveau membres.mobile%type;
BEGIN
  FOR vnumero IN cLesMembres LOOP
    IF (INSTR(vnumero.mobile,' ')!=2) THEN
      -- construction du nouveau numero
      vnouveau:=substr(vnumero.mobile,1,2)||' '||
        substr(vnumero.mobile,3,2)||' '||
        substr(vnumero.mobile,5,2)||' '||
        substr(vnumero.mobile,7,2)||' '||
        substr(vnumero.mobile,9,2);
      UPDATE membres
      SET mobile=vnouveau
      WHERE CURRENT OF cLesMembres;
    END IF;
  END LOOP;
END;
/
select * from membres

ALTER TABLE membres ADD constraint ck_membres_mobile check (REGEXP_LIKE (mobile, '^(06|07) [[:digit:]]{2} [[:digit:]]{2} [[:digit:]]{2} [[:digit:]]{2}$')) EXCEPTIONS INTO EXCEPTIONS;