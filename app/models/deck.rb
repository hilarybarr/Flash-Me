class Deck < ActiveRecord::Base
  has_many :cards
  has_many :rounds
  belongs_to :user through: :rounds
end
