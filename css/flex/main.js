Array.from(document.getElementsByClassName('button')).forEach(el => {
  el.addEventListener('click', () => {
    console.log('click', el.innerHTML);
  })
})
