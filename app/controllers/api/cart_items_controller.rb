module API
  class CartItemsController < ApplicationController
    before_action :authenticate_user_api!

    def create
      if (product = Product.find_by(id: params[:product])).nil?
        render json: { message: "Invaild product_id" }, status: :bad_request
      else
        cart = Cart.find_or_create_by(user: current_user)
        cart.products << product
        render json: { message: "Item added to cart" }
      end
    end

    def index
      @cart_products = if current_user.cart.present?
                         current_user.cart.carts_products.includes(:product).all
                       else
                         []
                       end
      render formats: :json
    end

    def destroy
      if current_user.cart.present? && current_user.cart.carts_products.where(id: params[:id]).present?
        current_user.cart.carts_products.delete(params[:id])
        render json: { message: "Item removed from cart" }
      else
        render json: { message: "Can't find item in cart" }, status: :not_found
      end
    end
  end
end
