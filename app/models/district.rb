class District < ActiveRecord::Base
  belongs_to :company
  has_many :locations, dependent: :nullify
end
