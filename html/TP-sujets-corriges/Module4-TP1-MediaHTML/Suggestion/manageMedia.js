function playAudio() {
    let val = document.getElementById("select-audio").value;
    document.getElementById("audio-tag").src = "media/audios/" + val;
}

function playVideo() {
    let val = document.getElementById("select-video").value;
    document.getElementById("video-tag").src = "media/videos/" + val;
    document.getElementById("video-tag").hidden = "";
}