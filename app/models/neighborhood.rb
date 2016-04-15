# == Schema Information
#
# Table name: neighborhoods
#
#  id         :integer          not null, primary key
#  hotel_id   :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Neighborhood < ActiveRecord::Base
  belongs_to :hotel
end
