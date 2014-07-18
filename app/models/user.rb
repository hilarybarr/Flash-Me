class User < ActiveRecord::Base
	has_many :rounds
	has_many :decks, through: :rounds
	has_many :guesses 
	has_many :cards, through: :guesses

end
