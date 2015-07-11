class Observation < ActiveRecord::Base
  belongs_to :evaluation
  has_many :responses, dependent: :nullify
  belongs_to :observer, class_name: "User", foreign_key: :observer_id
end
