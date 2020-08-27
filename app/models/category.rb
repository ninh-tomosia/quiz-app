class Category < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many   :tickets
end
