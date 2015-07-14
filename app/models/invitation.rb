class Invitation < ActiveRecord::Base

  include Tokenable

  belongs_to :sender, class_name: "User", foreign_key: :sender_id
  has_one :recipient, class_name: "User"
  belongs_to :role

  validates :recipient_email, presence: true
  validate :recipient_is_not_registered


  private

  def recipient_is_not_registered
    errors.add :recipient_email, 'is already registered' if User.find_by_email(recipient_email)
  end

end
