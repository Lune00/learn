select substr(lpad(' ',2*(level-1))||nom,1,30) as nom,
       noemp, nochef, poste, CONNECT_BY_ROOT nom as BigChef
  from employes
  start with poste='pdg'
  connect by prior noemp=nochef;