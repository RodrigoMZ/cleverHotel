class HotelsController < ApplicationController

	def new
		@hotel = Hotel.new
	end

	def create
		@hotel = Hotel.new(hotel_params)
		@hotel.save
		respond_to do |format|
     if @hotel.save
        params[:images]['picture'].each do |pic|
          @hotel.images.create!(:picture => pic)
        end
        @hotel.images.first.update_attributes(:logo => params[:images]['logo'])
        format.html { redirect_to @hotel, notice: 'Post was successfully created.' }
     else
       format.html { render action: 'new' }
     end
   end
	end

	def index
		@hotels = Hotel.all
	end

	def show
		@hotel = Hotel.find(params[:id])
	end

	private
	def hotel_params
		params.require(:hotel).permit(:name,
			:address,
			:city,
			:country,
			:postcode,
			:area_type,
			:hotel_type,
			images: [:logo, :picture, :_destroy],
			neighborhoods_attributes: [:name, :_destroy],
			pois_attributes: [:name, :_destroy],
			languages_attributes: [:url, :language_code, :price, :_destroy]
		)
	end

end
