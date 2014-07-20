get "/card/guess" do 
	redirect '/' if current_user.nil? 
	@card = current_round.playable_cards.sample
	erb :card_guess
end 

post "/card/solution/:id" do
	@card = Card.find(params[:id])
	guess = params[:guess] 
	if guess.downcase == @card.answer.downcase
		correct = true 
		current_round.increment!(:correct_guess_count)
	else
		correct = false
	end
	@guess = Guess.create(correct: correct, 
				 user_id: current_user.id, 
				 card_id: params[:id], 
				 round_id: session[:round_id])
	
	redirect "/card_solution/#{@card.id}"	
end 


