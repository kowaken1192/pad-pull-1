class AddHeadCountToReserves < ActiveRecord::Migration[6.1]
  def change
    add_column :reserves, :head_count, :integer
  end
end
