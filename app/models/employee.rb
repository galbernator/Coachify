class Employee < ActiveRecord::Base
  belongs_to :location

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :location, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
  
end
