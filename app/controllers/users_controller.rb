# GETS ============================================

get '/signup' do
	erb :signup
end


# POSTS ============================================

post '/signup' do
  #¿Qué va en esta parte para registrar al jugador?
	name = params[:fullname]
  email = params[:email]
  password = params[:pass]
  @user = Player.new(name: name, email: email, password: password)
  
  if @user.save 

    session[:id] = @user.id
    redirect to "/secret"
    
  else
    redirect to "/signup"
  end

end