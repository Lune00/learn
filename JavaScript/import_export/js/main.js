// import { add, sub } from './utils.js'
// import * as utils from './utils.js'
//Import par default :
// import toto from './utils.js'
//Les 2 sur une ligne, déclarer l'import par défaut en premier
import toto, * as utils from './utils.js'

console.log(utils.add(5, 3));
console.log(utils.sub(5, 3));
console.log(toto(5, 3));
