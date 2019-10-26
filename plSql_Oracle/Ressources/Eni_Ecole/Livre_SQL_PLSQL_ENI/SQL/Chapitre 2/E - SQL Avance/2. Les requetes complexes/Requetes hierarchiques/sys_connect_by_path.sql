select lpad(' ',2*(level-1))||SYS_connect_by_path(rtrim(nom),'/') as nom
  from employes
  start with poste='pdg'
  connect by prior noemp=nochef;