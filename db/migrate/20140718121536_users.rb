class Users < ActiveRecord::Migration
  def change
  	create_table do |t|
  		t.string :username
  		t.string :password

  		t.timestamps
  	end
  end
end
