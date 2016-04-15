class AddColumnsToHotel < ActiveRecord::Migration
  def change
    add_column :hotels, :address, :string
    add_column :hotels, :city, :string
    add_column :hotels, :country, :string
    add_column :hotels, :postcode, :string
    add_column :hotels, :area_type, :string
    add_column :hotels, :hotel_type, :string
    add_column :hotels, :latitude, :string
    add_column :hotels, :longitude, :string
  end
end
