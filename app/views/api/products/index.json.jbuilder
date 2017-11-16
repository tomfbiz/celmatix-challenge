json.products do
  json.array! @products do |product|
    json.partial! "shared/product", product: product
  end
end
