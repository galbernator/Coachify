class AddRoleIdToInvitation < ActiveRecord::Migration
  def change
    add_reference :invitations, :role, index: true, foreign_key: true
  end
end
