module API
  class OrdersController < ApplicationController
    class OrderBuilder
      attr_reader :errors

      def initialize(user:)
        @user = user
        @errors = []
      end

      def build
        my_order = nil
        if cart = user.cart
          Order.transaction do
            my_order = Order.create(user: user)
            my_order.products = cart.products
            cart.destroy
          end
        else
          error = Struct.new(:full_messages).new
          error.full_messages = ["No cart to create order from"]
          @errors = error
        end
        my_order
      end

      private

      attr_reader :user
    end
  end
end
