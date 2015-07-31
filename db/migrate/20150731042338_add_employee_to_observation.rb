class AddEmployeeToObservation < ActiveRecord::Migration
  def change
    add_reference :observations, :employee, index: true, foreign_key: true
  end
end
