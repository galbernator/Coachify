class RemoveColumnsFromQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :evaluation_id
    remove_column :questions, :user_id
  end
end
