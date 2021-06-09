class AddTrackableToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :times_logged, :integer, default: 0, null: false
    add_column :users, :last_login, :datetime, default: nil
  end
end
