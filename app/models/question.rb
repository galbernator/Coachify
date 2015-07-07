class Question < ActiveRecord::Base
  belongs_to :evaluation
  belongs_to :user
end
