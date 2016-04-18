class AddAmmenities < ActiveRecord::Migration
  def change
  	  add_column :hotels, :wifi, :boolean
      add_column :hotels, :pool, :boolean
  end
end
