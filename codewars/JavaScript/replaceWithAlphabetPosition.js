const alphabet = "abcdefghijklmnopqrstuvwxyz";

function alphabetPosition(text) {
    return text.split('')
        .map( char => char.toLowerCase())
        .filter( char => alphabet.indexOf(char) !== -1)
        .map( char => alphabet.indexOf(char) + 1)
        .join(' ');
}

console.log(alphabetPosition("The sunset sets at twelve o' clock."));
// "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11");