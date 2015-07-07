class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.references :company, index: true, foreign_key: true
      t.string :title

      t.timestamps null: false
    end
  end
end
