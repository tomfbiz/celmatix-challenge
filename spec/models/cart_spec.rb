require "rails_helper"

RSpec.describe Cart, type: :model do
  context "associations" do
    it { should have_and_belong_to_many(:products) }
    it { should belong_to(:user) }
  end

  context "validations" do
    it "validates uniqueness of user" do
      # shoulda velidates uniqueness does not work with associations
      user = create(:user)
      create(:cart, user: user)
      cart2 = build(:cart, user: user)

      expect(cart2.valid?).to be_falsey
    end
  end
end
