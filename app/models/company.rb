class Company < ActiveRecord::Base

  has_many :locations, dependent: :nullify
  has_many :evaluations, dependent: :nullify
  has_many :users, dependent: :nullify
  has_many :districts, dependent: :nullify
  has_many :invitations, dependent: :nullify

  has_many :observations, through: :users

  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true
  validates :address, presence:true, on: :update
  validates :first_name, presence:true, on: :update
  validates :last_name, presence:true, on: :update
  validates :phone_number, presence:true, on: :update
end
