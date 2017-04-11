get '/mains' do
  @main = Main.all
  
  erb :'mains/index'
end

# -------------------------------------------

#Page to add a new main
get '/mains/new' do
  if logged_in?

    erb :'mains/new'
  else
    redirect '/sessions/new'
  end
end

#Submit new main to database
post '/mains' do
  @main = Main.new(params[:main])
  @main.user_id = session[:user_id]
  if @main.save
    redirect '/mains'
  else
    @errors = @main.errors.full_messages
    erb :'mains/new'
  end
end

# -------------------------------------------

#See a specific main
get '/mains/:id' do
  @main = Main.find(params[:id])
  
  erb :'mains/show'
#   @question = Question.find_by(id: params[:id])
#   @question_comments = @question.comments
#   @answers = @question.answers
#   @answer_comments = Answer.where(question_id: params[:id])
#   erb :'questions/show'
end

# -------------------------------------------

get '/mains/:id/edit' do
  @main = Main.find_by(id: params[:id])

  erb :'mains/edit'
end

#Edit a specific main
put '/mains/:id' do
  @main = Main.find_by(id: params[:id])
  @main.update_attributes(params[:main])

  if @main.save
    redirect "/mains/#{@main.id}"
  else
    @errors = @main.errors.full_messages
    erb :'mains/edit'
  end
end

# -------------------------------------------

# Any editing/deleting - any changes in the DB.
# Authenticate - are you who you say you are (logged in session should match the user id)
# Authorization - do you have the ability to do this (if it belongs to you, then you're authorized to get rid of it.) OWNER

#Delete a specific post
delete '/mains/:id' do
 	main = Main.find_by(id: params[:id])
 	user = User.find_by(id: session[user_id])
 	
  if user.id == main.user_id
    main.destroy
    redirect '/mains'
  else
    # "You are not uthorized to delete this subscription"
  end
end


# delete '/mains/:id' do
#   @main = Main.find_by(id: params[:id])
#   @main.destroy

#   redirect '/mains'
# end







