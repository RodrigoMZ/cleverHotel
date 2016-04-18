class AddStars < ActiveRecord::Migration
  def change
  	add_column :hotels, :stars, :integuer
  end
end
