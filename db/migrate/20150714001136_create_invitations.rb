class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :sender_id, index: true
      t.string :recipient_email
      t.string :token
      t.boolean :is_site_admin
      t.boolean :is_admin
      t.boolean :is_manager

      t.timestamps null: false
    end
  end
end
