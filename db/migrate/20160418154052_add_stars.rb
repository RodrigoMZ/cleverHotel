class AddStars < ActiveRecord::Migration
  def change
  	add_column :hotels, :stars, :integer
  end
end
