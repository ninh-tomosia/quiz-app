class Photo < ActiveRecord::Base
    attr_accessible :album_id, :name, :image
    belongs_to :album
    mount_uploader :image, ImageUploader
  end