class Round < ActiveRecord::Base
  # Remember to create a migration!
  attr_accessor :guess_count

  def initialize
  	@guess_count=3
  end

  belongs_to :user
  belongs_to :deck
  has_many :guesses
end
