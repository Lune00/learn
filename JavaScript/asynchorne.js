console.log('asynchrone')

//Callback hell
// setTimeout(() => {
//   var a = 1;
//   console.log('taitement 1 terminé : a =',a)
//   setTimeout(() => {
//      a++;
//     console.log('traitement 2 terminé: a =',a)
//     setTimeout(() => {
//       a++;
//       console.log('traitement 3 terminé: a =',a)
//     }, 1000);
//   }, 2000)
// }, 3000);



//
//
// setTimeout(function foo() {
//   console.log('foo');
//   setTimeout(function bar() {
//     console.log('bar');
//   }, 1000);
// }, 3000);
//
// let promesse = new Promise((resolve) => {
//   setTimeout(() => {
//     resolve('foo');
//   }, 1000);
// });
//
// promesse.then((value) => {
//   console.log(value)
// });

// function bar() {
//   setTimeout(() => {
//     console.log('bar');
//   }, 2000);
// }
//
// function foo() {
//   setTimeout(() => {
//     console.log('foo');
//     bar();
//   }, 1000);
// }
//
// foo();


//Callback hell 2

// setTimeout(() => {
//   //fait des trucs de manière asynchrone et fournit un resultat
//   let result1 = 'foo';
//   console.log('foo succès');
//   if (result1 === 'foo') {
//     setTimeout(() => {
//       //fait des trucs de manière asynchrone et fournit un resultat
//       let result2 = 'bar';
//       console.log('bar succès');
//       if (result2 === 'bar') {
//         //fait des trucs de manière asynchrone et fournit un resultat
//         setTimeout(() => {
//           console.log('foo-bar succès');
//         }, 1000);
//       } else {
//         console.log('bar échec');
//       }
//     }, 2000)
//   } else {
//     console.log('foo échec');
//   }
// }, 3000);
//
//
//
// setTimeout(function foo() {
//   //fait des trucs de manière asynchrone et fournit un resultat
//   let result = 'foo';
//   if (result = 'foo') {
//     console.log('foo succès');
//   } else {
//     console.log('foo échec')
//   }
// }, 3000);
//
//
//
// function bar(resultat) {
//   if (resultat === 'foo')
//     return 'bar';
//   else
//     return 'error;'
// }
//
//
// setTimeout(function foo(bar) {
//   //fait des trucs de manière asynchrone et fournit un resultat
//   let result1 = 'foo';
//   console.log('foo succès');
//   if (result1 === 'foo') {
//     setTimeout(() => {
//       //fait des trucs de manière asynchrone et fournit un resultat
//       let result2 = 'bar';
//       console.log('bar succès');
//       if (result2 === 'bar') {
//         //fait des trucs de manière asynchrone et fournit un resultat
//         setTimeout(() => {
//           console.log('foo-bar succès');
//         }, 1000);
//       } else {
//         console.log('bar échec');
//       }
//     }, 2000)
//   } else {
//     console.log('foo échec');
//   }
// }, 3000);


//Utilisation promesses

// function foo() {
//   return new Promise((resolve, reject) => {
//     setTimeout(() => {
//       //fait des trucs de manière asynchrone et fournit un resultat
//       let result1 = 'foo';
//       if (result1 === 'foo')
//         resolve('foo succès');
//       else
//         reject('foo échec')
//     }, 3000);
//   });
// }
//
// // function bar() {
// //   return new Promise((resolve, reject) => {
// //     setTimeout(() => {
// //       resolve('bar')
// //     }, 1000);
// //   })
// // }
//
// foo().then((resultatSucces)=>{
//   console.log(resultatSucces);
// })
// .catch((resulatErreur)=>{
//   console.log(resulatErreur);
// })


// foo()
//   //Appel de bar
//   .then((result) => {
//     return new Promise((resolve, reject) => {
//       setTimeout(() => {
//         console.log(result)
//         //fait des trucs de manière asynchrone et fournit un resultat
//         let result2 = 'bar2';
//         if (result2 === 'bar')
//           resolve('bar succès');
//         else
//           reject('bar echec');
//       }, 1000);
//     });
//   })
//   //Appel de foo-bar
//   .then((result) => {
//     return new Promise((resolve, reject) => {
//       setTimeout(() => {
//         console.log(result)
//         resolve('foo-bar succès');
//       }, 1000);
//     });
//   })
//   .then((result) => {
//     console.log(result);
//   })
//   .catch((error) => {
//     console.log(error);
//   });



function foo() {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      //fait des trucs de manière asynchrone et fournit un resultat
      let result1 = 'foo2';
      if (result1 === 'foo')
        resolve('foo succès');
      else
        reject('foo échec')
    }, 1000);
  });
}

async function maChaineDeTraitementsAsynchrones() {


  try {

    const result = await foo();

    const result2 = await

    function(result) {
      return new Promise((resolve, reject) => {
        setTimeout(() => {
          console.log(result);
          let result2 = 'bar';
          if (result2 === 'bar')
            resolve('bar succès');
          else
            reject('bar echec');
        }, 1000);
      });
    }(result);

    const result3 = await

    function(result) {
      return new Promise((resolve, reject) => {
        setTimeout(() => {
          console.log(result);
          resolve('foo-bar succès');
        }, 1000);
      });
    }(result2);

    console.log(result3);


  } catch (error) {
    console.log(error);
  }

}

maChaineDeTraitementsAsynchrones();
console.log('start');
