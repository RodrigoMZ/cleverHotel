# == Schema Information
#
# Table name: languages
#
#  id            :integer          not null, primary key
#  hotel_id      :integer
#  url           :string           not null
#  language_code :string           not null
#

class Language < ActiveRecord::Base
  belongs_to :hotel
end
