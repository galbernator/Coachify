class RemoveSubjectIdColumnFromResponse < ActiveRecord::Migration
  def change
    remove_column :responses, :subject_id
  end
end
