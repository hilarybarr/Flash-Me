get '/' do
  # render home page
  @users = User.all
  redirect '/decks' unless current_user.nil? 
  erb :index
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  @user = User.new
  erb :sign_up
end

post '/users' do
  # sign-up

  @user = User.new params[:user]
  if @user.save
    # successfully created new account; set up the session and redirect
    session[:user_id] = @user.id
    redirect '/decks'
  else
    # an error occurred, re-render the sign-up form, displaying errors
    erb :sign_up
  end
end

