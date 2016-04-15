class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.belongs_to :hotel, index:true
      t.string :url, null: false
      t.string :language_code, null: false
      t.decimal :price, :precision => 8, :scale => 2
    end
  end
end
