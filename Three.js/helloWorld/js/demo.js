//Setup the scene, camera and renderer : we use a camera to render a scene
var scene = new THREE.Scene();
var camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);
var renderer = new THREE.WebGLRenderer();
renderer.setSize(window.innerWidth, window.innerHeight);
document.body.appendChild(renderer.domElement);

//Add geometrycal element:

//Geometry : contains all vertices and faces of the cube
var geometry = new THREE.BoxGeometry();
//Apply style to the geometry
var material = new THREE.MeshBasicMaterial({
  color: 0x00ff00
});
//Mesh: takes a geometry and apply a material to it
var cube = new THREE.Mesh(geometry, material);

//Add cube to the scene
scene.add(cube);
camera.position.z = 3.;

//Render:
function animate() {
  requestAnimationFrame(animate);
  renderer.render(scene, camera);

  // cube.rotation.x += 0.01;
  cube.rotation.z += 0.01;
}

animate();
