import random
import numpy as np
from matplotlib import pyplot as plt

#Reproduction de l'experience de la planche de Galton (modele mathématique)

#On définit des fonctions
#Calcule une marche aléatoire et renvoie la distance finale parcourue
def serie(x0, N):

    # On boucle sur N
    x = x0

    for j in range(N):
        if random.uniform(0,1) < 0.5:
            x = x - 1
        else:
            x = x + 1

    #On renvoie la distance au carée (derniere valeur atteinte)
    return x

#Calculer la moyenne d'une liste
def moyenne(lst):
    return sum(lst)/len(lst)

#Nombre de billes
Nbilles = 5000

#Nombre de pas / Nombre de lignes d'obstacles (clous)
N = 8000

#Liste conservant les distances finales atteintes par les billes (distance par rapport à l'axe central)
distances = []
# On boucle sur les billes
for i in range(Nbilles):

    #On calcule la distance a l'axe central apres N collisions avec les obstacles
    d = serie(0 , N)

    #On l'ajoute à nos résultats
    distances.append(d)
       
#On trace l'histogramme des distances au carré obtenues dans chaque experience
#On obtient une distribution dite binomiale
plt.title('Histogramme des distances parcourues,\n Marches aléatoires = ' + str(Nbilles) + ', N = ' + str(N))
plt.xlabel('Distance au bout de N pas')
plt.ylabel('Nombre de résultats/boite')
axes = plt.gca()
axes.set_xlim([-700,700])
axes.set_ylim([0,700])
plt.hist(distances, bins=50, range=(-700,700), histtype='stepfilled')
plt.savefig('marche-aleatoire-histogramme-N' + str(N) + '.png')

