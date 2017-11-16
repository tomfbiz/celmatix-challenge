class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception

  def authenticate_user_api!(require: :any)
    if current_user.blank?
      render json: { errors: "Not authenticated" }, status: :unauthorized
    elsif require == :admin && !current_user.admin?
      render json: { errors: "Not admin" }, status: :unauthorized
    end
  end
end
