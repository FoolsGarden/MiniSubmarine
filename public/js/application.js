//función que inicia el juego
function start_game(subOne, subTwo) {
  //variable que tiene un arreglo asignado con la posición de los dos submarinos a destruir
  var winner = randomCell();
  
    $('.cell').on("click", function(evento){
      var playerClick = $(this).attr('id'); 
      var url = $('#play').attr('action');
      //¿qué debería ir aquí para conocer el número de submarinos destruidos o si el jugador es ganador?
      won(playerClick, winner);
      console.log(winner)
      countForPlay += 1;
      //¿que debería ir aquí para mandar al controlador el conteo de submarinos destruidos y el
      //conteo de oportunidades por ronda?∫

      if (countForPlay == 3){
        $.post(url, { submarin: nowWinner, id: idPlayer }, function(data){
        
         console.log(nowWinner)
        });
      }
      
      
    });
  
  //función para conocer el número de submarinos destruidos o si el jugador es ganador
  function won(playerValue, subValue) {
    if (nowWinner >= 2){
      status = true;
      alert("Game Over");
    }
    if (countForPlay <= 2) {
      if (playerValue == subValue[0] || playerValue == subValue[1]) {
        $('#' + playerValue).css("background","red");
        //variable que lleva el conteo de submarinos destruidos
        wow = nowWinner += 1;
      }else{
        $('#' + playerValue).html("X");
      }
    }else{
      if (status == "false"){
        alert("Game Over");
      }
      if (countForPlay >= 2) {
        subValue.forEach(function(cel){
          $('#' + cel).css("background","red");
        });
      }
    }
    //¿que debería ir aquí para conocer el número de submarinos destruidos y conocer ganador?
  
    score(nowWinner);
  }
}

//función que muestra el score del jugador
function score(value) {
  if (value <= 2){
    $('h3').text('Destroyed Submarines: ' + value );
  }
  if (value == 2){
    $('#win').text('WINNER!');
  }
}

//función que genera el tablero de juego
var resetInit = function() {
  $("#container").empty();
  $("#container").innerHTML = '';
  $("#container div").fadeOut();
  $('#container').css('background','#FE7E25');
  $('.cell').css('color', 'white');
  $('#container').css('background','#FFFFFF');
  //¿qué debería ir aquí para generar las celdas cada vez que se inicia juego?
  var table = $('<table></table>');
  for(i=0; i<9; i++){
    var row = $('<td></td>').addClass('cell');
    row.attr('id', "c" + i);
    table.append(row);
  }

  $('div#container').append(table);

}

//función que genera la posición de los dos submarinos
var randomCell = function() {
  //variables para asignar el valor de la posición de los submarinos
  var subOne = Math.floor(Math.random() * 9);
  var subTwo = Math.floor(Math.random() * 9);
  //¿qué debería ir aquí para generar las dos posiciones de los submarinos?
  
  var valueSubOne = "c" + subOne;
  var valueSubTwo = "c" + subTwo;
  if(valueSubOne == valueSubTwo){
    subTwo = Math.floor(Math.random() * 9);
  }else{
    return [valueSubOne, valueSubTwo]
  }
}


$(document).ready(function(){
    $('#play').on("submit", function(evento){
      evento.preventDefault();
      resetInit();
      var url = $('#play').attr('action');
      idPlayer = $('#id').attr('value');
      // console.log(url);
      // console.log(id);
      $('h3').text(" ")
      $('#win').text(" ");
      //variable que lleva el conteo de oportunidades por ronda
      countForPlay = 0;
      //variable que lleva el conteo de submarinos destruidos
      nowWinner = 0;
      //variable que termina el juego 'alert game over'
      status = false;
      //¿que debería ir aquí para comenzar el juego?
      start_game(randomCell);
  	  
	  });
});