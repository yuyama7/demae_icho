class Menu < ApplicationRecord
  belongs_to :restaurant
  mount_uploader :image_path, ImageUploader
end
