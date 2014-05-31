
function allowDrop(ev)
{
    ev.preventDefault();
}

function drag(ev)
{
    ev.dataTransfer.setData("Text",ev.target.id);
}

var medical_team = document.getElementsByClassName('medical-professional')
    .map(function(e) { return e.id; });


    
function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("Text");
    ev.target.appendChild(document.getElementById(data).cloneNode(true));
}
