class Evaluation < ActiveRecord::Base
  belongs_to :company

  has_many :responses, dependent: :nullify
  has_many :questions, dependent: :nullify
end
