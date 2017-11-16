require "rails_helper"

RSpec.describe Order, type: :model do
  context "associations" do
    it { should have_and_belong_to_many(:products) }
    it { should belong_to(:user) }
  end

  describe "public  methods" do
    context "#build_from_cart" do
      it "creates a cart from an order" do
        user = create(:user)
        product = create(:product)
        cart = create(:cart, user: user)
        cart.products << product

        order = Order.build_from_cart(user: user)

        expect(Cart.find_by(id: cart.id)).to be_falsey
        expect(order.user).to be(user)
        expect(order.products).to eq([product])
      end

      it "returns falsey if no cart" do
        user = create(:user)

        ret = Order.build_from_cart(user: user)

        expect(ret).to be_falsey
      end
    end
  end
end
