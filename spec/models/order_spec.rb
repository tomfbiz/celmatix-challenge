require "rails_helper"

RSpec.describe Order, type: :model do
  context "associations" do
    it { should have_and_belong_to_many(:products) }
    it { should belong_to(:user) }
  end
end
