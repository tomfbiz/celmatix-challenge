require "rails_helper"

RSpec.describe User, type: :model do
  context "associations" do
    it { should have_one(:cart) }
  end

  describe "public  methods" do
    context "#is_admin" do
      it "should return true if admin set" do
        user = create(:user, admin: true)
        expect(user.admin?).to be(true)
      end

      it "should return true if default admin" do
        user = create(:user, email: User::DEFAULT_ADMIN_EMAIL)
        expect(user.admin?).to be(true)
      end
    end
  end
end
