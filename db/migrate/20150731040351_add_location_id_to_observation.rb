class AddLocationIdToObservation < ActiveRecord::Migration
  def change
    add_reference :observations, :location, index: true, foreign_key: true
  end
end
