import random
from matplotlib import pyplot as plt

NLANCES = 10000
NSERIES = 3

# On boucle sur nos séries de lancers
for i in range(NSERIES):

    #Position initiale de la particule
    x = [0]

    # On boucle sur les lancers
    for j in range(NLANCES):

        #On tire à pile ou face
        if random.random() < 0.5:
            #Un pas vers la droite
            x.append(x[-1] + 1)
        else:
            #Un pas vers la gauche
            x.append(x[-1] - 1)
    

    #On trace la position x de la particule en fonction de chaque lancer
    plt.plot(x)
    plt.xlabel('N')
    plt.ylabel('x')
    plt.title('Séries de marches aléatoires')
    plt.legend(['Position x en fonction de N'])
   
plt.savefig('marches-aleatoires-series.png')

        