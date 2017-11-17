module API
  class OrdersController < ApplicationController
    # Plain Old Ruby Object to create an +order+ out of a +cart+
    class OrderBuilder
      # Object containing error messages when build fails.
      # Built like a ruby error object.
      # Responds to +full_messages+ with an array of strings
      attr_reader :errors

      # Pass in current user, who's cart you want to use
      def initialize(user:)
        @user = user
        @errors = []
      end

      # Finds the cart for the passed in user, and copies products into
      # a new +order+ for that user, then calls +destroy+ on +order+.
      #
      # Returns false and sets the error attribute
      # if user does not exist or does not have a cart.
      def build
        my_order = nil
        if cart = user && user.cart
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
