function findShort(s){
    return Math.min.apply(null, s.split(' ').map( word => word.length));
}


console.log(findShort("bitcoin take over the world maybe who knows perhaps"));