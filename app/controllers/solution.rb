
# SAVE CURRENT ROUND IN A SESSION


#We need to add session to round..
#if user starts new round, Round.new..else, Round.find(params[:id]),
#then add this to session.

# Set this in Round class initialization: @guesses_left=3




#----------- Card/Solution -----------

get 'card_solution/:id' do

  #card_id
  #round_id

  @current_round=Round.find(session[:round])

  card=Card.find(params[:id])

  @type=card.guess.type  # type is set to correct or incorrect
  @hint=card.hint       # card hint
  @answer=card.answer   #correct answer

  if (@current_round.total_guess_count - @current_round.correct_guess_count) >= 1
    @guesses_left -= 1

    erb :card_solution  #the next button will route to post 'card/:id'
  else
    redirect '/game_over'
  end

end


# Game over page
get '/game_over' do
  @total_guesses=@current_round.guesses.count   #total guesses
  @total_cards= @current_round.deck.cards.count      # Total cards
  erb :game_over
end


# When you click Next on card_solution page, gives you new card
post 'card/:id' do
  card=Card.where(id: params[:id])
  @total_cards= @current_round.deck.cards.count

  until !@current_round.guesses.cards.id.include?(@card_id) #Until this card hasn't been guessed
    @card_id= (1+rand(@total_cards)) # random number?
  end

  redirect to ('/card:#{@card_id}')
end
















#----------- Game_Over -----------
