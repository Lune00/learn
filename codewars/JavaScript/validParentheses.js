function validParenthesesStandardSolution(parens){
    const stack = [];
    const parentheses = parens.split('');

    for(let i = 0 ; i !== parentheses.length; i++){
        parenthese = parentheses[i];
        //Opening parenthese
        if(parenthese === '(')
            stack.push(parenthese);
        //Closing parenthese
        else if(parenthese === ')'){
            if(stack.length === 0)
                return false;
            else{
                stack.pop();
            }
        }
    }
    return stack.length === 0 ;
}

function validParentheses(parens){
    const parentheses = parens.split('');
    const stack = [];
    return validParenthesisRecursif(parentheses, stack);
}

function validParenthesisRecursif(parenthesis, stack){

    if(parenthesis.length === 0)
        return stack.length === 0 ;

    if(parenthesis[0] === '(')
        stack.push(parenthesis.shift());

    else{
        if(stack.length === 0){
            //Early exit
            return false;
        }
        else{
            stack.pop();
            parenthesis.shift();
        }
    }
    return validParenthesisRecursif(parenthesis, stack);
}

console.log( validParentheses("()") );
console.log( validParentheses("(()))") );



