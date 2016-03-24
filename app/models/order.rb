class Order < ActiveRecord::Base
  belongs_to :user

  has_many :purchases

  has_many :product, through: :purchases
end
