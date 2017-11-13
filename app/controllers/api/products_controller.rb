class API::ProductsController < ApplicationController
  def index
    @products = Product.all
    # render json: Product.all
    render "api/products/index", format: :json
  end
end
