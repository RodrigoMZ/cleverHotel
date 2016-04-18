# == Schema Information
#
# Table name: ads
#
#  id          :integer          not null, primary key
#  hotel_id    :integer
#  text        :string           not null
#  combination :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class AdTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
