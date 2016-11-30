class CreateRivers < ActiveRecord::Migration
  def change
    create_table :rivers do |t|
      t.integer :game_id 
      t.integer :card_id 
      t.timestamps
    end
  end
end
