class User < ActiveRecord::Base
  has_secure_password

  has_many :products

  # validations

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates_presence_of :first_name, :last_name, :email
  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
