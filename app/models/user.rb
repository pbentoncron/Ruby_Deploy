class User < ActiveRecord::Base
  has_secure_password
  has_many :ideas
  has_many :likes, dependent: :destroy
  has_many :ideas_liked, through: :likes, source: :ideas

	validates_presence_of :name, :alias, :email
	
	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
	validates :name, :alias, length: { in: 2..20 }
end
