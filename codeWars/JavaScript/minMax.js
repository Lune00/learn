function highAndLow(numbers){

    arrNumbers = numbers.split(' ');
    minmax = [];
    min = arrNumbers[0];
    max = arrNumbers[0];

    for(element of arrNumbers){
        number = parseInt(element);
        min > number ? min = min : min = number;
        max < number ? max = max : max = number;
    }

    minmax.push(max);
    minmax.push(min);

    return minmax.join(' ');

}

function highAndLowProposition(numbers){
    numbers = numbers.split(' ').map(Number);
    return Math.max.apply(0, numbers) + ' ' + Math.min.apply(0, numbers);
}


function highAndLowMaProposition(numbers){
    //Transforme le type de chaque entree en 'Number'
    numbers = numbers.split(' ').map(Number);
    return Math.max.apply(null, numbers) + " " + Math.min.apply(null, numbers);
}


//Math.max attend des entiers, et non un tableau (voila pourquoi il renvoie NaN)
console.log(Math.max([1, 2, 3]));
//Solution: .apply(this,list) : apply transforme la liste en une suite d'arguments pour la fonction
//le premier parametre est le 'context', ici pas besoin donc on peut passer n'importe quoi
console.log(Math.max.apply(null, [1, 2, 3]));

function testApply( array ){
   print.apply(null, array);
}

function print(parameter1, parameter2, parameter3){
    console.log("parameter1: ", parameter1);
    console.log("parameter2: ", parameter2);
    console.log("parameter3: ", parameter3);
}

//N'affiche que les trois premiers parametres: 1, 2 et 3. Le tableau en argument de testApply a été transformé en
//liste de parametres
testApply([1, 2, 3, 4, 7, -10]);




console.log("Ma solution originale:", highAndLow("4 5 29 54 4 0 -214 542 -64 1 -3 6 -6"));
console.log("Solution proposée:", highAndLowProposition("4 5 29 54 4 0 -214 542 -64 1 -3 6 -6"));
console.log("Ma solution corrigée:", highAndLowMaProposition("4 5 29 54 4 0 -214 542 -64 1 -3 6 -6"));
