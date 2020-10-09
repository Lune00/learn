window.onload = init;
var inputCP;

function init() {
    inputCP = document.getElementById("cp");
    inputCP.onblur = chargerVilles;
}

function chargerVilles() {
    // Création d'une instance permettant d'envoyer des requêtes au serveur
    var req = new XMLHttpRequest();
    // Création de la requête à envoyer
    req.open("GET", "GetVillesTxt.php?cp=" + inputCP.value, true);
    // Choix de la méthode appelée automatiquement lors de l'arrivée de la réponse du serveur
    req.onload = insererChoixVilles;
    // Envoi de la requête
    req.send();
}

function insererChoixVilles() {
    // Si le code de statut est à Succès
    if (this.status === 200) {
        // this.responseText permet d'obtenir le contenu retourné par le serveur
        villes = this.responseText.split("|");
        selectVille = document.getElementById("ville");
        selectVille.innerHTML = "";
        if (villes[0] === "") {
            inputCP.title = "Ce code postal n'existe pas !";
            inputCP.style.backgroundColor = "pink";
        } else {
            for (v of villes) {
                optionVille = document.createElement("option");
                optionVille.value = v;
                optionVille.innerHTML = v;
                selectVille.appendChild(optionVille);
            }
        }
    }
}