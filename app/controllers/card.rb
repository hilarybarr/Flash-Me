get "/card/guess/:id" do 


@card = Card.find(params[:id])

erb :card_guess
end 

post "/card/solution" do


redirect "/card_solution/:id"	
end 
