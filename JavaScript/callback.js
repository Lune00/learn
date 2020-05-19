// console.log('callback');
//
// //setTimeout est une fonction a callback
// setTimeout(() => {
//   console.log('done')
// }, 1000);
//
// console.log('continue');

// function metDuTemps(foo) {
//   // setTimeout(() => {
//   //   console.log('metDuTemps : done');
//   // }, 1000);
// //   let a = 0;
// //   for (let i = 0; i != 10000000000; i++) {
// //     a += i / 5.13 ;
// //   }
// //   console.log('metDuTemps finished',a)
// //   foo();
// // }
// //
// // function foo() {
// //   console.log('foo finished')
// // }
// //
// // function next(){
// // console.log('next')
// // }
// //
// // metDuTemps(foo);
// // next();


function foo(bar){
  //do crazy stuff
  let a = 0 ;
  for (let i = 0; i != 100000000; i++) {
    a += Math.sqrt(i) / 2 ;
  }
  console.log('foo has finished')
  bar();
}

function bar(){
  console.log('bar');
}

function next(){
  console.log('next');
}

foo(bar);
next();
