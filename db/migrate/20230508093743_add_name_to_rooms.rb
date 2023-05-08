class AddNameToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :room_id, :string
    add_column :rooms, :user_id, :string
  end
end
