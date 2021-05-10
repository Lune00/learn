//Recursive solution: return the difference between arrays a and b (remove elements in a present in b)
function array_diff(a, b) {
    //Base case
    if( b.length === 0)
        return a;
    a = a.filter( element => element !== b[0] );
    b.shift();
    return array_diff(a,b);
}



//Solution proposée
function array_diffSolutionProposee(a, b) {
    return a.filter(function(x) { return b.indexOf(x) == -1; });
}

//Renvoie le tableau de tous les elements de a qui ne sont pas trouvés (filtre) dans b
function array_diffMaSolutionCorrigee(a,b){
    //vrai quand ce n'est pas trouvé, donc renvoyé
    return a.filter( x => b.indexOf(x) === -1);
}



const test = [1,2,3,4,5];
console.log( test.filter( el => el !== 1)  );

//Tests:
console.log(array_diff([], [4,5])); // []
console.log(array_diff([1,8,2], [])); // [1,8,2]
console.log(array_diff([1,2,2], [2])); // [1],
