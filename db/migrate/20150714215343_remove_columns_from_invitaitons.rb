class RemoveColumnsFromInvitaitons < ActiveRecord::Migration
  def change
    remove_column :invitations, :is_site_admin
    remove_column :invitations, :is_admin
    remove_column :invitations, :is_manager
  end
end
