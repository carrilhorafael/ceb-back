class AddRoleToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :role, :integer
    add_column :users, :validation_token, :string
    add_column :users, :has_validated, :boolean, default: false
    add_column :users, :validation_token_expiry_at, :datetime
  end
end
