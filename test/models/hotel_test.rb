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

require 'test_helper'

class HotelTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
