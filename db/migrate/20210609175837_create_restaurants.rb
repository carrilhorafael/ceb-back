class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :cnpj
      t.datetime :open_at
      t.datetime :close_at
      t.references :owner, null: false, foreign_key: {to_table: :users}
      t.references :address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
