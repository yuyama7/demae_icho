class Order < ApplicationRecord
  enum status: [:requested, :rejected, :delivering, :received, :accepted]
  belongs_to :restaurant
  has_many :order_items
  belongs_to :user
end
