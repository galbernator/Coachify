class Company < ActiveRecord::Base

  has_many :locations, dependent: :destroy
  has_many :evaluations, dependent: :destroy
  has_many :users, dependent: :destroy

  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true
  validates :address, presence:true, on: :update
  validates :first_name, presence:true, on: :update
  validates :last_name, presence:true, on: :update
  validates :phone_number, presence:true, on: :update
end
