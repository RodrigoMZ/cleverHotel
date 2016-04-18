class AddPricesToHotel < ActiveRecord::Migration
  def change
  	add_column :hotels, :price_from, :decimal
  	add_column :hotels, :price_high_season, :decimal
  end
end
