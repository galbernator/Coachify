class AddIsSiteAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_site_admin, :boolean
  end
end
