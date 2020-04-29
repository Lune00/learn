
const customName = document.getElementById('customname');
const randomize = document.querySelector('.randomize');
const story = document.querySelector('.story');


const storyText = 'It was 94 fahrenheit outside, so :insertx: went for a walk. When they got to :inserty:, they stared in horror for a few moments, then :insertz:. Bob saw the whole thing, but was not surprised — :insertx: weighs 300 pounds, and it was a hot day.';

let insertX = ['Willy the Goblin', 'Big Daddy', 'Father Christmas'];
let insertY = ['the soup kitchen', 'DisneyLand', 'the White House'];
let insertZ = ['spontaneously combusted', 'melted into a puddle on the sidewalk', 'turned into a slug and crawled away'];

function randomValueFromArray(array){
  const random = Math.floor(Math.random()*array.length);
  return array[random];
}


randomize.addEventListener('click', result);

function result() {

  let name;
  let newStory = storyText;
  console.log(storyText);

  if(customName.value !== '') 
    name = customName.value;
  else
    name = randomValueFromArray(insertX);

  if(document.getElementById("uk").checked) {
    let weight = Math.round(300);
    let temperature =  Math.round(94);
  }

  newStory = newStory.replace(new RegExp(':insertx:','g'), name);
  newStory = newStory.replace(new RegExp(':inserty:','g'), randomValueFromArray(insertY));
  newStory = newStory.replace(new RegExp(':insertz:','g'), randomValueFromArray(insertZ));



  story.textContent = newStory ;
  story.style.visibility = 'visible';
}
