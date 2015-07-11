class Response < ActiveRecord::Base
  belongs_to :evaluation
  belongs_to :observation
  belongs_to :response
  has_many :answers, dependent: :nullify

end
