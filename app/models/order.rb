class Order < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :products, dependent: :destroy

  def self.build_from_cart(user:)
    my_order = nil
    if cart = user.cart
      transaction do
        my_order = create(user: user)
        my_order.products = cart.products
        cart.destroy
      end
    end
    my_order
  end
end
