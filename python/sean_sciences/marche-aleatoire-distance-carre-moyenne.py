import random
import numpy as np
from matplotlib import pyplot as plt

#Calcule et trace la distance moyenne (sur un ensemble de séries) 
#au carré en fonction du nombre de lancers/pas N

#On définit des fonctions utiles

#Calcule une marche aléatoire et renvoie la distance au carée finale parcourue
def serie(x0, N):
    # On boucle sur N
    x = [x0]
    for j in range(N):
        if random.random() < 0.5:
            x.append(x[-1] + 1)
        else:
            x.append(x[-1] - 1)
    #On renvoie la distance au carée (derniere valeur atteinte)
    return x[-1] * x[-1]

#Calculer la moyenne d'une liste
def moyenne(lst):
    return sum(lst)/len(lst)


#Valeurs de N explorées
NVALEURS = 50

#Nombre d'expériences par valeur de N
NEXPERIENCES = 5000

#Une liste pour garder toutes les valeurs de distance moyenne au carré
root_mean_square = []

#On garde la valeur de N de chaque expérience
N = []

#Valeur initiale de N
n = 0

#On boucle sur un ensemble de valeurs de N
for j in range(NVALEURS):

    #A chaque experience on ajoute 100 à N
    n = n + 100

    dsquared = []

    # On boucle sur nos experiences
    for i in range(NEXPERIENCES):

        #On garde la distance finale au carré apres n pas
        d2 = serie(0 , n)
        #On l'ajoute à nos résultats
        dsquared.append(d2)
       

    #On calcule la distance au carée moyenne sur les experiences
    root_mean_square.append(moyenne(dsquared))
    N.append(n)


#On trace nos résultats : distance moyenne au carré en fonction du nombre de pas n
plt.plot(N, root_mean_square ,'ro')
#On trace f(x) = x pour comparer
x = np.linspace(0, N[-1], 1000)
#Légende
plt.plot(x,x)
plt.xlabel('N')
plt.ylabel('Distance moyenne au carré')
plt.title('Distance moyenne au carré parcourue en fonction du nombre de pas N')
plt.legend()
   
plt.savefig('distance-moyenne-aucarre-en-fonction-de-n.png')

