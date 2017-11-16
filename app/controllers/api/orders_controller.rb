module API
  class OrdersController < ApplicationController
    before_action :authenticate_user_api!

    def create
      order_builder = OrderBuilder.new(user: current_user)
      if order_builder.build
        render json: { message: "Order creates successfully" }
      else
        render json: { message: order_builder.errors.full_messages }
      end
    end
  end
end
