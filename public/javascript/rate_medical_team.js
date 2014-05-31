var allowDrop, drag, drop;
var star_counter = {};
window.onload = function () {
    allowDrop = function (ev)
    {
        ev.preventDefault();
    }
    
    drag = function (ev)
    {
        ev.dataTransfer.setData("Text",ev.target.id);
    }
    
    var medical_team = document.getElementsByClassName('medical-professional');
    
    var team_names = Array.prototype.map.call(
        medical_team, 
        function(e) {
            star_counter[e.id] = 0; 
            console.log(e.id);
            return e.id;
        });
    
    
    drop = function(ev) {
        star_counter[ev.target.id] += 1;
        ev.preventDefault();
        var data = ev.dataTransfer.getData("Text");
        ev.target.appendChild(document.getElementById(data).cloneNode(true));
        console.log(star_counter);
    }

    submit = function() {
        var xhr = new XMLHttpRequest();
        xhr.open("post", "./rate_medical_team", true);
        xhr.setRequestHeader('Content-Type', 'application/json; charset=UTF-8');

        xhr.send(JSON.stringify(star_counter));

        xhr.onloadend = function() {};
    }
}
