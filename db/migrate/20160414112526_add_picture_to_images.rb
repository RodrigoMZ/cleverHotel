class AddPictureToImages < ActiveRecord::Migration
  def change
    add_column :images, :picture, :string
    add_column :images, :logo, :string
  end
end
