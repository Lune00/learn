function rot13(message){

    const alphabet = "abcdefghijklmnopqrstuvwxyz";
    return message.split('').map( letter => {

        //Disregard non alphabetic characters
        if(alphabet.indexOf(letter.toLowerCase()) === -1)
            return letter;

        //Keep in memory if it is upperCase or lowerCase
        let isUpperCase = letter.toUpperCase() === letter;

        letter = letter.toLowerCase();
        let indexLetter = alphabet.indexOf(letter);
        let indexCrypted = (indexLetter + 13 ) % alphabet.length;
        let mapLetter = alphabet[indexCrypted];

        //console.log(letter,indexLetter, indexCrypted, alphabet[indexCrypted], isUpperCase);

        if(isUpperCase)
            mapLetter = mapLetter.toUpperCase();

        return mapLetter;
    }).join('');

}


function rot13SolutionProposee(message) {
    var abc = 'abcdefghijklmnopqrstuvwxyzabcdefghijklmABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLM';
    return message.replace(/[a-z]/gi, c => abc[abc.indexOf(c) + 13]);
}

//console.log("grfg" == rot13("test"));
console.log("Grfg" == rot13("Test"), rot13("Test"));


//Test array indexes
const string = "abcdefgAAAaa";
console.log(string.replace(/[a]/gi, 'Z'));

