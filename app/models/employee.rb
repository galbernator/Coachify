class Employee < ActiveRecord::Base
  belongs_to :location

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :location, presence: true
end
