class AddDistrictIdToEmployees < ActiveRecord::Migration
  def change
    add_reference :employees, :district, index: true, foreign_key: true
  end
end
