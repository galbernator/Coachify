class Blogpost < ActiveRecord::Base

  belongs_to :user

  mount_uploader :image, ImageUploader

  has_many :comments, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :body, presence: true

end
