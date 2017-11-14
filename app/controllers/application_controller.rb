class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception

  def authenticate_user_api!
    if current_user.blank?
      render json: { errors: "Not authenticated" }, status: :unauthorized
    end
  end
end
