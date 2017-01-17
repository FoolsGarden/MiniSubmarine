# GETS ============================================

get '/signin' do
	erb :signin
end

get '/logout' do
  #¿Qué va en esta parte para cerrar la sesión?
  session.clear
  redirect to '/'  
end

# POSTS ============================================

post '/signin' do
  #¿Qué va en esta parte para ingresar al juego?
  # @user = Player.new(name: )
  email = params[:email]
  password = params[:pass]
  if Player.authenticate(email, password)
    @user = Player.find_by(email: email)
    session[:id] = @user.id
    redirect to "/secret"

  else
    redirect to '/signin'
  end

end
