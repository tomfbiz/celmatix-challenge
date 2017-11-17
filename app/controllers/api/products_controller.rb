module API
  # Verifies user is authenticated as admin before the +create+ actions is run
  class ProductsController < ApplicationController
    before_action only: :create do
      authenticate_user_api!(require: :admin)
    end

    # Renders all +prodiuct+ records as JSON
    def index
      @products = Product.all
      render formats: :json
    end

    # Creates a product record
    #
    # ==== Params
    # * +name+
    # * +brand+
    # * +model+
    # * +sku+
    # * +price+
    # * +desc+
    def create
      product = Product.create(product_params)
      if product.save
        render json: { message: "Product Saved successfully" }
      else
        render json: { errors: product.errors.full_messages }, status: :bad_request
      end
    end

    private

    def product_params
      params.require(:product).permit(:name, :brand, :model, :sku, :price, :desc)
    end
  end
end
