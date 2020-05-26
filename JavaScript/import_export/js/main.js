// import { add, sub } from './utils.js'
// import * as utils from './utils.js'
//Import par default : je le renomme comme je veux
// import toto from './utils.js'
//Les 2 sur une ligne, déclarer l'import par défaut en premier (on le renomme comme on veut), puis tout le reste sous un namespace
import toto, * as utils from './utils.js'

import CequeJeVeux from './others.js'

console.log(utils.add(5, 3));
console.log(utils.sub(5, 3));
console.log(toto(5, 3));

console.log(CequeJeVeux.a);
CequeJeVeux.sayHello();
