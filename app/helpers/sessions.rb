helpers do
  
  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_round
  	@round ||=Round.find(session[:round_id]) if sessions[:round_id]
  end 

end
