get '/sessions/new' do
  if session[:user_id]
    redirect "/users"
  else
    erb :'sessions/new'
  end
end

post '/sessions' do
  @user = User.authenticate(params[:email], params[:password])
  if @user
   session[:user_id] = @user.id
   redirect "/users/#{@user.id}"
  else
   @errors = ['Invalid username or password.']
   erb :'sessions/new'
  end
end


delete '/sessions' do
  session[:user_id] = nil 

  redirect '/sessions/new'
end