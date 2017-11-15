module API
  class CartItemsController < ApplicationController
    before_action :authenticate_user_api!

    def create
      if (product = Product.find_by(id: params[:product])).nil?
        render json: { message: "Invaild product_id" }, status: :bad_request
      else
        cart = Cart.find_or_initialize_by(user: current_user)
        cart.products << product
        if cart.save
          render json: { message: "Item added to cart" }
        else
          render json: { errors: cart.errors.full_messages }, status: :bad_request
        end
      end
    end

    def index
      @products = if current_user.cart.present?
                    current_user.cart.products
                  else
                    []
                  end
      render formats: :json
    end

    def destroy
      product = if current_user.cart.present?
                  current_user.cart.products.where(id: params[:id])
                end
      if product.present?
        current_user.cart.products.delete(product)
        render json: { message: "Item removed from cart" }
      else
        render json: { message: "Can't find item in cart" }, status: :not_found
      end
    end
  end
end
