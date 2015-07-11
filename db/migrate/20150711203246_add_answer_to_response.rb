class AddAnswerToResponse < ActiveRecord::Migration
  def change
    add_reference :responses, :answer, index: true, foreign_key: true
  end
end
