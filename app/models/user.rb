class User < ApplicationRecord
  has_secure_password

  has_many :sessions, dependent: :destroy

  has_one_attached :avatar

  enum :role, { member: 0, admin: 1 }, default: :member

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  validates :email_address, presence: true, uniqueness: true
end
