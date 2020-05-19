console.log('closure')

let g = 'a';

function twice() {
  return g + g;
}

console.log(twice())

g = 'b';

console.log(twice())

function mult(a) {
  return function multiply(b) {
    return a * b;
  }
};

let a = mult(2);
let b = mult(3);

console.log(b, b(5), b(10))

let c = mult(5)(2);
console.log(c)

var compteur = (function() {

  var compteurPrive = 0;

  function changeValeur(val) {
    compteurPrive += val;
  }
  //3 fonctions publiques appelées 'closure' ou fermeture
  return {
    increment: function() {
      changeValeur(1);
    },
    decrement: function() {
      changeValeur(-1);
    },
    valeur: function() {
      return compteurPrive;
    }
  };
})();


console.log(compteur.valeur())
console.log(compteur.compteurPrive)
compteur.decrement()
console.log(compteur.valeur())
compteur.increment()
compteur.increment()
compteur.increment()
console.log(compteur.valeur())


var creerCompteur = function() {

  var compteurPrive = 0;

  function changeValeur(val) {
    compteurPrive += val;
  }
  //3 fonctions publiques appelées 'closure' ou fermeture
  return {
    increment: function() {
      changeValeur(1);
    },
    decrement: function() {
      changeValeur(-1);
    },
    valeur: function() {
      return compteurPrive;
    }
  };
}

//Nouvel environnement est instancié a chaque appel de creerCompteur
var compteur1 = creerCompteur();
var compteur2 = creerCompteur();
compteur2.increment()
compteur1.decrement()
console.log('exemple 2:', compteur1.valeur(), compteur2.valeur());
