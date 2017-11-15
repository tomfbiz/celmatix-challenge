require "rails_helper"
require "clearance/rspec"

RSpec.describe "CartItems", type: :request do
  describe "GET /api/cartItems" do
    it "returns products in cart" do
      user = create(:user)
      create(:cart, user: user)
      user.cart.products = create_list(:product, 3)
      create(:product)
      get api_cart_items_path(as: user)

      expect(response).to have_http_status(200)
      expect(json["products"].size).to eq(user.cart.products.size)
    end

    it "returns empty array when no cart" do
      user = create(:user)

      get api_cart_items_path(as: user)

      expect(response).to have_http_status(200)
      expect(json["products"].size).to eq(0)
    end

    it "returns an error when not logged in" do
      get api_cart_items_path

      expect(response).to have_http_status(:unauthorized)
    end
  end
end
