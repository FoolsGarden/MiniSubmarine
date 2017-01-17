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
  
  puts "*" * 100
  # puts params
  puts destroyed_submarine = params[:submarin].to_i

  puts @player = Player.find(params[:id])

  
  
  if destroyed_submarine == 2
    result = "Winner"
    round = 1
  elsif destroyed_submarine == 1
    result = "Almost"
    round = 0
  else
    result = "Failed"
    round = 0
  end

  @player.games << Game.new(result: result, destroyed_submarine: destroyed_submarine, round_won: round)
  #¿Qué va en esta parte para recibir la información del round actual, el score del jugador, el conteo de las
  #oportunidades de cada jugador, así como la sesión actual?


  #¿Qué va en esta parte para llevar el registro de las puntuaciones por ronda?
  
end

post '/new_game' do
  #¿Qué va en esta parte para redirigir a secret?
  redirect to "/secret"
 
end
