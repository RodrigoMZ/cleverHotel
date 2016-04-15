# == Schema Information
#
# Table name: images
#
#  id         :integer          not null, primary key
#  hotel_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  picture    :string
#  logo       :string
#

class Image < ActiveRecord::Base
  mount_uploader :picture, ImageUploader
  mount_uploader :logo, ImageUploader

  belongs_to :hotel
end
