get '/users/new' do

  erb :'/users/new'
end


post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/mains"
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end


get '/users/:id' do
  @user = User.find_by(id: session[:user_id])
# !!!!!!!!!! restrict the route from being accassable by just trying into the browser.
  if logged_in? && user.id == session[:user_id]
    erb :'/users/show'
  else
    redirect '/sessions/new'
  end
end

