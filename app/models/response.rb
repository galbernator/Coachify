class Response < ActiveRecord::Base
  belongs_to :evaluation
  belongs_to :observation
  has_many :answers, dependent: :nullify

end
