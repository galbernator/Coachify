class AddSubjectIdToResponse < ActiveRecord::Migration
  def change
    add_column :responses, :subject_id, :integer
  end
end
