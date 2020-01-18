var recoverSecret = function(triplets) {

    //Init secret:


    //Build allLetters . When allLetters is empty (we remove each char from allLetters when added to
    // secret) the secret string should be return (and be correct)
    //do{}while(allLetters is not empty)
    let allLetters = [];
    const secret = [] ;

    for(item of triplets){
        allLetters.push.apply(allLetters, item);
    }

    //Store only unique letter
    //If index of the element is different from index of the first occurence of the element in the array
    //then it is not unique and is removed
    allLetters = allLetters.filter( (value, index, allLetters) => allLetters.indexOf(value) === index );

    console.log(allLetters);

    //Iterate over remaining triplets:
    for(let i = 0 ; i !== triplets.length; i++){

        const triplet = triplets[i];

        let firstChar = triplet[0];
        let secondChar = triplet[1];
        let thirdChar = triplet[2];

        //Init with the first triplet secret
        if(i === 0){
            //Add thee first directly to the secret
            for(item of triplets[0]){
                secret.push(item);
            }
            //We remove the initial letters of first triplet from allLetters
            allLetters.splice( allLetters.indexOf( firstChar) , 1 );
            allLetters.splice( allLetters.indexOf( secondChar) , 1 );
            allLetters.splice( allLetters.indexOf( thirdChar) , 1 );
            continue;
        }


        //Iterate over triplet

        console.log("i=",i, allLetters);
        console.log("firstChar=",firstChar,"secondChar=",secondChar,"thirdChar=",thirdChar);


        //If 1st char in triplet exist in secret, add 2nd and 3rd after it
        if( secret.includes( firstChar ) ){

            let first = secret.indexOf( firstChar );

            //If 2nd char is in allLetters, add to secret after first, remove char from allLetters;
            if( allLetters.includes( secondChar ) ){
                secret.splice(first, 0 , secondChar );
                allLetters.splice( allLetters.indexOf( secondChar ) , 1 );
            }

            if( allLetters.includes( thirdChar ) ){
                secret.splice(first + 1, 0 , thirdChar );
                allLetters.splice( allLetters.indexOf( thirdChar ) , 1 );
            }

        }


        //If 2nd char is in secret and not 1st
        else if ( secret.includes( secondChar) ){

            let second = secret.indexOf( secondChar );

        }


        //If 3rd char in in secret and not 1st and not 2nd
        else if( secret.includes( thirdChar) ){



        }


        console.log("secret=",secret, "allLetter=",allLetters);
    }

};

secret1 = "whatisup";

triplets1 = [
    ['t','u','p'],
    ['w','h','i'],
    ['t','s','u'],
    ['a','t','s'],
    ['h','a','p'],
    ['t','i','s'],
    ['w','h','s']
];

console.log( recoverSecret(triplets1) );

const test = [1,2,5];
//splice(debut, nombreASuprrimer, value) : ajoute l'element value a l'index debut
//si on veut inserer un element apres un autre, on met son index
//test.splice(2, 0, 3);
//test.splice(3, 0, 4);
//console.log(test);
//
//array=['a','b','c'];
//array.splice(array.indexOf("b"),1);
//array.splice(array.indexOf("a"),0,"null");
//console.log(array);
