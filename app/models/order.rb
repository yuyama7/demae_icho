class Order < ApplicationRecord
  enum status: [:requested, :rejected, :delivering, :received]
end
