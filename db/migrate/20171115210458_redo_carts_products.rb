class RedoCartsProducts < ActiveRecord::Migration[5.1]
  def change
    drop_table :carts_products;
    create_table :carts_products do |t|
      t.belongs_to :cart, foreign_key: true
      t.belongs_to :product, foreign_key: true
    end

  end
end
