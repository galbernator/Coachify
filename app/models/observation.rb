class Observation < ActiveRecord::Base
  belongs_to :evaluation
  has_many :responses, dependent: :nullify
  has_many :answers, dependent: :nullify
  has_many :quesitons, dependent: :destroy
  belongs_to :observer, class_name: "User", foreign_key: :observer_id
  belongs_to :subject, class_name: "User", foreign_key: :subject_id

  validates :subject_id, presence: true
  validates :evaluation_id, presence: true
end
