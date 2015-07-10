class AddDistrictToLocations < ActiveRecord::Migration
  def change
    add_reference :locations, :district, index: true, foreign_key: true
  end
end
