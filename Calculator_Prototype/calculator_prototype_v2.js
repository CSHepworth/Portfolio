function multiplyFunction() {
    var x = document.getElementById("x").value;
    var y = document.getElementById("y").value;
    var z = x * y;
    document.getElementById("Result").innerHTML = z;
}
function divideFunction() {
    var x = document.getElementById("x").value;
    var y = document.getElementById("y").value;
    var z = x / y;
    document.getElementById("Result").innerHTML = z;
}
function addFunction() {
    var x = document.getElementById("x").value;
    var y = document.getElementById("y").value;
    var z = +x + +y;
    document.getElementById("Result").innerHTML = z;
}
function subtractFunction() {
    var x = document.getElementById("x").value;
    var y = document.getElementById("y").value;
    var z = x - y;
    document.getElementById("Result").innerHTML = z;
}