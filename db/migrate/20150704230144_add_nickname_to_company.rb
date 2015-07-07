class AddNicknameToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :nickname, :string
  end
end
