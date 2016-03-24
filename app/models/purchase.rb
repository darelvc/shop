class Purchase < ActiveRecord::Base
  belongs_to :product

  belongs_to :user

  belongs_to :order

  validates :quantity, presence: true

  validates :product_id, uniqueness: { scope: [:user_id, :order_id] }

  scope :cart, -> { where(order_id: nil) }
end
