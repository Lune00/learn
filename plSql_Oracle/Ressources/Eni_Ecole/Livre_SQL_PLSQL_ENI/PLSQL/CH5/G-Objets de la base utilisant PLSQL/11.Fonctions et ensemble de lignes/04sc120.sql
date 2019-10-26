drop type MtLignesTab;

drop type MtLigne;
-- création du type
create type MtLigne as object(
  nolig number(2),
  montant number(12,2)
);
/

-- création de la table
create type MtLignesTab as table of MtLigne;
/
-- exemple de fct pipelined
create or replace function LigneVal (clig in SYS_REFCURSOR) 
  return MtLignesTab pipelined is
  out_mt MtLigne:=MtLigne(NULL, NULL);
  vlig ligcdes%rowtype;
  vprix number(12,2);
  vmontant number(12,2);
BEGIN
  loop
    fetch clig into vlig;
    exit when clig%notfound;
    -- prix de chaque article
    select prix into vprix
     from articles
     where refart=vlig.refart;
    -- calcul du montant de la ligne
    vmontant:=vlig.qtecde*vprix;
    --  construire la valeur à retourner
    out_mt.nolig:=vlig.nolig;
    out_mt.montant:=vmontant;
    -- retourner la valeur
    pipe row(out_mt);
  end loop;
  return;
END;
/

-- utilisation de la fct pipelined
select sum(montant) as total
from  table(LigneVal(CURSOR(select * from ligcdes where nocde=1301)));
