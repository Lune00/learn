const countBits = function(n) {
    return n.toString(2).split('').map(Number).reduce( (a,b) => a + b);
};

console.log(countBits(0)); //0
console.log(countBits(4)); //1
console.log(countBits(10)); //2

//Get binary representation of integer:
const integer = 2;
console.log(integer, (integer).toString(2), (integer).toString(2).split(''));


//reduce(fonction, valeur initiale) : applique une fonction qui est un "accumulateur" et qui traite chaque valeur d'une liste (gauche vers droite)
//afin de la réduire vers une seule valeur
//reduce( fonction ) ou fonction(accumulateur, currentValue)




