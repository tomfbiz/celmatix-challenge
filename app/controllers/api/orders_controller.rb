module API
  # Verifies user is authenticated before any actions are run
  class OrdersController < ApplicationController
    before_action :authenticate_user_api!

    # Creates an order with the items in the cart, using +OrderBuilder+ object
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
