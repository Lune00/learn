//Fonctionne bien mais ne passe pas un test de performance sur une array de 100 elements
function solutionLowPerf(numbers) {
    do{
        for(let i = 0 ; i !== numbers.length; i++){
            for(let j = 0 ; j!== numbers.length; j++){

                if( i === j)
                    continue;

                if( numbers[i] > numbers[j])
                    numbers[i] = numbers[i] - numbers[j];
            }
        }
    }while(! numbers.every( (val, i, numbers) => val === numbers[0]));

    return numbers.reduce( (a,b) => a + b);
}

function solutionLowerPerf2(numbers) {
    do{
        for(let i = 0 ; i !== numbers.length; i++){
            for(let j = i + 1 ; j!== numbers.length; j++){

                if( numbers[i] > numbers[j])
                    numbers[i] = numbers[i] - numbers[j];
                else if( numbers[i] < numbers[j])
                    numbers[j] = numbers[j] - numbers[i];
            }
        }
    }while(! numbers.every( (val, i, numbers) => val === numbers[0]));

    return numbers.reduce( (a,b) => a + b);
}


function solutionLowerPerf3(numbers){

    do{
        for(let i = 0 ; i !== numbers.length; i++){
            for(let j = i + 1 ; j!== numbers.length; j++){

                if(numbers[i] === numbers[j]){
                    continue;
                }

                if( numbers[j] > numbers[i] ) {
                    let temp = numbers[i];
                    numbers[i] = numbers[j];
                    numbers[j] = temp;
                }

                //numbers[i] > numbers[j] from here

                if( numbers[i] % numbers[j] === 0){
                    numbers[i] = numbers[j];
                }
                else{
                    numbers[i] = numbers[i] % numbers[j];
                    numbers[j] = numbers[i];
                }
            }
        }
    }while(! numbers.every( (val, i, numbers) => val === numbers[0]));
    return numbers.reduce( (a,b) => a + b);
}



function recursive(numbers, i  ){

    if(i === numbers.length - 1){
        i = 0;
    }

    //Base case
    if(numbers.every( (val, i, numbers) => val === numbers[0])){
        return numbers.reduce( (a,b) => a + b);
    }

    if(numbers[i] < numbers[i+1]){
        let temp = numbers[i];
        numbers[i] = numbers[i+1];
        numbers[i+1] = temp;
    }

    if( numbers[i] % numbers[i+1] === 0){
        numbers[i] = numbers[i+1];
    }
    else{
        numbers[i] = numbers[i] % numbers[i+1];
        numbers[i+1] = numbers[i];
    }

    i++;
    console.log(numbers);

    return recursive(numbers, i)
}

function solution(numbers){
    return recursive2(numbers, 0, false );
}

function recursive2(numbers, i, modified  ){

    if(i === numbers.length - 1){
        i = 0;
    }

    //Base case
    if(modified){
        if(numbers.every( (val, i, numbers) => val === numbers[0])){
            return numbers.reduce( (a,b) => a + b);
        }
    }

    if(numbers[i] < numbers[i+1]){
        let temp = numbers[i];
        numbers[i] = numbers[i+1];
        numbers[i+1] = temp;
    }

    if( numbers[i] % numbers[i+1] === 0){
        numbers[i] = numbers[i+1];
    }
    else{
        numbers[i] = numbers[i] % numbers[i+1];
        numbers[i+1] = numbers[i];
        modified = true;
    }

    i++;
    console.log(numbers);

    return recursive2(numbers, i, modified);
}
//On compare chaque element de array avec son voisin de droite, si egaux on supprime l'element en cours. Si pas egaux, return false
//Base case: on a supprimé tous les elements et il n'en reste qu'un => return true
const allElementEquals = (array) => {
    //Base case
    if(array.length === 1 || array.length === 0)
        return true;

    if( array[0] !== array[1])
        return false;
    else
        array.shift();
    return allElementEquals(array);
};

//console.log(allElementEquals([1, 2, 3, 4, 5]));
//console.log(allElementEquals([1, 1, 1, 1, 1]));
//console.log(allElementEquals([1, 1, 1, 1, 2]));


console.log(solution([6,9,21])); //9

//array.every(value,[index],[array])
//console.log([1,1,1,1].every( (val, i, arr) => val === arr[0] ));   // true
//console.log( [1,2,3].reduce( (a,b) => a + b));
//console.log( [3,2,1].sort( (a,b) => a - b));

