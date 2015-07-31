class RemoveColumnDistrictFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :district_id
  end
end
