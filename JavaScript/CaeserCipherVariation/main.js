const message = document.getElementById('message');
const encode = document.getElementById('encode');
const messageEncode = document.getElementById('messageEncode');


messageEncode.textContent = movingShift(message.value, 1);
messageDecode.textContent = demovingShift(movingShift(message.value,1),1);


encode.addEventListener('click',encoder);
function encoder(){
  let s = message.value;
  let shift = 1;
  messageEncode.textContent = movingShift(s,shift);;
}

function movingShift(s, shift){
  let letters="abcdefghijklmnopqrstuvwxyz";
  let str = s.toLowerCase();
  let encode="";
  for(let i = 0 ; i !== str.length ; i++){
    if(!letters.includes(str[i]))
      encode += str[i]
    else{
      let shiftLetter = letters[(letters.indexOf(str[i]) + shift) % letters.length ];
      if(str[i].toUpperCase() === s[i])
	shiftLetter = shiftLetter.toUpperCase();
      encode += shiftLetter;   
    }
    shift++;
  }

  let result = [];
  //Break the encoded message in 5 parts:
  let n = Math.ceil(encode.length/5);
  let start = 0;
  for(let i = 0 ; i != 5 ; i++){
    result[i] = encode.slice(start, start + Math.min(n, encode.length - start));
    start += n;
  }

  return result;
}

function demovingShift(arr, shift) {
    
  let letters="abcdefghijklmnopqrstuvwxyz";
  let encode = arr.join('');
  let str = encode.toLowerCase();
  let decode="";

  for(let i = 0 ; i !== str.length ; i++){
    if(!letters.includes(str[i]))
      decode += str[i]
    else{
      let index = (letters.indexOf(str[i])) - shift % letters.length ;
      if(index<0)
  	index += letters.length;
      let shiftLetter = letters[index];
      console.log(shiftLetter, index);
      if(str[i].toUpperCase() === encode[i])
	shiftLetter = shiftLetter.toUpperCase();
      decode += shiftLetter;   
    }
    shift++;
  }
  return decode;
}


