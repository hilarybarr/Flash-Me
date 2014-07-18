class CreateRounds < ActiveRecord::Migration
  def change
  	create_table :rounds do |t|
  		t.integer :correct_guess_count 
  		t.integer :total_guess_count
  		t.integer :total_cards
  		t.references :deck
  		t.references :user

  		t.timestamps 
  	end
  end
end
