
function allowDrop(ev)
{
    ev.preventDefault();
}

function drag(ev)
{
    ev.dataTransfer.setData("Text",ev.target.id);
}

    
function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("Text");
    listItem = document.createElement('li');
    listItem.appendChild(document.getElementById(data));
    ev.target.appendChild(listItem);
}
