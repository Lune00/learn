select substr(lpad(' ',2*(level-1))||nom,1,30) as nom, 
       noemp, nochef, poste
  from employes
  start with poste='pdg'
  connect by prior noemp=nochef;