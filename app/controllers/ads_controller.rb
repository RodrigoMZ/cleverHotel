class AdsController < ApplicationController
  def index
  	@ads = []
  	hotel = Hotel.find(params[:hotel])

  	ad = {
  		:text => "#{hotel.area_type} #{hotel.hotel_type} in #{hotel.city}",
  		:combination => "#AREA_TYPE#   #ACC_TYPE# in #CITY#"
  	}
  	@ads << ad

  	if !hotel.stars.blank?
	  	ad = {
	  		:text => "#{hotel.stars} Stars #{hotel.hotel_type} in #{hotel.city}",
	  		:combination => "#STARS# stars #ACC_TYPE# in #CITY# "
	  	}
	  	@ads << ad
  	end

  	if hotel.wifi?		
	  	ad = {
	  		:text => "Hotel with Free WiFi in #{hotel.city}",
	  		:combination => "Hotel with #AMENITY# in #CITY#"
	  	}
	  	@ads << ad
  	end
  	if hotel.pool?		
	  	ad = {
	  		:text => "Hotel with Pool in #{hotel.city}",
	  		:combination => "Hotel with #AMENITY# in #CITY#"
	  	}
	  	@ads << ad
  	end

  	if !hotel.neighborhoods.blank?
  		hotel.neighborhoods.each do |n|
		  	ad = {
		  		:text => "Save on #{n.name} #{hotel.hotel_type}",
		  		:combination => "Save on #NEIGHBORHOOD#  #ACC_TYPE#"
		  	}
		  	@ads << ad
	  	end
  	end

  	if !hotel.pois.blank?
  		hotel.pois.each do |p|
		  	ad = {
		  		:text => "#{hotel.hotel_type} near #{p.name}",
		  		:combination => "#ACC_TYPE# near #POI#"
		  	}
		  	@ads << ad
	  	end
  	end

  end
end
