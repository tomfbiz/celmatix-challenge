namespace :data do
desc "Load product data"
  task load_products: :environment do
		Product.delete_all

		file = File.read('data/products.json')
		hash = JSON.parse(file)
		products = hash["products"]
		if products.blank?
			raise "products.js file missing products key"
		else
			products.each do |product_attributes|
				Product.create!(product_attributes)
			end
			puts "#{products.size} Products loaded"
			puts "#{Product.all.size} products total now in database"
		end
	end
end
