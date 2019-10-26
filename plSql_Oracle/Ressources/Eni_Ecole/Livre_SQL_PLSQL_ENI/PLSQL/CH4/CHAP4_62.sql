rem Livraison des commandes et mise à jour des stocks
rem Création de la table TEMOIN
create table TEMOIN(nocde number(6), texte char(60));


rem Bloc PL/SQL de mise à jour
DECLARE
  cursor ccde is select c.nocde, refart, qtecde
    from ligcdes l,commandes c
    where c.nocde=l.nocde
      and c.etatcde='EC'
    order by c.nocde;
  vcde ccde%rowtype;
  vqtestk articles.qtestk%type;
  vnvqte vqtestk%type;
  vtexte temoin.texte%type;
  verr boolean;
  vcderef commandes.nocde%type;
BEGIN
  open ccde;	--Execution du curseur
  fetch ccde into vcde;	--Lecture de la 1ère ligne
  <<Bcde>>
  while ccde%found loop
    vcderef:=vcde.nocde;	--Debut de commande
    verr:=false;
    vtexte:='Problème sur article(s): ';
    commit;
    <<Blig>>
    while ccde%found and vcde.nocde=vcderef loop
      select qtestk into vqtestk
        from articles
        where refart=vcde.refart;
      vnvqte:=vqtestk-vcde.qtecde;
      if (vnvqte>=0) then --stock OK
        update articles set qtestk=vnvqte
          where refart=vcde.refart;
      else -- stock pas OK
        verr:=true;
        vtexte:=rtrim(vtexte)||rtrim(vcde.refart);
      end if;
      fetch ccde into vcde;  --lecture ligne suivante
    end loop Blig;
    if verr then
      rollback;
    else
      update commandes set etatcde='LI'
        where nocde=vcderef;
      vtexte:='Commande livrée';
    end if;
    insert into temoin values (vcde.nocde, vtexte);      
    commit;
  end loop Bcde;
  close ccde;
END;
/
rem Consultation de la table témoin
select * from temoin;
drop table temoin;
