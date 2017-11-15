require "rails_helper"
require "clearance/rspec"

RSpec.describe API::CartItemsController, type: :controller do
  describe "create" do
    it "creates a cart with item" do
      user = create(:user)
      sign_in_as(user)
      product = create(:product)

      post :create, params: { product: product.id }

      expect(response).to have_http_status(:success)
      expect(user.cart).to be_truthy
      expect(user.cart.products.first).to eq(product)
    end

    it "fails when not logged in" do
      product = create(:product)

      post :create, params: { product: product.id }

      expect(response).to have_http_status(:unauthorized)
    end
    it "fails when product id is invalid" do
      user = create(:user)
      sign_in_as(user)

      post :create, params: { product: -99 }

      expect(response).to have_http_status(:bad_request)
      expect(user.cart).to be_nil
    end
  end
  describe "create" do
    it "lists items" do
      user = create(:user)
      sign_in_as(user)
      product = create(:product)
      create(:cart, user:user, products: [product])
      get :index

      expect(response).to have_http_status(:success)
      expect(user.cart).to be_truthy
      expect(user.cart.products.first).to eq(product)
    end

    it "fails when not logged in" do
      product = create(:product)

      post :create, params: { product: product.id }

      expect(response).to have_http_status(:unauthorized)
    end
    it "fails when product id is invalid" do
      user = create(:user)
      sign_in_as(user)

      post :create, params: { product: -99 }

      expect(response).to have_http_status(:bad_request)
      expect(user.cart).to be_nil
    end
  end
end
