

require "csv"


file = File.open("lib/world_capitals.txt")
temp = []
Deck.create(name: "Capitals of The World")
file.each do |row|
  temp << row.split("\r")
  @pairs = temp.each_slice(1).to_a.flatten.flatten.each_slice(1).to_a
end

@pairs.each do |pair|
  for each_object in pair
    splitted_pair = each_object.split(',')
    Card.create(hint: splitted_pair[0],answer: splitted_pair[1],deck_id: Deck.find_by_name("Capitals of The World").id)
  end
end

# TODO: create associations between users and skills
