class CreateObservations < ActiveRecord::Migration
  def change
    create_table :observations do |t|
      t.references :evaluation, index: true, foreign_key: true
      t.integer :subject_id
      t.integer :observer_id

      t.timestamps null: false
    end
  end
end
