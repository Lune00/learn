function pigIt(str){
    return str.split(' ').map( word => {
        wordArray = word.split('');
        //move first character to the end of each word
        wordArray.push(wordArray.shift());
        return wordArray.join('');
    }).map( word => {
        //Add 'ay' at the end of word if it is not a punctuation mark (suppose that punctuation is considererd as a word
        //ie, is separate with a whitespace from other character
        if( word.match(/[.,!:?]/g) )
            return word;
        else
            return word + 'ay';
    }).join(' ');
}

console.log(pigIt('Pig latin is cool'),'igPay atinlay siay oolcay');
console.log(pigIt('Hello world !') , 'elloHay orldway !');
