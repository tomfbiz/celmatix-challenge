require 'rails_helper'
require "clearance/rspec"


RSpec.describe UsersController, type: :controller do

  describe "POST #create" do
    it "redirects when successful" do
      user_attributes = attributes_for(:user)

      post :create, params: {user: user_attributes}
      expect(response).to redirect_to(root_path)
      

    end      

    it "sends a welcome email" do
      user_attributes = attributes_for(:user)
      
      expect { post :create, params: {user: user_attributes} }
        .to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end

end
