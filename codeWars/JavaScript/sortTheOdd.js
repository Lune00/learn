//Sort only odd numbers, let even number in place
function sortArray(array) {
    //Extract array of odd numbers and Sort odd array (recursive)
    const odd = array.filter( el => el % 2 !== 0).sort(sortNumber);
    //Put back sorted odd array in original array

    console.log("oddSorted=",odd);

    return array.map( el => {
        if(el % 2 !== 0){
            return odd.shift();
        }
        else
            return el;
    });
}

//If a - b > 0 => a > b, b has lower index than a => ascending
function sortNumber(a,b){
    return a - b;
}



//console.log(sortArray([5, 3, 2, 8, 1, 4])) ; //[1, 3, 2, 8, 5, 4]);
//console.log(sortArray([5, 3, 1, 8, 0]) );// [1, 3, 5, 8, 0])
//console.log(sortArray([]));//[]
console.log(sortArray([5, 3, 2, 8, 1, 4, 1, 111, 112])) ;
