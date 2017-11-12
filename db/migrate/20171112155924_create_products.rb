class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name, null: false 
      t.string :brand
      t.string :model
      t.string :sku
      t.decimal :price, :decimal, :precision => 8, :scale => 2, null: false
      t.string :desc

      t.timestamps
    end
  end
end
