get '/decks' do
  # render decks page
  session[:user_id]

  erb :decks
end