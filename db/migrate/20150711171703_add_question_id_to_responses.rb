class AddQuestionIdToResponses < ActiveRecord::Migration
  def change
    add_reference :responses, :question, index: true, foreign_key: true
  end
end
