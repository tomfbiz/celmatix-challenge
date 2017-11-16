require "rails_helper"
require "clearance/rspec"

RSpec.describe "API::Order", type: :request do
  describe "POSTs /api/products" do
    it "creates order from cart and deletes cart when logged in" do
      user = create(:user)
      cart = create(:cart, user: user)
      cart.products = create_list(:product, 3)

      post api_orders_path(as: user)

      expect(response).to have_http_status(:success)
      expect(Order.where(user: user).size).to be(1)
      expect(Cart.where(user: user).size).to be(0)
    end

    it "returns warning when no cart" do
      user = create(:user)

      post api_orders_path(as: user)

      expect(response).to have_http_status(:success)
      expect(json["message"]).to include("No cart to create order from")
    end

    it "returns unauthorized when not logged in" do
      post api_orders_path
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
