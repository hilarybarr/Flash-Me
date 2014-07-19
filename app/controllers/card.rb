get "/card/guess/:id" do 

redirect '/' if current_user.nil? 
@card = Card.find(params[:id])

erb :card_guess
end 

post "/card/solution/:id" do
	puts "Kello"
	card = Card.find(params[:id])
	guess = params[:guess] 
	if guess == card.answer
		score = true 
	else
		score = false
	end
	Guess.create(type: score, 
				 user_id: current_user.id, 
				 card_id: params[:id], 
				 round_id: session[:round])

	redirect "/card_solution/#{card.id}"	
end 


