class RemovePricesToLang < ActiveRecord::Migration
  def change
  	remove_column :languages, :price
  end
end
