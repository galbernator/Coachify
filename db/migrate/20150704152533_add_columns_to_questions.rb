class AddColumnsToQuestions < ActiveRecord::Migration
  def change
    add_reference :questions, :evaluation, index: true, foreign_key: true
    add_column :questions, :text, :string
    add_column :questions, :type, :string
  end
end
