class AddAddressToUser < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :address, null: false, foreign_key: true
  end
end
