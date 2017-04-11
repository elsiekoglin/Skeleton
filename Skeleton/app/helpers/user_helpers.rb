module UserFormatting

  def logged_in?
    !!session[:user_id]
  end

  # ADJUST ACCORDINGLY
  # def current_user
  #   @user ||= User.find_by(id: session[:user_id]if logged_in?
  # end

  # def author?(user_id)
  #   session[:user_id] == user_id
  # end

end

helpers UserFormatting