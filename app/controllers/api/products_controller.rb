module API
  class ProductsController < ApplicationController
    def index
      @products = Product.all
      render formats: :json
    end
  end
end
