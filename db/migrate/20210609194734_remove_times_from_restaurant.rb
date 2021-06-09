class RemoveTimesFromRestaurant < ActiveRecord::Migration[6.1]
  def change
    remove_column :restaurants, :open_at, :datetime
    remove_column :restaurants, :close_at, :datetime
    add_column :restaurants, :open_at, :string
    add_column :restaurants, :close_at, :string
    add_column :restaurants, :workdays, :string
  end
end
