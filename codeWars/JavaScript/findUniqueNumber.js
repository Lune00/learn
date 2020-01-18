function findUniq(arr) {
    c = {};
    arr.forEach( (el) => {

        if( !(el in c) )
            c[el] = 1 ;
        else
            c[el]++;
    });

    return  Number(Object.keys(c).filter( key => {
        return c[key] === 1;
    }));
}


//Solution proposée: il n'y a que 3 nombres differentes dans l'array
function findUniqSolutionProposee(arr) {
    arr.sort((a,b)=>a-b);
    return arr[0]==arr[1]?arr.pop():arr[0]
}


function findUniqSolutionProposeeME(arr) {
    //Classe en ordre ascendant (du plus petit au plus grand)
    arr.sort( (a,b) => a - b);
    console.log(arr);
    return arr[0]==arr[1]?arr.pop():arr[0]
}


console.log(findUniq([ 1, 1, 1, 2, 1, 1 ]));
console.log(findUniqSolutionProposeeME([ 1, 1, 1, 2, 1, 1 ]));
