get '/mains' do
  @main = Main.all
  
  erb :'mains/index'
end

#Page to add a new main
get '/mains/new' do

  erb :'mains/new'
end

#Submit new main to database
post '/mains' do
  #create new 'main' ->
  # @main = Main.create(title: params[:title], bodyparams[:body])
  if @main.invalid?
    @errors = @main.errors.full_messages
    erb :'mains/new'
  else
    redirect "/mains"
  end
end

#See a specific main
get '/mains/:id' do
  @main = Main.find(params[:id])

  erb :'mains/show'
end

get '/mains/:id/edit' do
  @main = Main.find_by(id: params[:id])

  erb :'mains/edit'
end

#Edit a specific main
put '/mains/:id' do
  @main = Main.find(params[:id])
  # attribues = {FILL IN PARAMS HERE}
  # attribues = {title: params[:title], body: paramsbody]}
  @main.update_attributes(attribues)

  redirect "/mains/#{@main.id}"
end

#Delete a specific post
delete '/mains/:id' do
  @main = Main.find_by(id: params[:id])
  @main.destroy

  redirect '/mains'
end