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

class Ad < ActiveRecord::Base
	belongs_to :hotel
end
