class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :player1_id  
      t.integer :player2_id  
      t.integer :player3_id  
      t.integer :player4_id  
      t.integer :player_turn
      t.integer :current_high_bet
      t.timestamps
    end
  end
end
