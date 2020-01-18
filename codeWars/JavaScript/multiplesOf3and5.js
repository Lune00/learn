function solution(number){
    number = number - 1;

    let n3 = Math.floor(number / 3) ;
    let n5 = Math.floor(number / 5) ;
    let n15 = Math.floor(number / 15);

    return ( 3 * n3 * ( n3 + 1) + 5 * n5 * (n5 + 1) - 15 * n15 * (n15 + 1 ) ) / 2;
}

console.log("solutions=", solution(10), solution(3), solution(36));



