class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.date :check_in, null: false
      t.date :check_out, null: false
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false,  foreign_key: true
      t.timestamps
    end
  end
end



