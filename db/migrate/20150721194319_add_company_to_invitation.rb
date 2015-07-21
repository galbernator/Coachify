class AddCompanyToInvitation < ActiveRecord::Migration
  def change
    add_reference :invitations, :company, index: true, foreign_key: true
  end
end
