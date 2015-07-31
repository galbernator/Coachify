class AddDistrictToUser < ActiveRecord::Migration
  def change
    add_reference :users, :district, index: true, foreign_key: true
  end
end
