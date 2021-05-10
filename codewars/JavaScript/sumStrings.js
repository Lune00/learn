//Solution not using string manipulation function.
//We transform each number into an array of Number
//We padd with 0 the number with the lower digits, in order to have same array length
//We add each element of each array with same index and store the result in an array of same length,
//If a[i] + b[i] >= 10 , store unit in result[i] and add 1 to a[i-1]
//Remove leading zero paddings at the end and return

//ex: sumStrings('999','12') : '999' => [9][9][9] and '12' => [0][1][2]
//result = [1][0][1][1]

function sumStrings(a,b) {

    const arrA = a.split('').map(Number);
    const arrB = b.split('').map(Number);

    //Padding the lower number of digits array representation with 0 at begining
    const agreaterThanB = arrA.length > arrB.length;

    padding = agreaterThanB ? arrA.length - arrB.length : arrB.length - arrA.length;

    //Padding if necessary
    if(padding !== 0) {
        for(let i = 0 ; i !== padding; i++){

            if(agreaterThanB)
                arrB.unshift(0);
            else
                arrA.unshift(0);
        }
    }

    //arrA.length === arrB.length
    result = [];

    for(let i = arrA.length - 1; i >= 0; i--){

        resultat = arrA[i] + arrB[i];

        let unite = resultat % 10;
        let dizaine = Math.floor(resultat/10);

        //If not at lower index, ie higher digit of the number, we add dizaine to higher digit and set result[i] to unit
        if(i !== 0){
            arrA[ i - 1 ] += dizaine;
            result.unshift(unite);
        }
        //If at higher
        else
            result.unshift(dizaine, unite);

    }
    //Remove 0 padding in front
    return result.join('').replace(/^0+/,'');
}

//console.log(sumStrings('123','456'));//579
//console.log(sumStrings('','456'));//456
//console.log(sumStrings('712569312664357328695151392','456'));//456
//console.log(sumStrings('123456','563'));
//console.log(sumStrings('9','9'));
//console.log(sumStrings('712569312664357328695151392', '8100824045303269669937') ); //712577413488402631964821329
console.log(sumStrings('00103', '08567'));