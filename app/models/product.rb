class Product < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :name, :amount

  after_initialize :init

  def init
    self.purchased = false if self.purchased.nil?
  end
end
