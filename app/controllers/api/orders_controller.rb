module API
  class OrdersController < ApplicationController
    before_action :authenticate_user_api!
    

    def create
      if Order.build_from_cart(user: current_user)
        render json: { message: "Order creates successfully" }
      else
        render json: { emessage: "Unable to build order" }
      end
    end
  end
end
