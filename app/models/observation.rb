class Observation < ActiveRecord::Base
  belongs_to :evaluation
  has_many :responses, dependent: :nullify
end
