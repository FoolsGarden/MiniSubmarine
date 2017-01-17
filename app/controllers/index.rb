before '/secret' do 
  if session[:id] == nil
    redirect to '/signin'
  end
end 

get '/' do
  erb :index
end

get '/secret' do
  session[:id]
  @user = Player.find(session[:id])
  erb :secret
end
