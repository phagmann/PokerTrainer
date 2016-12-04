class CreatePots < ActiveRecord::Migration
  def change
    create_table :pots do |t|
      t.integer :game_id
      t.integer :total_chips, default: 0
      t.timestamps
    end
  end
end
