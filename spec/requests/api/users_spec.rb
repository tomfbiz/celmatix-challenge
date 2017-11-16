require "rails_helper"
require "clearance/rspec"

RSpec.describe "API::User", type: :request do
  describe "GET /api/users" do
    it "returns users" do
      user = create(:admin_user)
      get api_users_path(as: user)

      expect(response).to have_http_status(:success)
      expect(json["users"].size).to eq(User.count)
    end

    it "returns unauthorized when not admin" do
      user = create(:user)
      get api_users_path(as: user)

      expect(response).to have_http_status(:unauthorized)
    end

    it "returns unauthorized when not logged in" do
      get api_users_path

      expect(response).to have_http_status(:unauthorized)
    end
  end
end
