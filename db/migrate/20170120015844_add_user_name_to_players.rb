class AddUserNameToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :user_name, :string
  end

end
