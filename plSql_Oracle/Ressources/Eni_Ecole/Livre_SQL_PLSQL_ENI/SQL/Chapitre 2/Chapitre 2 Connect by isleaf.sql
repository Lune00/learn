select nom, connect_by_isleaf
from employes
start with poste='pdg'
connect by nochef = PRIOR noemp