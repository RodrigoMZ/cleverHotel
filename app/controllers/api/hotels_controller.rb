class Api::HotelsController < ApplicationController

	def create
		@hotel = Hotel.new(hotel_params)
    @hotel.save

		respond_to do |format|
			if @hotel.save && params[:images].present?
				if params[:images]["picture"].present?
					params[:images]['picture'].each do |pic|
        		@hotel.images.create!(:picture => pic)
					end
        end
				if params[:images]["logo"].present?
					@hotel.images.create!(:logo => params[:images]['logo'])
        end
				format.json { render json: @hotel }
			elsif @hotel.save && !params[:images].present?
				format.json { render json: @hotel }
     	else
				format.json { render json: @hotel.errors }
     	end
   	end
	end

	def index
		@hotels = Hotel.all
		render json: @hotels
	end

	private
	def hotel_params
		params.require(:hotel).permit(
			:name,
			:address,
			:city,
			:country,
			:postcode,
			:area_type,
			:hotel_type,
      :wifi,
      :pool,
      :price_from,
      :price_high_season,
      :stars,
			images: [:logo, :picture, :_destroy],
			neighborhoods_attributes: [:name, :_destroy],
			pois_attributes: [:name, :_destroy],
			languages_attributes: [:url, :language_code, :price, :_destroy]
		)
	end
end
