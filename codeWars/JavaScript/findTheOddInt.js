A = [20,1,-1,2,-2,3,3,5,5,1,2,4,20,4,-1,-2,5];

const reducer = (accumulator, currentValue) => accumulator + currentValue;
//console.log(A.reduce(reducer));

function findOdd (A){
    occurences = {};
    for(let i = 0 ; i !== A.length; i++){
        if(typeof occurences[A[i]] === 'undefined'){
            occurences[A[i]] = 1;
        }
        else{
            occurences[A[i]]++ ;
        }
    }
    console.log("occurences:",occurences);
    return parseInt(Object.entries(occurences).filter( entry => entry[1] % 2 !== 0 )[0][0]);
}

console.log(findOdd(A));


//Test object to array
//objet = { "1":2, "2":3};
//console.log(Object.values(objet));
//console.log(Object.keys(objet));
//console.log(Object.entries(objet));
//console.log(Object.entries(objet).filter( entree => entree[1] % 2 !== 0));


function findOdd_SolutionCodeWars(A) {
    var obj = {};
    A.forEach(function(el){
        obj[el] ? obj[el]++ : obj[el] = 1;
    });

    for(prop in obj) {
        if(obj[prop] % 2 !== 0) return Number(prop);
    }
}
