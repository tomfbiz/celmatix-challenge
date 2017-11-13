json.products do 
  json.array! @products do |product|
    json.(product, :id, :name, :brand, :model, :sku, :price, :desc)
  end
end