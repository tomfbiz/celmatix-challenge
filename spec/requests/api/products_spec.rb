require "rails_helper"
TEST_SKU = 1234543

RSpec.describe "Products", type: :request do
  describe "GET /api/products" do
    it "returns products" do
      2.times { create(:product) }

      get api_products_path

      expect(response).to have_http_status(:success)
      expect(json["products"].size).to eq(Product.all.size)
    end
  end

  describe "POSTs /api/products" do
    it "creates products when logged in as admin" do
      user = create(:admin_user)
      post api_products_path(as: user), params: { product: attributes_for(:product, sku: TEST_SKU) }

      expect(response).to have_http_status(:success)
      expect(Product.find_by(sku: TEST_SKU)).to be_truthy
    end

    it "fails when not admin" do
      user = create(:user)
      post api_products_path(as: user), params: { product: attributes_for(:product, sku: TEST_SKU) }

      expect(response).to have_http_status(:unauthorized)
      expect(Product.find_by(sku: TEST_SKU)).to be_falsey
    end
  end
end
