class Location < ActiveRecord::Base
  belongs_to :district
  belongs_to :company
  has_many :users, dependent: :nullify
  has_many :employees, dependent: :nullify
end
