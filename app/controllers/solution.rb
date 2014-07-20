
# Need to set @current_round to session

#----------- Card/Solution -----------

get '/card_solution/:id' do

  # @current_round= round from session 

  card=Card.find(params[:id])

  @type=card.guess.type  # type is set to correct or incorrect
  @hint=card.hint       # card hint
  @answer=card.answer   #correct answer
  @guesses_left=@current_round.guess_count

  if @type==false   # Decrease guess_count by one is guess was wrong
    @guesses_left -=1
  end

  case @guesses_left
  when 3
    @message="Nice job! You haven't gotten anything wrong yet."
  when 2
    @message="Ok, so you got one wrong, but you are still rockin it!"
  when 1
    @message="Cmon, you BETTER get the next one right or you're done!"
  else # 0 guesses left
    redirect '/game_over'
  end

# Maybe next_card should be in card Model?
  @total_cards= @current_round.deck.cards.count
  @next_card_id= (1+rand(@total_cards))
  until !@current_round.guesses.cards.exists?(id: @card_id) #Until this card hasn't been guessed
      @next_card_id= (1+rand(@total_cards)) # Randomly chooses which card to display next 
  end

  erb :card_solution  

end


# Game over page
get '/game_over' do
  @total_guesses=@current_round.guesses.count   #total guesses
  @total_cards= @current_round.deck.cards.count      # Total cards
  @message= "Maybe next time :-("
  erb :game_over
end



=begin
# When you click Next on card_solution page, gives you new card
post '/next_card' do
  @total_cards= @current_round.deck.cards.count

  @card_id= (1+rand(@total_cards))

  until !@current_round.guesses.cards.exists?(id: @card_id) #Until this card hasn't been guessed
    @card_id= (1+rand(@total_cards)) # Randomly chooses which card to display next 
  end

  redirect to ('/card:#{@card_id}')
end
=end
















#----------- Game_Over -----------
