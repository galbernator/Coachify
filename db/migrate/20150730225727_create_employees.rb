class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.references :location, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
