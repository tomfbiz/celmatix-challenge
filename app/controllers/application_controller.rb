class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception

  # Before_action filter to verify if user is logged in
  # Renders errors when failing, which will prevent the controller action from running
  # ==== Params
    #
    # * +require: :any+ - If set to :admin verifys that the logged in usr is admin
  def authenticate_user_api!(require: :any)
    if current_user.blank?
      render json: { errors: "Not authenticated" }, status: :unauthorized
    elsif require == :admin && !current_user.admin?
      render json: { errors: "Not admin" }, status: :unauthorized
    end
  end
end
