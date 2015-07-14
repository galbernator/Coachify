class RemoveColumnsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :is_site_admin
    remove_column :users, :is_admin
    remove_column :users, :is_manager
  end
end
