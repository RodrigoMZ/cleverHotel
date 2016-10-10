require 'rails_helper'

RSpec.describe HotelsController, type: :controller do
  before(:each) do
    @hotel = Hotel.create({:name=>"Vic", :address=>"Paseo Ribalta, 1", :city=>"Castellón", :country=>"Spain", :postcode=>"12001", :price_from=>"20", :price_high_season=>"40"})
    @hotel1 = Hotel.create({:name=>nil, :address=>"Paseo Ribalta, 1", :city=>"Castellón", :country=>"Spain", :postcode=>"12001", :price_from=>"20", :price_high_season=>"40"})
    @hotel2 = Hotel.create({:name=>"Vic", :address=>nil, :city=>"Castellón", :country=>"Spain", :postcode=>"12001", :price_from=>"20", :price_high_season=>"40"})
    @hotel3 = Hotel.create({:name=>"Vic", :address=>"Paseo Ribalta, 1", :city=>nil, :country=>"Spain", :postcode=>"12001", :price_from=>"20", :price_high_season=>"40"})
    @hotel4 = Hotel.create({:name=>"Vic", :address=>"Paseo Ribalta, 1", :city=>"Castellón", :country=>nil, :postcode=>"12001", :price_from=>"20", :price_high_season=>"40"})
    @hotel5 = Hotel.create({:name=>"Vic", :address=>"Paseo Ribalta, 1", :city=>"Castellón", :country=>"Spain", :postcode=>nil, :price_from=>"20", :price_high_season=>"40"})
    @hotel6 = Hotel.create({:name=>"Vic", :address=>"Paseo Ribalta, 1", :city=>"Castellón", :country=>"Spain", :postcode=>"12001", :price_from=>nil, :price_high_season=>"40"})
    @hotel7 = Hotel.create({:name=>"Vic", :address=>"Paseo Ribalta, 1", :city=>"Castellón", :country=>"Spain", :postcode=>"12001", :price_from=>"20", :price_high_season=>nil})
  end

  describe "GET #index" do
    subject {get :index}
    it "check if render index page" do
      expect(subject).to render_template(:index)
      expect(response.status).to eq(200)
    end
  end

  describe "GET new" do
    subject {get :new}
    it "check if render new page" do
      expect(subject).to render_template(:new)
      expect(response.status).to eq(200)
    end
  end

  describe "POST #create" do
    it "check if hotel is created" do
      expect(Hotel.count).to eq(1)
      expect(Hotel.last).to eq(@hotel)
    end
  end

  describe "GET #show" do
    it "check if show a selected hotel" do
      expect(Hotel.find(1)).to eq(@hotel)
    end
  end

  describe "DELETE #destroy" do
    it "check if delete hotel" do
      @hotel.destroy
      expect(Hotel.count).to eq(0)
    end
  end
end
