json.products do
  json.array! @cart_products do |cart_product|
    json.cart_product_id cart_product.id
    json.partial! "shared/product", product: cart_product.product
  end
end
