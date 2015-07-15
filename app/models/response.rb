class Response < ActiveRecord::Base
  belongs_to :evaluation
  belongs_to :observation
  belongs_to :question
  belongs_to :answer

end
