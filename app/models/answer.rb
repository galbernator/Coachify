class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :responses, dependent: :nullify
  belongs_to :evaluation
  belongs_to :observation
end
