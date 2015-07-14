class User < ActiveRecord::Base

  has_secure_password

  mount_uploader :avatar, AvatarUploader

  has_many :blogposts, dependent: :nullify
  belongs_to :company
  belongs_to :location
  has_many :observations, dependent: :nullify

  has_many :sent_invitations, class_name: "Invitation", foreign_key: "sender_id"
  belongs_to :invitation

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true,
          format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :password, presence: true, on: :creation
  validates :password_confirmation, presence: true, on: :creation
  validates :location, presence: true, on: :creation
  validates :invitation_token, presence: true, on: :creation
  validates :invitation_id, uniqueness: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def invitation_token
    invitation_token if invitation
  end

  def invitation_token=(token)
    self.invitation = Invitation.find_by_token(token)
  end

end
