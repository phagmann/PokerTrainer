class CreateChips < ActiveRecord::Migration
  def change
    create_table :chips do |t|
      t.integer :game_id
      t.integer :player_id
      t.integer :chips_in_game
      t.timestamps
    end
  end
end
