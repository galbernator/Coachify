class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
