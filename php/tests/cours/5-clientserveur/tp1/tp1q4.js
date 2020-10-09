window.onload = init;
var inputMarque;

function init() {
    inputMarque = document.getElementById('idMarque');
    inputMarque.onblur = chargerModeles;
}

function chargerModeles() {
    var x = new XMLHttpRequest();
    x.onreadystatechange = ajouterModeles;
    x.open('GET', 'getModeles.php?marque=' + inputMarque.value, true);
    x.send();
}

function ajouterModeles() {
    if (this.readyState === 4 && this.status === 200) {
        var modelesPossibles = document.getElementById('idModelesPossibles');
        if (modelesPossibles) {
            modelesPossibles.parentNode.removeChild(modelesPossibles);
        }
        modelesPossibles = document.createElement('datalist');
        modelesPossibles.id = 'idModelesPossibles';
        modelesPossibles.innerHTML = this.responseText;
        var modele = document.getElementById('idModle');
        modele.value = '';
        modele.appendChild(modelesPossibles);
    }
}
