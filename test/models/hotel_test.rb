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

require 'test_helper'

class HotelTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
