class UsersController < Clearance::UsersController
  after_action :send_welcome_email, only: :create

  REDIRECT_STATUS = 302

  private

  def send_welcome_email
    if created_successully?
      # TODO: for a real production app,
      # remove deliver_now after configuring ActiveJob
      NotifierMailer.welcome(@user).deliver_now
    end
  end

  def created_successully?
    response.status == REDIRECT_STATUS && signed_in?
  end
end
