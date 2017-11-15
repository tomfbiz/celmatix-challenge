json.products do
  json.array! @products do |product|
    json.(product, :id, :name, :brand, :model, :desc)
    json.price pretty_number(product.price)
  end
end
