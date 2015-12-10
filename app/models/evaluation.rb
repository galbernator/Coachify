class Evaluation < ActiveRecord::Base

  EVALUATION_KINDS = ['Scale 1-10', 'Grade', 'True or False', 'Multiple Choice', 'Multiple Answer', 'Yes or No', 'Custom']

  belongs_to :company

  has_many :responses, dependent: :nullify
  has_many :questions, dependent: :nullify
end
