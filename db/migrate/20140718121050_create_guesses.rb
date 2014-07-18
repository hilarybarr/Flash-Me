class CreateGuesses < ActiveRecord::Migration
  def change
  	  create_table :guesses do |t|
       t.boolean :type
       t.references :user
       t.references :card
       t.timestamps
  end
end
