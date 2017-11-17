module API
  # Verifies user is authenticated before any actions are run
  class CartItemsController < ApplicationController
    before_action :authenticate_user_api!

    # Adds a product to cart
    # Finds the cart using +current_user+
    # Creates the cart if one doesn't exist
    # renders an error if the product_id is invalid
    # ==== expected Params
    #
    # * product -- the product_id to add

    def create
      if (product = Product.find_by(id: params[:product])).nil?
        render json: { message: "Invaild product_id" }, status: :bad_request
      else
        cart = Cart.find_or_create_by(user: current_user)
        cart.products << product
        render json: { message: "Item added to cart" }
      end
    end

    # Renders items in the cart in JSON
    def index
      @cart_products = if current_user.cart.present?
                         current_user.cart.carts_products.includes(:product).all
                       else
                         []
                       end
      render formats: :json
    end

    # Removes a product from the cart
    # Finds the cart using +current_user+
    # renders an error user does not have a cart or the product_id is not in the cart
    # ==== expected Params
    #
    # * id -- the product_id to add (from URL)
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
