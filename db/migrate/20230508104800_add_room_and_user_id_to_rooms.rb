class AddRoomAndUserIdToRooms < ActiveRecord::Migration[6.1]
  def change
    add_reference :rooms, :room, null: false, foreign_key: true
    add_reference :rooms, :user, null: false, foreign_key: true
  end
end
