get "/decks" do
  # render decks page
  session[:user_id]
  @decks = Deck.all

  erb :decks
end


get "/game_deck/:id" do 
	@deck = Deck.find(params[:id])
	erb :round_intro
end


post "/deck/setup" do 
	@deck = Deck.find(params[:deck].to_i)
	@round = Round.create(
				 correct_guess_count: 0, 
				 deck_id: @deck.id,
				 user_id: current_user)

	session[:round_id] = @round.id
	redirect "/card/guess"
end