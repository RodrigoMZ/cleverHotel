class HotelsController < ApplicationController

	def new
		@hotel = Hotel.new
	end

	def create
		@hotel = Hotel.new(hotel_params)
    @hotel.save

		respond_to do |format|
			# if @hotel.save && params[:images]['picture'] && params[:images]
			if @hotel.save && params[:images].present?
				if params[:images]["picture"].present?
					params[:images]['picture'].each do |pic|
        		@hotel.images.create!(:picture => pic)
					end
        end
				if params[:images]["logo"].present?
					@hotel.images.create!(:logo => params[:images]['logo'])
        end
        # @hotel.images.first.update_attributes(:logo => params[:images]['logo'])
				# @hotel.images.create!(:logo => params[:images]['logo'])
        format.html { redirect_to ads_path( hotel: @hotel.id )}
			# elsif params[:images] && !params[:images]['picture'].present? && @hotel.save
			elsif @hotel.save && !params[:images].present?
     	# 	@hotel.images.create!(:logo => params[:images]['logo'])
     		format.html { redirect_to ads_path( hotel: @hotel.id ) }
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

	def destroy
		@hotel = Hotel.find(params[:id])
		@hotel.destroy
	end

	def import
		Hotel.import(params[:file])
		redirect_to root_path, notice: "Hotels imported correctly"
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
