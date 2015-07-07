class Comment < ActiveRecord::Base

  belongs_to :blogpost

  validates :body, presence: true
end
