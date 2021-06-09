class CreateWorkDays < ActiveRecord::Migration[6.1]
  def change
    create_table :work_days do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.references :day, null: false, foreign_key: true

      t.timestamps
    end
  end
end
