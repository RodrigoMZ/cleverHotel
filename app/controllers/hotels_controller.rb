class HotelsController < ApplicationController

	def new

	end

	def create
		@hotel = Hotel.new(hotel_params)
		@hotel.save
		redirect_to hotels_url
	end

	def index
		@hotels = Hotel.all
	end

	def show
		@hotel = Hotel.find(params[:id])
	end

	private
	def hotel_params
		params.require(:hotel).permit(:name)
	end

end
