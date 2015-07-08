class Question < ActiveRecord::Base
  belongs_to :evaluation
  belongs_to :user

  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, allow_destroy: true,
        reject_if: lambda { |x| x[:answer].empty? }

  validates :text, presence: true, uniqueness: true
end
