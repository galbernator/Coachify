class User < ActiveRecord::Base

  has_secure_password

  mount_uploader :avatar, AvatarUploader

  has_many :blogposts, dependent: :nullify
  belongs_to :company

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true,
          format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :password, presence: true, on: :creation

  def full_name
    "#{first_name} #{last_name}"
  end

end
