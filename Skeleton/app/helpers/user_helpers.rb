module UserFormatting
  def logged_in?
    !!session[:user_id]
  end
  
  def current_user
    User.find_by(id: session[:user_id]) if logged_in?
  end
  
  def author?(user_id)
    session[:user_id] == user_id
  end
  
#   def subscribed?(channel_id)
#    user = User.find_by(id: session[:user_id])
#    user.subscriptions.each do  |subscription| 
#      if subscription.channel.id == channel_id
#        return true
#      end
#    end
#    return false
#  end
end

helpers UserFormatting
