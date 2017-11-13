require "rails_helper"

RSpec.describe "Products", type: :request do
  describe "GET /api/products" do
    it "returns products" do
      2.times { create(:product) }

      get api_products_path

      expect(response).to have_http_status(200)
      expect(json["products"].size).to eq(Product.all.size)
    end
  end
end
