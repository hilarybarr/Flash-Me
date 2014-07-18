class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.strings :hint
      t.strings :answer
    end
  end
end
