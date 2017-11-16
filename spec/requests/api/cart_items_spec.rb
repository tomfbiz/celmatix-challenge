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

  describe "DELETE /api/cartItems" do
    it "deletes item from cart" do
      user = create(:user)
      create(:cart, user: user)
      products = create_list(:product, 3)
      user.cart.products = products
      delete api_cart_item_path(user.cart.carts_products.first.id, as: user)

      expect(response).to have_http_status(200)
      expect(user.cart.reload.products).to eq([products[1], products[2]])
    end

    it "returns not_found when no cart" do
      user = create(:user)
      product = create(:product)
      delete api_cart_item_path(product.id, as: user)

      expect(response).to have_http_status(:not_found)
    end

    it "returns not_found when item not in cart" do
      user = create(:user)
      cart = create(:cart, user: user)
      cart.products << create(:product)
      delete api_cart_item_path(-999, as: user)

      expect(response).to have_http_status(:not_found)
    end

    it "returns an error when not logged in" do
      get api_cart_items_path

      expect(response).to have_http_status(:unauthorized)
    end
  end
end
