class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.belongs_to :hotel, index:true
      t.string :text, null: false
      t.string :combination, null: false
      t.timestamps null: false
    end
  end
end
