json.products do
  json.array! @cart_products do |cart_product|
    json.cart_product_id cart_product.id
    json.(cart_product.product, :name, :brand, :model, :desc)
    json.price pretty_number(cart_product.product.price)
  end
end
