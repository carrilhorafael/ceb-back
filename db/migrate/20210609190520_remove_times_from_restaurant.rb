class RemoveTimesFromRestaurant < ActiveRecord::Migration[6.1]
  def change
    remove_column :restaurants, :open_at, :datetime
    remove_column :restaurants, :close_at, :datetime
    add_column :restaurants, :open_at, :time
    add_column :restaurants, :close_at, :time

  end
end
