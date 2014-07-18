class Card < ActiveRecord::Base
  belongs_to :deck
  has_one :guess
end
