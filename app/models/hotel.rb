# == Schema Information
#
# Table name: hotels
#
#  id                :integer          not null, primary key
#  name              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  address           :string
#  city              :string
#  country           :string
#  postcode          :string
#  area_type         :string
#  hotel_type        :string
#  latitude          :string
#  longitude         :string
#  price_from        :decimal(, )
#  price_high_season :decimal(, )
#  wifi              :boolean
#  pool              :boolean
#  stars             :decimal(, )
#

class Hotel < ActiveRecord::Base

  has_many :images
  has_many :languages
  has_many :neighborhoods
  has_many :pois
  has_many :ads

  accepts_nested_attributes_for :neighborhoods
  accepts_nested_attributes_for :pois
  accepts_nested_attributes_for :languages
  accepts_nested_attributes_for :images

  AREA_TYPE = ["Urban", "Beach", "Ski", "Rural"]
  HOTEL_TYPE = ["Hotel", "Apartment", "Hostal"]


  after_create :get_lat_long

  #validations
  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :postcode, presence: true
  validates :price_from, presence: true, :numericality => {:allow_blank => true}
  validates :price_high_season, presence: true, :numericality => {:allow_blank => true}
  #validate :must_have_language


  def get_lat_long
    points = Geocoder.coordinates(self.address + "," + self.city + "," + self.country)
    self.update_attributes(latitude: points[0], longitude: points[1]) unless points.nil?
  end

  def must_have_language
    if self.languages.count <= 1
      self.errors.add(:languages, 'must have at least one language')
    end
  end
end
