class CreateDelivermen < ActiveRecord::Migration[6.1]
  def change
    create_table :delivermen do |t|
      t.string :cnh
      t.string :vehicle
      
      t.timestamps
    end
  end
end
