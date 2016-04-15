class Image < ActiveRecord::Base
  mount_uploader :picture, ImageUploader
  mount_uploader :logo, ImageUploader

  belongs_to :hotel
end
