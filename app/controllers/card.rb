


get "/card/guess" do 
redirect '/' if current_user.nil? 
@card = current_round.playable_cards.sample
session[:round] = 1
erb :card_guess
end 

post "/card/solution/:id" do
	puts "Kello"
	card = Card.find(params[:id])
	guess = params[:guess] 
	if guess == card.answer
		correct = true 
	else
		correct = false
	end
	Guess.create(type: correct, 
				 user_id: current_user.id, 
				 card_id: params[:id], 
				 round_id: session[:round])

	redirect "/card_solution/#{card.id}"	
end 


