get '/score/:user_id' do
  #¿Qué va en esta parte para obtener la puntuación de cada jugador (submarinos destruidos en cada ronda) y
  #número de juegos ganados?
  puts "*" * 100
  puts params
  puts params[:user_id]
  @user = Player.find(params[:user_id])
  @rounds = @user.games
  erb :round
  
end

post '/games' do
  
  
  # puts params
  puts destroyed_submarine = params[:submarin].to_i

  @player = Player.find(params[:id])
  puts "*" * 100
  num = @player.round_won
  round = num
  
  if destroyed_submarine == 2
    result = "Winner"
    round += 1
    puts "*" * 100
    puts @player.update(round_won: round)

  elsif destroyed_submarine == 1
    result = "Almost"
  else
    result = "Failed"
  end

  @player.games << Game.new(result: result, destroyed_submarine: destroyed_submarine)

  #¿Qué va en esta parte para recibir la información del round actual, el score del jugador, el conteo de las
  #oportunidades de cada jugador, así como la sesión actual?


  #¿Qué va en esta parte para llevar el registro de las puntuaciones por ronda?
  
end

post '/new_game' do
  #¿Qué va en esta parte para redirigir a secret?
  redirect to "/secret"
 
end
