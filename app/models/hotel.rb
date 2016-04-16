# == Schema Information
#
# Table name: hotels
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  address    :string
#  city       :string
#  country    :string
#  postcode   :string
#  area_type  :string
#  hotel_type :string
#  latitude   :string
#  longitude  :string
#

class Hotel < ActiveRecord::Base

  has_many :images
  has_many :languages
  has_many :neighborhoods
  has_many :pois

  accepts_nested_attributes_for :neighborhoods
  accepts_nested_attributes_for :pois
  accepts_nested_attributes_for :languages
  accepts_nested_attributes_for :images

  AREA_TYPE = ["Urban", "Beach", "Ski", "Rural"]
  HOTEL_TYPE = ["Hotel", "Apartment", "Hostal"]


  after_create :get_lat_long

  def get_lat_long
    points = Geocoder.coordinates(self.address)
    self.update_attributes(latitude: points[0], longitude: points[1])
  end
end
