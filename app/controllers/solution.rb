
# Need to set @current_round to session

#----------- Card/Solution -----------

get '/card_solution/:id' do

  # @current_round= round from session 

  card=Card.find(params[:id])

  @type=card.guess.type  # type is set to correct or incorrect
  @hint=card.hint       # card hint
  @answer=card.answer   #correct answer
  @incorrect_guesses=(@current_round.guesses.count-@current_round.correct_guess_count).to_i
  @guesses_left= (3-@incorrect_guesses.to_i)

  case @incorrect_guesses
  when 0
    @message="Nice job! You haven't gotten anything wrong yet."
  when 1
    @message="Ok, so you got one wrong, but you are still rockin it!"
  when 2
    @message="Cmon, you BETTER get the next one right or you're done!"
  else # 0 guesses left
    redirect '/game_over'
  end

# # Deleted the following and instead redirected to card/guess on card_solution page
#   @total_cards= @current_round.deck.cards.count
#   @next_card_id= (1+rand(@total_cards))
#   until !@current_round.guesses.cards.exists?(id: @card_id) #Until this card hasn't been guessed
#       @next_card_id= (1+rand(@total_cards)) # Randomly chooses which card to display next 
#   end

  erb :card_solution  

end


# Game over page
get '/game_over' do
  @total_guesses=@current_round.guesses.count   #total guesses
  @total_cards= @current_round.deck.cards.count      # Total cards
  @message= "Maybe next time :-("
  erb :game_over
end












#----------- Game_Over -----------
