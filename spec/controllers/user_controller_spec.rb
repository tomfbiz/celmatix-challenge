require 'rails_helper'
require "clearance/rspec"


RSpec.describe UsersController, type: :controller do

  describe "POST #create" do
    it "returns success" do
      user_attributes = attributes_for(:user)

      post :create, params: {user: user_attributes}
      expect(response).to have_http_status(:success)
      

    end      

    it "sends a welcome email" do
      user_attributes = attributes_for(:user)
      
      expect(post :create, params: {user: user_attributes})
        .to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end

end
