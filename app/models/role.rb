class Role < ActiveRecord::Base
  has_many :users, dependent: :nullify
  has_many :invitations, dependent: :nullify
end
