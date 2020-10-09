window.onload = init;
function init() {
    var inputs = document.getElementsByTagName("input");
    for (var input of inputs) {
        if (input.hasAttribute('required')) {
            input.onblur = testValideChampRequis;
        }
    }
}

function testValideChampRequis() {
    if (this.value === '') {
        var champ = this.getAttribute('placeholder');
        champ = champ.substr(0, champ.length - 3);
        alert('Veuillez compléter ' + champ + '.');
    }
}
