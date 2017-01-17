get '/records' do
  #¿Qué va en esta parte para obtener la lista de ganadores (juegos ganados)? Ordenados en orden descendente
  @players = Player.all.order(round_won: :desc)
	erb :record
end