class Question < ActiveRecord::Base
  belongs_to :evaluation
  belongs_to :user

  has_many :responses, dependent: :nullify
  has_many :answers, dependent: :nullify
  accepts_nested_attributes_for :answers, allow_destroy: true,
        reject_if: lambda { |x| x[:answer].empty? }

  validates :text, presence: true, uniqueness: true
end
