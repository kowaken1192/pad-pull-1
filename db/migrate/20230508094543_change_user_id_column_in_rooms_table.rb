class ChangeUserIdColumnInRoomsTable < ActiveRecord::Migration[6.1]
  def change
    change_column :rooms, :user_id, :integer
  end
end
