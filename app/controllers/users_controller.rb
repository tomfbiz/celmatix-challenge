# Extends from <tt>Clearance::UsersController</tt>
#
# +after_action+ sends  welcome email afte the +create+ action is called,
# if the user was created succcessfully
#
# successful user creation is detected when +signed_in?+ returns true
# and the response.status is REDIRECT_STATUS
class UsersController < Clearance::UsersController
  after_action :send_welcome_email, only: :create

  # HTTP status for redirect (offically "found")
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
