class Round < ActiveRecord::Base
  # Remember to create a migration!
  
  # Deleted the attr_accessor and instead used correct_guess_count method
  attr_accessor :guess_count



  belongs_to :user
  belongs_to :deck
  has_many :guesses
  has_many :guessed_cards, through: :guesses, source: :card 
  
  def playable_cards 
  	deck.cards.select{|card| card unless guessed_cards.include? card}
  end
end
