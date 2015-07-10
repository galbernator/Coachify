class AddObservationToResponses < ActiveRecord::Migration
  def change
    add_reference :responses, :observation, index: true, foreign_key: true
  end
end
