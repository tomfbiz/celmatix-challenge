class UsersController < Clearance::UsersController
##
# override create method to add welcome email
# TODO: send_welcome_email could go into a concern

  def create
    @user = user_from_params

    if @user.save
      sign_in @user
      send_welcome_email
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
  end

  private
  def send_welcome_email
    # TODO for a real production app, 
    # remove deliver_now after configuring Active Job
    NotifierMailer.welcome(@user).deliver_now
  end
end
  