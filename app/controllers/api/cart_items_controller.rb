module API
  class CartItemsController < ApplicationController
    before_action :authenticate_user_api!

    def create
      if (product = Product.find_by(id: params[:product])).nil?
        render json: { message: "invaild product_idt" }, status: :bad_request
      else
        cart = Cart.find_or_initialize_by(user: current_user)
        cart.products << product
        if cart.save
          render json: { message: "Card Item added" }
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
  end
end
